import 'package:flutter/material.dart';

import '../lib/utilities/appColors.dart';

class BottomButton extends StatelessWidget {
  IconData buttonIcon;
  Function buttonAction;

  BottomButton({required this.buttonIcon, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction(),
      child: Container(
        margin: EdgeInsets.all(5.0),
        height: 10.0,
        width: 85.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(
            color: MutedBlack,
            width: 2,
          ),
        ),
        child: Icon(
          buttonIcon,
          color: MutedBlack,
          size: 45.0,
        ),
      ),
    );
  }
}
