import 'package:audio_ecommerce_app/Models/product.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomepageProduct extends StatelessWidget {
  final Product product;
  HomepageProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "Shop Now",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                imageUrl: product.imageUrls.first,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
