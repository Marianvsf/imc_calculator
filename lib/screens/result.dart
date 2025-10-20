import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ResultScreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu resultado:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(getResultbyImc(imcResult),
                        style: TextStyle(
                            fontSize: 30,
                            color: getColorByImc(imcResult),
                            fontWeight: FontWeight.w600)),
                    Text(imcResult.toStringAsFixed(2),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 76,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        geTDescriptionbyImc(imcResult),
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(weight.toString(), style: TextStyle(color: Colors.black)),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    backgroundColor:
                        WidgetStateProperty.all(AppColors.primary)),
                child: Text("Finish", style: TextStyles.bodyText)),
          )
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      title: Text("Result"),
    );
  }

  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // Low
      < 24.9 => Colors.green, // Normal
      < 29.99 => Colors.orange, // overweight
      _ => Colors.red // obeesity
    };
  }

  String getResultbyImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "IMC Low", // Low
      < 24.9 => "IMC Normal", // Normal
      < 29.99 => "Overweight", // overweight
      _ => "Obesity" // obesity
    };
  }

  String geTDescriptionbyImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Your weight is below the recommended weight.", // Low
      < 24.9 => "Your weight is within the healthy range.", // Normal
      < 29.99 => "You are overweight, watch your diet.", // overweight
      _ => "You are obese, consult a specialist." // obesity
    };
  }
}
