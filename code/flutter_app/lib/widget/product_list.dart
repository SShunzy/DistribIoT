import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/product_item.dart';
import 'package:http/http.dart' as http;

import '../classes/vending_machine.dart';
import '../classes/app_properties.dart' as properties;


class ProductList extends StatefulWidget{
  const ProductList({super.key, required this.machineId});

  final String machineId;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  static Future<VendingMachine> _fetchProductsByMachineId(String machineId) async{
    final uri = Uri.parse("${properties.apiUrl}/machines/$machineId");
    final response = await http.get(uri);
    final Map<String, dynamic> body = json.decode(response.body);
    debugPrint("json = $body");
    return VendingMachine.fromJson(body);

  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchProductsByMachineId(widget.machineId),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            return Flex(
              direction: Axis.vertical,
              children:[
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                          itemCount: snapshot.data!.productsList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => ProductItem(
                            product: snapshot.data!.productsList[index],
                          )
                      )
                  ),
                )
              ]

            );
          }
          else{
            debugPrint("Snapshot = $snapshot");
            return const Center(
              child: Text("No data available"),
            );
          }
        }

    );
  }
}