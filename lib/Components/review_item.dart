import 'package:audio_ecommerce_app/Components/star_rating.dart';
import 'package:audio_ecommerce_app/Models/review.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class ReviewItem extends StatelessWidget{
  Review review;
  ReviewItem({required this.review});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  // height: 40,
                  // width: 40,
                  imageUrl: review.user.imgURL,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      review.user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                        timeAgo(review.time),
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
                StarRating(rating: review.stars),
                Text(review.commentContent)
              ],
            ),
          )
        ],
      ),
    );
  }
  String timeAgo(DateTime time) {
    Duration difference = DateTime.now().difference(time);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }
}