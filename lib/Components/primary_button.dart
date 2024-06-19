import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{
  final String btnText;
  final VoidCallback onPressed;
  const PrimaryButton({required this.btnText, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          )
      ),
    );
  }
}