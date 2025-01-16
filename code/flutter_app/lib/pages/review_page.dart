import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

import 'package:flutter_app/widget/review_list.dart';

class ReviewPage extends StatelessWidget{
  const ReviewPage({super.key, required this.machineId, required this.machineName});

  final String machineId;
  final String machineName;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  PreferredSize(
          preferredSize:  const Size(180, 110),
          child: SizedBox(
              height: 110,
              child:  CupertinoNavigationBar(
                middle: Text(
                  utf8.decode(machineName.codeUnits),
                  style: const TextStyle(height: 1, fontSize: 30),
                ),
                backgroundColor: CupertinoColors.black,
              )
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: ReviewList(machineId: machineId),
        )
    );
  }

}