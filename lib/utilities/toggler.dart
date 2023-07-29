import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roqqu_levels/utilities/colors.dart';
import 'package:roqqu_levels/utilities/toggles.dart';

List<bool> isSelected = [true, false, false];

enum InUse {
  charts,
  orderBook,
  recentTrades,
}

class Toggler extends StatefulWidget {
  const Toggler({super.key});

  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  InUse? selection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 18.0, left: 19.0, right: 19.0),
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
                minWidth:
                    MediaQuery.of(context).size.width * 0.9 / max(1, isSelected.length),
              ),
              children: const [
                Toggles(text: 'Charts',),
                Toggles(text: 'Orderbook',),
                Toggles(text: 'Recent trades',),
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

