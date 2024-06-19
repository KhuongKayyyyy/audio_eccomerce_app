import 'package:audio_ecommerce_app/Utils/theme.dart';
import 'package:audio_ecommerce_app/Views/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme, // Apply the custom theme
      home: const SignIn(), // Set SignIn as the home widget
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Press Me'),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
