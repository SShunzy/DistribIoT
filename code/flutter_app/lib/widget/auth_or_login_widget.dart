import 'package:flutter/material.dart';
import 'package:flutter_app/services/token_managing_service.dart';
import 'package:flutter_app/widget/login_widget.dart';

import '../classes/user_small.dart';
import 'account_widget.dart';

class AuthOrLoginWidget extends StatefulWidget{
  const AuthOrLoginWidget({super.key});


  @override
  State<AuthOrLoginWidget> createState() => _AuthOrLoginWidgetState();
}

class _AuthOrLoginWidgetState extends State<AuthOrLoginWidget> {

  static Future<UserSmall?> _getAuthenticated() async{
    UserSmall? user = await auth();
    if(user == null) return null;
    await storePictureURI(user.pictureURI);
    return user;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAuthenticated(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.connectionState == ConnectionState.done) {
            return snapshot.data != null ?  AccountWidget(user:snapshot.data!) : const LoginWidget();
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