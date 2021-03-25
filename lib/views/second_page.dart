import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/providers.dart';
import 'package:soccer_app/public/custom_curved_bottom_navigation.dart';
import 'package:soccer_app/views/soccer_page.dart';
import 'package:soccer_app/views/standing_page.dart';


class SecondPage extends ConsumerWidget{
  String ?code;
  SecondPage({this.code});
  final _pageOptions=[StandingTab(),SoccerTab()];
  @override
  Widget build(BuildContext context, watch) {
    context.read(standing_notifier).list1.clear();
    context.read(soccer_notifer).list.clear();
    context.read(standing_notifier).fetchDataStanding(code!);
    final page=watch(select_page.state);
      return Scaffold(
          extendBody: true,
          bottomNavigationBar: CurvedNavigationBar(
            items: [
              Icon(Icons.lock),
              Icon(Icons.person),
            ],
            onTap: (index)async{
              await context.read(select_page).changePage(index);
              context.read(soccer_notifer).getSoccerNotifier(code!);
            },
          ),
          body: _pageOptions[page],
      );
  }
  
}
