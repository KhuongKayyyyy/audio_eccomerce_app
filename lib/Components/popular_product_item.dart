import 'package:audio_ecommerce_app/Views/product_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Models/product.dart';

class PopularProductItem extends StatelessWidget{
  Product product;
  PopularProductItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: product)));
        },
        child:  Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: product.imageUrls.first,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,style: const TextStyle(fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text("USD ${product.price}",style: const TextStyle(fontWeight: FontWeight.bold),),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.star,color: Color(0xFFFFC120),),
                      Text("${product.calculateAverageStarRating()}",style: const TextStyle(fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Text("${product.reviews?.length} reviews",style: const TextStyle(fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {  },
              ),
            )
          ],
        ),
      )
    );
  }
}