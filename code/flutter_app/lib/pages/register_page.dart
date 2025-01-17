import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/register_widget.dart';


class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar:   CupertinoNavigationBar(
        middle: const Text(
          "DistribIoT",
          style: TextStyle(height: 1, fontSize: 30),
        ),
        backgroundColor: CupertinoColors.black,
        trailing: Container(color: Colors.white,child: SizedBox(height: 150,),),
      ),
      child: RegisterWidget(),
    );
  }
}