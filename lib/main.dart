import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_view/main_splt_view.dart';
import 'package:split_view/providers/category_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ],child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplitView(),
    ),);
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   home: SplitView(),
    // );
  }
}
