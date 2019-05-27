import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src/widgets/AndroidHomePage.dart';
import 'src/foundation.dart';
import 'src/widgets/IosHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoApp(
        home: IosHomePage(
          title: "IOS",
        ),
      );
    } else {
      return MaterialApp(
        theme: ThemeData.dark(),
        home: AndroidHomePage(
          title: "Android",
        ),
      );
    }
  }
}
