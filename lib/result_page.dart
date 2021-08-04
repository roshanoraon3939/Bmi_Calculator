import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class  ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResults,@required this.interpretation ,@required this.resultText});
  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(
              'YOUR RESULT',
              style: kTitleTextStyle,

            ),
          ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Text(
                  resultText.toUpperCase(),
                  style: kResultTextStyle,
                  textAlign: TextAlign.center,
                  ),
              Text(
                    bmiResults,
                    style: kBMItextstyle,
                    textAlign: TextAlign.center,
                  ),
              Text(
                    interpretation,
                    style: kLineText,
                    textAlign: TextAlign.center,
                  ),
             ],
          ),
          ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
              buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
