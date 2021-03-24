import 'package:flutter/material.dart';
import 'package:soccer_app/public/custom_curved_bottom_navigation.dart';
import 'package:soccer_app/views/soccer_page.dart';
import 'package:soccer_app/views/standing_page.dart';
class SecondPage extends StatelessWidget {
  String ?code;
  SecondPage({this.code});
  int select_page=0;
  final _pageOptions=[StandingTab(),SoccerTab()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(Icons.lock),
            Icon(Icons.person),
          ],
          onTap: (index){},
        ),
        body: _pageOptions[select_page],
      ),
    );
  }
}
