import 'package:flutter/material.dart';
import 'package:flutter_app/services/token_managing_service.dart';
import 'package:flutter_app/widget/login_widget.dart';

import 'account_widget.dart';

class AuthOrLoginWidget extends StatefulWidget{
  const AuthOrLoginWidget({super.key});


  @override
  State<AuthOrLoginWidget> createState() => _AuthOrLoginWidgetState();
}

class _AuthOrLoginWidgetState extends State<AuthOrLoginWidget> {

  static Future<bool> _getAuthenticated() async{
    return auth();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAuthenticated(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return snapshot.data! ? const AccountWidget() : const LoginWidget();
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