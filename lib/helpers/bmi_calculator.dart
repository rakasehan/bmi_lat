import 'package:bmi/constants/constants.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;
  
  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi){
      // this.bmi = bmi;
  }

  double calculateBmi(){
      double heightInMeter = height! / 100;

      //final h = pow(height, 2);
      final h = (heightInMeter * heightInMeter);
      bmi = weight! / h;

    return bmi!;
  }

    String DetermineBmiCategory(){

      String category = "";
      if (bmi! < 16){
        category = underweightSevere;
      } else if (bmi! < 17) {
        category = underweightModerate;
      } else if (bmi! < 18.5) {
        category = underweightMild;
      } else if (bmi! < 25) {
        category = normal;
      } else if (bmi! < 30) {
        category = overweight;
      } else if (bmi! < 35) {
        category = obeseI;
      } else if (bmi! < 40) {
        category = obeseII;
      } else if (bmi! >= 40) {
        category = obeseIII;
      }
      bmiCategory=category;
      return bmiCategory!;
    }

      String getHealRiskDescription(){
        String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible Nutritional Deficiency and Osteoporosis. ";
        break;
      case normal:
        desc = "Low risk (healty range). ";
        break;
      case overweight:
        desc = "Moderate risk of developing heart disease, high blood presure, stroke, diabetes mellitus. ";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc = "Moderate risk of developing heart disease, high blood presure, stroke, diabetes mellitus, Metabolyc Syndrome. ";
        break;
      default:
    }
    bmiDescription = desc;
    return desc;
  }

}