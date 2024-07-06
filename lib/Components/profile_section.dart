import 'package:flutter/material.dart';
class ProfileSection extends StatelessWidget{
  String settingType;
  final VoidCallback? onTap;
  ProfileSection({required this.settingType, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Text(settingType),
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}