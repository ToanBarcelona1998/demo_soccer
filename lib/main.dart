import 'package:flutter/material.dart';
import 'package:soccer_app/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main()async{
  runApp(ProviderScope(child: MyApp()));
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: HomePage(),
      ),
    );
  }
}
