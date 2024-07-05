import 'package:audio_ecommerce_app/Models/user.dart';

class Review {
  User user;
  int stars;
  DateTime time;
  String commentContent;
  List<String>? imageUrls;

  Review({
    required this.user,
    required this.stars,
    required this.time,
    required this.commentContent,
    this.imageUrls,
  });
}
