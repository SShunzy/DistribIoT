import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget{
  const RegisterWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sign Up",style: TextStyle(fontSize: 50)),
          const Text("Create Your Account",style: TextStyle(fontSize: 25)),
          CupertinoFormSection(
              children: [
                Container(
                  child: CupertinoFormRow(
                      prefix: const Text("Username"),
                      child: CupertinoTextFormFieldRow(
                        placeholder: 'Enter Username',
                        textInputAction: TextInputAction.next,
                      )
                  ),
                ),

                CupertinoFormRow(
                    prefix: const Text("Password"),
                    child: CupertinoTextFormFieldRow(
                        placeholder: 'Enter Password',
                        obscureText: true,
                      textInputAction: TextInputAction.next,
                    )
                ),
                CupertinoFormRow(
                    prefix: const Text("Confirm Password"),
                    child: CupertinoTextFormFieldRow(
                      placeholder: 'Confirm Password',
                      obscureText: true,textInputAction:
                      TextInputAction.next
                    )
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    child:CupertinoButton.filled(
                      child: const Text("Sign Up"),
                      onPressed: (){}
                )
                )
              ]
          )
        ],
      ),
    );
  }}