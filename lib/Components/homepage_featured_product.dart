import 'package:audio_ecommerce_app/Models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class HomepageFeaturedProduct extends StatelessWidget{
  Product product;
  HomepageFeaturedProduct({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: 155,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: product.imageUrls.first,
              ),
            ),
            Text(
                product.name,
              style:const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
                "USD ${product.price}",
              style:const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      )
    );
  }
}