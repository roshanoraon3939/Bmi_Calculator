import 'package:bmi_calculator/calulator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_button.dart';


enum Gender{
  male , female ,
}


class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender ;
  int height = 180 ;
  int weight = 50 ;
  int age = 12 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress:() {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.male, label: 'MALE',),
              ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female ;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
              cardChild:IconContent(icon: FontAwesomeIcons.female, label: 'FEMALE',),
              ),
              ),
            ],
            ),
          ),
          Expanded(child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kBoxTextStyle ,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'cm',
                      style : kLabelTextStyle,
                    ),

                  ],
                ),
             SliderTheme(
               data: SliderTheme.of(context).copyWith(
                 activeTrackColor: Color(0xFFEB1555),
                 inactiveTrackColor: Color(0xFF8D8E98),
                 overlayColor: Color(0x29FFFFFF),
                 thumbColor: Color(0xFFFFFFFF),
                 thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                 overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

               ),
               child: Slider(
            value: height.toDouble(),
            min: 80.0,
            max: 250,
            onChanged: (double newValue){
                setState(() {
                  height = newValue.round();
                });
            },
          ),
             )
              ],
            ),
          )

              ),
          Expanded(child: Row(
                  children: [
                    Expanded(child: ReusableCard(
                      colour: kActiveCardColor,
                     cardChild:  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic,
                           children: [
                             Text(
                               weight.toString(),
                               style: kBoxTextStyle ,
                             ),
                             SizedBox(
                               width: 10.0,
                             ),
                             Text(
                               'kg',
                               style : kLabelTextStyle,
                             ),

                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                         ),
                       ],
                     ),
                    ),
                ),
                     Expanded(child:ReusableCard(
                       colour: kActiveCardColor,
                        cardChild:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text(
                              'AGE',
                              style: kLabelTextStyle,
                                ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  age.toString(),
                                  style: kBoxTextStyle ,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'yrs',
                                  style : kLabelTextStyle,
                                ),

                              ],
                            ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                     setState(() {
                                          age--;
                                                });
                                      },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                 ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                     onPressed: (){
                                    setState(() {
                                          age++;
                                              });
                                        },
                                  ),
                               ],
                              ),
                          ],
                   ),
                ),
            ),
            ]
          ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height , weight: weight);

            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResultPage(
                bmiResults: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
              ),
            );
          },
          ),
        ],
            ),
          );

  }
}




