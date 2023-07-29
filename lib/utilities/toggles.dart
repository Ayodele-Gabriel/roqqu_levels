import 'package:flutter/material.dart';

import 'constants.dart';

class Toggles extends StatelessWidget {
  const Toggles({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(text, style: kText6,),
    );
  }
}