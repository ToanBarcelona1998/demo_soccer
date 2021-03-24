import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/page_notifier.dart';
import 'package:soccer_app/public/custom_curved_bottom_navigation.dart';
import 'package:soccer_app/views/soccer_page.dart';
import 'package:soccer_app/views/standing_page.dart';

final select_page=ChangeNotifierProvider<PageNotifier>((ref)=>PageNotifier());

class SecondPage extends ConsumerWidget{
  String ?code;
  SecondPage({this.code});
  final _pageOptions=[StandingTab(),SoccerTab()];
  @override
  Widget build(BuildContext context, watch) {
    final page=watch(select_page);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBody: true,
          bottomNavigationBar: CurvedNavigationBar(
            items: [
              Icon(Icons.lock),
              Icon(Icons.person),
            ],
            onTap: (index){
              context.read(select_page).changePage(index);
            },
          ),
          body: _pageOptions[page.selectPage],
        ),
      );
  }
  
}
