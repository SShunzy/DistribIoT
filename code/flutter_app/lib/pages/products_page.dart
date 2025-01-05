import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/product_list.dart';

class ProductsPage extends StatelessWidget{
  const ProductsPage({super.key, required this.machineId, required this.machineName});

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
                  machineName,
                  style: const TextStyle(height: 1, fontSize: 30),
                ),
                backgroundColor: CupertinoColors.black,
              )
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: ProductList(machineId: machineId),
        )
    );
  }

}