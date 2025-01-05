import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/map_page.dart';

void main() {
  runApp(const CupertinoApp(
    title: 'Flutter App',
    home: CupertinoPageScaffold(
        child: MapPage()
    ),
  ));
}