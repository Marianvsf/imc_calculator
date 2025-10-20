import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 170; // variable to store the initial height

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Height".toUpperCase(), style: TextStyles.bodyText),
        Text("$height cm", style: TextStyles.bodyText),
        Slider(
          value: height,
          onChanged: (newHeight) {
            setState(() {
              height = newHeight;
            });
          },
          min: 140,
          max: 220,
          divisions: 1,
        )
      ],
    );
  }
}
