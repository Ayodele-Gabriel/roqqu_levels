import 'package:flutter/material.dart';

import 'dart:math';

import 'package:roqqu_levels/utilities/colors.dart';
import 'package:roqqu_levels/utilities/toggles.dart';


List<bool> isSelected = [true, false, false];

enum InUse {
  buy,
  sell
}

class BuySell extends StatefulWidget {
  const BuySell({super.key});

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {
  InUse? selection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 18.0, left: 19.0, right: 19.0),
          child: Container(
            height: 28.0,
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
                minWidth:
                MediaQuery.of(context).size.width * 0.9 / max(1, isSelected.length),
              ),
              children: const [
                Toggles(text: 'Buy',),
                Toggles(text: 'Sell',),
              ],
              onPressed: (int newIndex) {
                setState(() {
                  for (int index = 0; index < isSelected.length; index++) {
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
      ],
    );
  }
}

