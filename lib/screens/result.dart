import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  const ResultScreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(height.toString(), style: TextStyles.bodyText),
        Text(weight.toString(), style: TextStyles.bodyText)
      ],
    );
  }
}
