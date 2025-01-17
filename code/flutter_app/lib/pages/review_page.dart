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
    return  CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              largeTitle:  Text(
                utf8.decode(machineName.codeUnits),
                style: const TextStyle(height: 1, fontSize: 30),
              ),
              trailing:  CupertinoButton(
                  padding:  const EdgeInsets.symmetric(vertical: 5),
                  child:   const Icon(Icons.account_circle),
                  onPressed: ()=> Navigator.pop(context)
              ),
            ),
             SliverFillRemaining(
              child: ReviewList(machineId: machineId),
            )
          ],
        )
    );
  }

}