import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/classes/review_class.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ReviewItem extends StatelessWidget{
  const ReviewItem({super.key, required this.review});

  final ReviewClass review;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:Colors.grey),
          //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,offset: Offset(1,3))],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          review.userPictureUri.isNotEmpty? review.userPictureUri :
                          "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg"
                      )
                  ),
                ),
                Text(utf8.decode(review.userName.codeUnits)),
                const Spacer(flex: 1),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                    (DateFormat.yMMMd().format(review.postDate)).toString(),
                    style: const TextStyle(color: Color(0xFFACACAC))
                ),
              )
              ]
            ),

        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(review.commentary.isNotEmpty?
            utf8.decode(review.commentary.codeUnits) : ""
            )
        ),
        StarRating(
          rating: review.rating,
          allowHalfRating: true,
          size: 40,
          color: Colors.amber,
        )
      ]
    )
    )
    )
    ;
  }

}