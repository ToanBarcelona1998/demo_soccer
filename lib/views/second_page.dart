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
    context.read(standing_notifier).list.clear();
    context.read(soccer_notifer).state.clear();
    Future.delayed(Duration(seconds: 3),(){context.read(standing_notifier).fetchDataStanding(code!);});
    Future.delayed(Duration(seconds: 3),(){context.read(soccer_notifer).getSoccerNotifier(code!);});
    final page=watch(select_page);
      return Scaffold(
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
      );
  }
  
}
