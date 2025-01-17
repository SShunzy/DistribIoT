import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/add_review_or_login_widget.dart';

import '../widget/auth_or_login_widget.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({super.key, required this.machineId});

  final String machineId;
  @override
  Widget build(BuildContext context) {
      return CupertinoPageScaffold(
          child: CustomScrollView(
            scrollBehavior: const ScrollBehavior(),
            slivers: [
              CupertinoSliverNavigationBar(
                alwaysShowMiddle: false,
                leading: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_ios, size: 20),
                          Text("Review", style: TextStyle(fontSize: 20),)
                        ],
                      )
                      ]
                  ),
                  onPressed: () =>
                      Navigator.pop(
                        context,
                      ),
                ),
                largeTitle: const Text(
                  "Ajout Review",
                  style: TextStyle(height: 1, fontSize: 30),
                ),

              ),
               SliverFillRemaining(
                child: AddReviewOrLoginWidget(machineId: machineId,),
              )
            ],
          )
      );
  }
}