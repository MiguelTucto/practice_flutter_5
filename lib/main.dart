import 'package:flutter/material.dart';
import 'package:practice_flutter_5/utils/dbhelper.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    helper.testDb();
    return Container();
  }
}
