import 'package:flutter/material.dart';
import 'package:roqqu_levels/utilities/constants.dart';
import 'colors.dart';
import 'package:order_book/order_book.dart';

const List<String> orderNumber = [
  '10',
  '9',
  '8',
  '7',
  '6',
  '5',
  '4',
  '3',
  '2',
  '1',
];

class Orderbook extends StatefulWidget {
  const Orderbook({super.key});

  @override
  State<Orderbook> createState() => _OrderbookState();
}

class _OrderbookState extends State<Orderbook> {
  String dropdownValue = '10';

  DropdownButton<String> dropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String number in orderNumber) {
      var newMenu = DropdownMenuItem(
        value: number,
        child: Text(
          number,
          style: kText7,
        ),
      );

      dropDownItems.add(newMenu);
    }

    return DropdownButton<String>(
        value: dropdownValue,
        underline: Container(
          color: Colors.transparent,
        ),
        menuMaxHeight: 100.0,
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: RoqquColors.color13,
          weight: 5.5,
        ),
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            dropdownValue = value.toString();
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 19.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 8.0,
                  ),
                  Image.asset(
                    'assets/icons/icon1.png',
                    height: 10.0,
                    width: 12.0,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  Image.asset(
                    'assets/icons/icon2.png',
                    height: 10.0,
                    width: 12.0,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  Image.asset(
                    'assets/icons/icon3.png',
                    height: 10.0,
                    width: 12.0,
                  ),
                  const SizedBox(
                    width: 220.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 63.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: RoqquColors.color12,
                        ),
                        child: Center(
                          child: dropDown(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: OrderBookWidget(
              pair: 'btcusdt',
              count: 5,
              loaderColor: RoqquColors.color9,
              onClick: (value) {
                //print(value.toString());
              },
              priceWidget: Column(
                children: const [
                  Text('Price', style: kText13,),
                  Text('(USDT)', style: kText13,),
                ],
              ),
              volumeWidget: Column(
                children: const [
                  Text('Amounts', style: kText13,),
                  Text('(BTC)', style: kText13),
                ],
              ),
              buyPriceStyle: kText11,
              buyVolumeStyle: kText9,
              sellPriceStyle: kText10,
              sellVolumeStyle: kText9,
            ),
          ),
        ],
      ),
    );
  }
}
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children:  [
// Text(
// '36920.12',
// style: kText10,
// ),
// Text(
// '0.758965',
// style: kText9,
// ),
// Text(
// '28,020.98',
// style: kText9,
// ),
// ],
// ),
// const SizedBox(
// height: 25.0,
// ),
