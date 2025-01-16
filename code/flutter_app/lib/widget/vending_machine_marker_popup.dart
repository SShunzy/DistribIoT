import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/review_page.dart';
import 'dart:convert' show utf8;

import '../pages/products_page.dart';
import '../classes/vending_machine_small.dart';

class VendingMachineMarkerPopup extends StatelessWidget{
  const VendingMachineMarkerPopup({super.key, required this.vendingMachine});
  final VendingMachineSmall vendingMachine;

  Widget getTypesIcons(){
    List<IconData> _iconTypes = [];

    for(String type in vendingMachine.types){
      if(type == "Snacks") _iconTypes.add(Icons.cookie);
      else if(type == "Drinks") _iconTypes.add(Icons.local_drink);
      else if(type == "Bread") _iconTypes.add(Icons.bakery_dining);
    }
    return Row(
      children: _iconTypes.map((icon) => Icon(icon)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: 50,
        maxHeight: 80,
        maxWidth: 5000
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductsPage(machineId: vendingMachine.machineId, machineName: vendingMachine.name)));
          },
          child: IntrinsicWidth(
            child: Row(
              children: [
               getTypesIcons(),
                Text(utf8.decode(vendingMachine.name.codeUnits)),
                const Icon(Icons.arrow_right)
              ],
            )
          )
        ),
      ),
    );
  }

}