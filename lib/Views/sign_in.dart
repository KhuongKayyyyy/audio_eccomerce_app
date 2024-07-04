import 'package:audio_ecommerce_app/Components/primary_button.dart';
import 'package:audio_ecommerce_app/Components/sign_in_text_field.dart';
import 'package:audio_ecommerce_app/Views/homepage.dart';
import 'package:audio_ecommerce_app/Views/sign_up.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              "https://pbs.twimg.com/profile_images/1376486561282289674/gIe4ZYfu_400x400.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text(
                  "Audio",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                    "It's modular and designed to last",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                SignInTextField(type: "Email",),
                const SizedBox(height: 20,),
                SignInTextField(type: "Password",),
                TextButton(
                  onPressed: (){},
                  child: const Text(
                    "Forgot password ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                ),
                PrimaryButton(btnText: "Sign In"
                    , onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage()
                    )
                  );
                    }
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't have any account? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp()
                            )
                          );
                        },
                        child: Text(
                          "Sign Up here",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
