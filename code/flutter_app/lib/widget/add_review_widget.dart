import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/classes/review_class.dart';
import 'package:flutter_app/classes/user_small.dart';
import 'package:flutter_app/classes/vending_machine.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../classes/app_properties.dart'as properties;
import 'package:http/http.dart' as http;


class AddReviewWidget extends StatefulWidget{
  const AddReviewWidget({super.key, required this.user, required this.machineId});

  final UserSmall user;
  final String machineId;
  @override
  State<AddReviewWidget> createState() => _AddReviewWidgetState(user:user,machineId: machineId);
}

class _AddReviewWidgetState extends State<AddReviewWidget> {
  _AddReviewWidgetState({ required this.user, required this.machineId});

  String machineId= "";
  UserSmall user;
  double rating = 0.0;
  String commentary = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoFormSection(
                  children: [

                    StarRating(
                      allowHalfRating: true,
                      starCount: 10,
                      onRatingChanged: (rating) => setState(() {
                        this.rating = rating;
                      }),
                      rating: rating,
                      size: 40,
                      color: Colors.amber,
                    ),
                    CupertinoFormRow(
                        prefix: const Text("Commentary"),
                        child: CupertinoTextFormFieldRow(
                          placeholder: 'Enter Commentary',
                          textInputAction: TextInputAction.next,
                          onChanged: (input){
                            commentary = input;
                          },
                        )
                    ),


                    const SizedBox(height: 20),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        child:CupertinoButton.filled(
                            child: const Text("Publish Review"),
                            onPressed: () async {
                              final form = formKey.currentState!;
                              if(form.validate()){
                                final uri = Uri.parse("${properties.apiUrl}/machines/$machineId/reviews");
                                debugPrint(uri.toString());
                                final response = await http.put(
                                  uri,
                                  headers: <String, String>{
                                    'Content-Type': 'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode(<String, String>{
                                    "reviewId": Random.secure().nextInt(1000).toString(),
                                    'userName': user.username,
                                    'userPictureUri':user.pictureURI,
                                    'rating': (rating/2).toString(),
                                    'commentary': commentary
                                  }),
                                );
                                Map<String, dynamic> body = json.decode(response.body);
                                debugPrint("body= $body");
                                if(VendingMachine.fromJson(body) != null){
                                  Navigator.pop(context);

                                }
                              }
                            }
                        )
                    )
                  ]
              )
            ],
          ),
        )
    );
  }
}