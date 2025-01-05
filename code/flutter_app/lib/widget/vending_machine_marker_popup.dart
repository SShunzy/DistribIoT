import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/products_page.dart';
import '../classes/vending_machine_small.dart';

class VendingMachineMarkerPopup extends StatelessWidget{
  const VendingMachineMarkerPopup({super.key, required this.vendingMachine});
  final VendingMachineSmall vendingMachine;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 50,
            minWidth: 50,
            maxHeight: 80,
            maxWidth: 250
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child:
          PreferredSize(
            preferredSize: const Size(125, 65),
            child: TextButton(
                onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductsPage(machineId: vendingMachine.id, machineName: vendingMachine.name)));
                },
                child:Row(
                  children: [
                    Text(vendingMachine.name),
                    const Icon(Icons.arrow_right)
                  ],
                )
            ),
          ),
        )
    );
  }

}