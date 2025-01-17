import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';

import '../widget/map_widget.dart';

class MapPage extends StatelessWidget{
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {

    return  CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              largeTitle: const Text(
                "DistribIoT",
                style: TextStyle(height: 1, fontSize: 30),
              ),
              trailing:  CupertinoButton(
                padding:  const EdgeInsets.symmetric(vertical: 5),
                child:   const Icon(Icons.account_circle),
                onPressed: ()=> Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const LoginPage()))
              ),
              ),
            const SliverFillRemaining(
              child: MapWidget(),
            )
          ],
        )
    );
  }
}