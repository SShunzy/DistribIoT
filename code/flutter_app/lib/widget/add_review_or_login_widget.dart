import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/login_widget.dart';

import '../classes/user_small.dart';
import '../services/token_managing_service.dart';
import 'add_review_widget.dart';

class AddReviewOrLoginWidget extends StatefulWidget{
  const AddReviewOrLoginWidget({super.key, required this.machineId});
final String machineId;
  @override
  State<AddReviewOrLoginWidget> createState() => _AddReviewOrLoginWidgetState(machineId:machineId);
}

class _AddReviewOrLoginWidgetState extends State<AddReviewOrLoginWidget> {
  static Future<UserSmall?> _getAuthenticated() async{
    UserSmall? user = await auth();
    if(user == null) return null;
    return user;
  }
  _AddReviewOrLoginWidgetState({ required this.machineId});

   String machineId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAuthenticated(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) return AddReviewWidget(user:snapshot.data!, machineId: machineId);
            else {
              return const LoginWidget();
            }
          }
          else{
            debugPrint("Snapshot = $snapshot");
            return const Center(
              child: Text("Server Not Available"),
            );
          }
        }
    );
  }
}