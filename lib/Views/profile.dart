import 'package:audio_ecommerce_app/Components/profile_section.dart';
import 'package:audio_ecommerce_app/Data/fake_data.dart';
import 'package:audio_ecommerce_app/Views/sign_in.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const
        Text(
            "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl: FakeData.systemUser.imgURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FakeData.systemUser.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        FakeData.systemUser.account,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 30, // Space above and below the divider
              thickness: 0.5, // Thickness of the divider line
              color: Colors.grey, // Color of the divider line
            ),
          //general  setting section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "General",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ProfileSection(settingType: "Edit Profile"),
            ProfileSection(settingType: "Notifications"),
            ProfileSection(settingType: "Wishlist"),

            // legal section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Legal",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ProfileSection(settingType: "Terms of use"),
            ProfileSection(settingType: "Privacy Policy"),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Personal",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ProfileSection(settingType: "Report a bug"),
            ProfileSection(settingType: "Log out",onTap: (){
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignIn()),
                    (Route<dynamic> route) => false,
              );
            },),
          //
          ],
        )
    );
  }
}