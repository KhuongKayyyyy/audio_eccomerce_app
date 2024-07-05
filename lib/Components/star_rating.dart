import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // Rating value from 0 to 5

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return const Icon(Icons.star, color: Color(0xFFFFC120),size: 20,);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey,size: 20,);
        }
      }),
    );
  }
}