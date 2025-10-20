import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/core/app_colors.dart';
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
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundComponent,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text("Height".toUpperCase(), style: TextStyles.bodyText),
            Text("${height.toStringAsFixed(0)} cm",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold)),
            Slider(
                value: height,
                onChanged: (newHeight) {
                  setState(() {
                    height = newHeight;
                  });
                },
                min: 140,
                max: 220,
                divisions: 80,
                label: "${height.toStringAsFixed(0)} cm",
                activeColor: AppColors.primary)
          ],
        ),
      ),
    );
  }
}
