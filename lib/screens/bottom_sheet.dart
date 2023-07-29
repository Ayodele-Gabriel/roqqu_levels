import 'package:flutter/material.dart';
import 'package:roqqu_levels/utilities/buy.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../utilities/colors.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF000000),
        width: MediaQuery.of(context).size.width,
        height: 700.0,
        child: Container(
          padding: const EdgeInsets.only(top: 30.0),
          decoration: const BoxDecoration(
            color: RoqquColors.color4,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: RoqquColors.color4,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ToggleSwitch(
                      minWidth: 326.0,
                      borderWidth: 5.0,
                      activeBgColor: const [RoqquColors.color12],
                      inactiveBgColor: RoqquColors.color4,
                      totalSwitches: 2,
                      labels: const[
                        'Buy',
                        'Sell',
                      ],
                    )),
              ),
              Buy(
                isChecked: false,
                callback: (bool? value) {},
              ),
            ],
          ),
        ));
  }
}
