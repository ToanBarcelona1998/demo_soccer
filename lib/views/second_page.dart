import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/providers.dart';
import 'package:soccer_app/public/custom_curved_bottom_navigation.dart';
import 'package:soccer_app/views/soccer_page.dart';
import 'package:soccer_app/views/standing_page.dart';


class SecondPage extends ConsumerWidget{
  String code;
  SecondPage({this.code});
  final _pageOptions=[StandingTab(),SoccerTab()];
  @override
  Widget build(BuildContext context, watch) {
    context.read(standing_notifier).fetchDataStanding(code);
    var page=watch(select_page.state);
      return Scaffold(
          extendBody: true,
          bottomNavigationBar: CurvedNavigationBar(
            items: [
              Icon(Icons.lock),
              Icon(Icons.person),
            ],
            onTap: (index){
              context.read(select_page).changePage(index);
              context.read(soccer_notifer).getSoccerNotifier(code);
            },
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xfff0ebe8), Color(0xffeaeaec)],
                )),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 8,
                right: 8,
                bottom: 75),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.keyboard_backspace_sharp),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "Football",
                          style: TextStyle(fontSize: 22, fontFamily: "Chango"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(child: _pageOptions[page]),
              ],
            ),
          ),
      );
  }
  
}
