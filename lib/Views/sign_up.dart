import 'package:audio_ecommerce_app/Components/primary_button.dart';
import 'package:audio_ecommerce_app/Components/sign_in_text_field.dart';
import 'package:audio_ecommerce_app/Utils/theme.dart';
import 'package:audio_ecommerce_app/Views/sign_in.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  const SizedBox(height: 20,),
                  PrimaryButton(btnText: "Sign Up", onPressed: (){}),
                  const SizedBox(height: 40,),
                  //Media sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        )
                      ),
                      const SizedBox(width: 20,),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                          )
                      ),
                      const SizedBox(width: 20,),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.heart_broken,
                                color: Colors.pinkAccent,
                                size: 40,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "If you have an account? ",
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
                                    builder: (context) => const SignIn()
                                )
                            );
                          },
                          child: Text(
                            "Sign In here",
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
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          )
      ),
    );
  }
}
