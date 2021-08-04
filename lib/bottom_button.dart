import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap , @required this.buttonTitle});

  final Function onTap ;
  final String buttonTitle ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 25.0,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}