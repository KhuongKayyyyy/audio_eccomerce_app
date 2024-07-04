import 'package:audio_ecommerce_app/Models/user.dart';

class Review {
  User user;
  int stars;
  DateTime time;
  List<String>? imageUrls;

  Review({
    required this.user,
    required this.stars,
    required this.time,
    this.imageUrls,
  });
}
