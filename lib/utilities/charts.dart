import 'dart:convert';

import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;

enum InUse {
  oneHour,
  twoHours,
  fourHours,
  oneDay,
  oneWeek,
  oneMonth,
}

enum ViewType { tradingView, depth }

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  InUse? selection = InUse.oneDay;
  ViewType view = ViewType.tradingView;

  List<Candle> candles = [];

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 19.0),
          child: SizedBox(
            height: 25.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const Center(
                  child:  Text(
                    'Time',
                    style: TextStyle(
                      color: RoqquColors.color3,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Time(
                  color: selection == InUse.oneHour
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      selection = InUse.oneHour;
                    });
                  },
                  text: '1H',
                ),
                Time(
                  color: selection == InUse.twoHours
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      selection = InUse.twoHours;
                    });
                  },
                  text: '2H',
                ),
                Time(
                  color: selection == InUse.fourHours
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      selection = InUse.fourHours;
                    });
                  },
                  text: '4H',
                ),
                Time(
                  color: selection == InUse.oneDay
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      selection = InUse.oneDay;
                    });
                  },
                  text: '1D',
                ),
                Time(
                  color: selection == InUse.oneWeek
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      selection = InUse.oneWeek;
                    });
                  },
                  text: '1W',
                ),
                Time(
                  color: selection == InUse.oneMonth
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      selection = InUse.oneMonth;
                    });
                  },
                  text: '1M',
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: RoqquColors.color3,
                ),
                Image.asset(
                  'assets/icons/line.png',
                  width: 1.0,
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Image.asset(
                    'assets/icons/candlechart.png',
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                Image.asset(
                  'assets/icons/line.png',
                  width: 1.0,
                  height: 25.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                const Center(
                  child: Text(
                    'Fx Indicators',
                    style: TextStyle(
                      color: RoqquColors.color3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18.0),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: RoqquColors.color6),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 19.0),
          child: Row(
            children: [
              SizedBox(
                width: 120.0,
                height: 28.0,
                child: Time(
                  color: view == ViewType.tradingView
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      view = ViewType.tradingView;
                    });
                  },
                  text: 'Trading View',
                ),
              ),
              const SizedBox(width: 20.0),
              SizedBox(
                width: 70.0,
                height: 28.0,
                child: Time(
                  color: view == ViewType.depth
                      ? RoqquColors.color6
                      : RoqquColors.color1,
                  onTap: () {
                    setState(() {
                      view = ViewType.depth;
                    });
                  },
                  text: 'Depth',
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Image.asset(
                'assets/icons/expand.png',
                height: 16.67,
                width: 16.67,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: 453.0,
            width: MediaQuery.of(context).size.width,
            child: Candlesticks(candles: candles)),
        //Image.asset('assets/images/pips.png'),
      ],
    );
  }
}

class Time extends StatelessWidget {
  const Time(
      {super.key,
      required this.color,
      required this.onTap,
      required this.text});

  final Color? color;
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 28.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: color),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14.0,
              color: RoqquColors.color3,
            ),
          ),
        ),
      ),
    );
  }
}
