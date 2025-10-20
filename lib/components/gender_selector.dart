import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender; // variable to save the gender

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Male
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Male";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 8, bottom: 16, left: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: selectedGender == "Male"
                        ? AppColors.backgroundComponentSelected
                        : AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      SizedBox(height: 8),
                      Text("Male".toUpperCase(), style: TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Female
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Female";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, bottom: 16, left: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: selectedGender == "Female"
                        ? AppColors.backgroundComponentSelected
                        : AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Female".toUpperCase(), style: TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
