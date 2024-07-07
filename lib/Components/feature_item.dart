import 'package:audio_ecommerce_app/Models/feature.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class FeatureItem extends StatelessWidget{
  Feature feature;
  FeatureItem({super.key, required this.feature});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: feature.imageUrl,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                      feature.description
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}