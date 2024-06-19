import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget{
  String type;
  SignInTextField({required this.type});

  @override
  Widget build(BuildContext context) {
    IconData getIcon() {
      switch (type) {
        case 'Email':
          return Icons.email_outlined;
        case 'Password':
          return Icons.lock_outline;
        case 'Username':
          return Icons.person_outline;
        default:
          return Icons.help_outline;
      }
    }

    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.grey,
              width: 100
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        labelText: type,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          getIcon(),
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}