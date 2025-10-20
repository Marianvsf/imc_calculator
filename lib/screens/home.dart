import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                  child: NumberSelector(
                      title: "PESO",
                      value: selectedWeight,
                      onDecrement: () {
                        setState(() {
                          selectedWeight--;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          selectedWeight++;
                        });
                      })),
              SizedBox(width: 16),
              Expanded(
                  child: NumberSelector(
                      title: "EDAD",
                      value: selectedAge,
                      onDecrement: () {
                        setState(() {
                          selectedAge--;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          selectedAge++;
                        });
                      }))
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                      backgroundColor:
                          WidgetStateProperty.all(AppColors.primary)),
                  child: Text(
                    "Calculate",
                    style: TextStyles.bodyText,
                  ))),
        )
      ],
    );
  }
}
