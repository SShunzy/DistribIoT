import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/classes/review_class.dart';
import 'package:flutter_app/widget/review_item.dart';
import 'package:http/http.dart' as http;

import '../classes/app_properties.dart' as properties;


class ReviewList extends StatefulWidget{
  const ReviewList({super.key, required this.machineId});

  final String machineId;

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {

  static Future<List<ReviewClass>> _fetchReviewsByMachineId(String machineId) async{
    final uri = Uri.parse("${properties.apiUrl}/machines/$machineId/reviews");
    final response = await http.get(uri);
    final List body = json.decode(response.body) as List;
    debugPrint("json = $body");
    List<ReviewClass> reviews = List<dynamic>.from(body)
        .map((i) => ReviewClass.fromJson(i))
        .toList();
    return reviews;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchReviewsByMachineId(widget.machineId),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            return snapshot.data!.length > 0?
              ListView(
                children: snapshot.data!.map((review) => ReviewItem(review: review)).toList(),
            ): Text("No Reviews")
            ;
          }
          else{
            debugPrint("Snapshot = $snapshot");
            return const Center(
              child: Text("Server is unavailable"),
            );
          }
        }

    );
  }
}