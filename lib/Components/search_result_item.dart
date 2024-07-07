import 'package:audio_ecommerce_app/Data/fake_data.dart';
import 'package:audio_ecommerce_app/Views/product_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Models/product.dart';

class SearchResultItem extends StatelessWidget {
  final Product product;

  SearchResultItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: product)));
      },
      child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrls.first,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name,
                ),
                Text(
                  "USD ${product.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFC120),
                    ),
                    Text('${product.calculateAverageStarRating()}'),
                    const SizedBox(width: 10),
                    Text("${product.reviews?.length ?? 0} reviews"),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
      ),
    );
  }
}
