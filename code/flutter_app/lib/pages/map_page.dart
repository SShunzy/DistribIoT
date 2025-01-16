import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/map_widget.dart';

class MapPage extends StatelessWidget{
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(180, 110),
          child: SizedBox(
            height: 110,
            child:  CupertinoNavigationBar(
              middle: Text(
                "DistribIoT",
                style: TextStyle(height: 1, fontSize: 30),
              ),
              backgroundColor: CupertinoColors.black,
            )
          ),
      ),
      resizeToAvoidBottomInset: true,
      body: MapWidget(),
    );
  }

}