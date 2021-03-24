import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  String ?code;
  SecondPage({this.code});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(Icons.account_balance_wallet_rounded),
            Icon(Icons.person),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(8.0),

        ),
      ),
    );
  }
}
