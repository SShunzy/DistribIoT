import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/token_managing_service.dart';

class LoginWidget extends StatefulWidget{
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sign Up",style: TextStyle(fontSize: 50)),
            const Text("Login to Your Account",style: TextStyle(fontSize: 25)),
            CupertinoFormSection(
                children: [
                  CupertinoFormRow(
                      prefix: const Text("Username"),
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Enter Username',
                        textInputAction: TextInputAction.next,
                        onChanged: (input){
                          username = input;
                        },
                        validator: (username){
                          if(username == null || username.isEmpty) {
                            return 'Enter a valid Username';
                          }
                          else{
                            return null;
                          }
                        },
                      )
                  ),

                  CupertinoFormRow(
                      prefix: const Text("Password"),
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Enter Password',
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        onChanged: (input){
                          password = input;
                        },
                        validator: (password){
                          if(password == null || password.isEmpty) {
                            return 'Enter a valid Password';
                          }
                          else{
                            return null;
                          }
                        },
                      )
                  ),
                  const SizedBox(height: 20),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: double.infinity,
                      child:CupertinoButton.filled(
                          child: const Text("Sign In"),
                          onPressed: () async {
                            final form = formKey.currentState!;
                            if(form.validate()){
                              String token = await login(username, password);
                              await storeToken(token);
                              await storeUsername(username);
                              Navigator.pop(context);
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
  }}