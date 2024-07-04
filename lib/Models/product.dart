import 'package:audio_ecommerce_app/Models/feature.dart';
import 'package:audio_ecommerce_app/Models/review.dart';

class Product {
  String name;
  double price;
  List<Feature> features;
  List<String> imageUrls;
  List<Review>? reviews;

  Product({
    required this.name,
    required this.price,
    required this.features,
    required this.imageUrls,
    this.reviews,
  });
}
