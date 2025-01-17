import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/auth_or_login_widget.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              leading: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child:  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios, size: 20),
                        Text("Carte",style: TextStyle(fontSize: 20),)
                      ],
                    )
                    ]
                ),
                onPressed: ()=> Navigator.pop(
                  context,
                ),
              ),
              largeTitle:const Text(
                "Compte",
                style:  TextStyle(height: 1, fontSize: 30),
              ),

            ),
            const SliverFillRemaining(
              child: AuthOrLoginWidget(),
            )
          ],
        )
    );
  }

}