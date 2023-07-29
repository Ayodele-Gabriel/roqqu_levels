import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_levels/utilities/buy_sell.dart';
import 'package:roqqu_levels/utilities/colors.dart';
import 'package:roqqu_levels/utilities/constants.dart';
import 'package:roqqu_levels/utilities/toggles.dart';

class Buy extends StatefulWidget {
  const Buy({
    super.key,
    required this.isChecked,
    required this.callback,
  });

  final bool isChecked;
  final Function(bool?) callback;

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 18.0, left: 19.0, right: 19.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: RoqquColors.color4,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ToggleButtons(
                        renderBorder: false,
                        isSelected: isSelected,
                        selectedColor: Colors.white,
                        fillColor: RoqquColors.color6,
                        borderRadius: BorderRadius.circular(10.0),
                        highlightColor: RoqquColors.color5,
                        color: Colors.white,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width *
                              0.8 /
                              max(1, isSelected.length),
                        ),
                        children: const [
                          Toggles(
                            text: 'Limit',
                          ),
                          Toggles(
                            text: 'Market',
                          ),
                          Toggles(
                            text: 'Stop Limit',
                          ),
                        ],
                        onPressed: (int newIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected[index] = true;
                              } else {
                                isSelected[index] = false;
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TextField(
              text1: 'Limit Price',
              widget: Text(
                '0.00 USD',
                style: kText13,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const TextField(
              text1: 'Amount',
              widget: Text(
                '0.00 USD',
                style: kText13,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              text1: 'Type',
              widget: Row(
                children: const [
                  Text(
                    'Good till cancelled',
                    style: kText13,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 15.0,
                    color: RoqquColors.color3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide(color: RoqquColors.color6),
                      bottom: BorderSide(color: RoqquColors.color6),
                      right: BorderSide(color: RoqquColors.color6),
                      left: BorderSide(color: RoqquColors.color6),
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Checkbox(
                    value: widget.isChecked,
                    onChanged: widget.callback,
                    side: BorderSide.none,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'Post Only',
                  style: kText13,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.info_outline_rounded,
                  size: 16.0,
                  color: RoqquColors.color3,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total',
                  style: kText13,
                ),
                Text(
                  '0.00',
                  style: kText13,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: 321,
              height: 32,
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(1.00, -0.00),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0xFFDD568D),
                    Color(0xFF7847E1),
                    Color(0xFF483BEB)
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Center(
                child: Text(
                  'Buy BTC',
                  style: kText14,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total account value',
                  style: kText13,
                ),
                Row(
                  children: const [
                    Text(
                      'NGN',
                      style: kText13,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16.0,
                      color: RoqquColors.color3,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('0.00'),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Open Orders',
                  style: kText13,
                ),
                Text(
                  'Available',
                  style: kText13,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('0.00'),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  width: 80.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: RoqquColors.color16,
                  ),
                  child: GestureDetector(
                    child: const Center(
                      child: Text('Deposit'),
                    ),
                    onTap: () {},
                  )),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({super.key, required this.text1, required this.widget});

  final String text1;
  //final String text2;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322.0,
      height: 40.0,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: RoqquColors.color7),
          bottom: BorderSide(color: RoqquColors.color7),
          right: BorderSide(color: RoqquColors.color7),
          left: BorderSide(color: RoqquColors.color7),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CupertinoTextField(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            prefix: Row(
              children: [
                Text(
                  text1,
                  style: kText13,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Icon(
                  Icons.info_outline_rounded,
                  size: 16.0,
                  color: RoqquColors.color3,
                ),
              ],
            ),
            suffix: widget),
      ),
    );
  }
}
