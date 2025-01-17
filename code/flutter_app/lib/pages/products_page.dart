import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/review_page.dart';
import 'package:flutter_app/widget/product_list.dart';
import 'dart:convert' show utf8;

class ProductsPage extends StatelessWidget{
  const ProductsPage({super.key, required this.machineId, required this.machineName});

  final String machineId;
  final String machineName;

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: CustomScrollView(
          scrollBehavior: ScrollBehavior(),
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
                largeTitle:Text(
                  utf8.decode(machineName.codeUnits),
                  style: const TextStyle(height: 1, fontSize: 30),
                ),
              trailing: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child:  const Column(
                      mainAxisSize: MainAxisSize.min,
                      children:[Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Review",style: TextStyle(fontSize: 20),),
                          Icon(Icons.star_half, size: 20),
                        ],
                      )
                      ]
                  ),
                  onPressed: ()=> Navigator.push(
                    context,
                      CupertinoPageRoute(
                      builder: (context) =>  ReviewPage(machineId: machineId, machineName: machineName)))
                  ),
            ),
            SliverFillRemaining(
              child: ProductList(machineId: machineId),
            )
          ],
        )
    );
  }

}