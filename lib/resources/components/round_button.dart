

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final title;
  final loading;
  final VoidCallback onPress;
  const RoundButton({super.key,
    required this.title,
    required this.onPress,
    this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(17)
        ),
        child: Center(child:loading ? CircularProgressIndicator(color: Colors.white,):
        Text(title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white),)),
      ),
    );
  }
}
