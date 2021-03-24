import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/page_notifier.dart';
import 'package:soccer_app/providers/soccer_notifier.dart';

final soccer_notifer=StateNotifierProvider<SoccerNotifier>((ref)=>SoccerNotifier());
final select_page=ChangeNotifierProvider<PageNotifier>((ref)=>PageNotifier());

class SoccerTab extends ConsumerWidget {
  String ?code;
  SoccerTab({this.code});
  @override
  Widget build(BuildContext context, watch) {
    return Container(
      color: Color(0xffe0e1db),
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
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.keyboard_backspace_sharp),),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text("Top Soccer",style: TextStyle(fontSize: 22,fontFamily: "Chango"),),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(flex: 4,child: Container(child: Text("Name"),),),
              Expanded(flex: 2,child: Container(child: Text("Bir"),),),
              Expanded(child: Container(child: Text("Pos"),),),
              Expanded(child: Container(child: Text("Club"),),),
              Expanded(child: Container(child: Text("Goal"),),),
            ],
          ),
          Expanded(
            child: TableSoccer(code: code,),
          ),
        ],
      ),
    );
  }

}
class TableSoccer extends ConsumerWidget{
  String ?code;
  TableSoccer({this.code});
  @override
  Widget build(BuildContext context, watch) {
    context.read(soccer_notifer).getSoccerNotifier(code);
    final soccer=watch(soccer_notifer.state);
    return soccer.length!=0?Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: soccer.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Text(
                    soccer[index].player!.name.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    soccer[index].player!.dateOfBirth.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    soccer[index].player!.position.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    soccer[index].team!.name.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    soccer[index].numberOfGoals.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ):Center(
      child: CircularProgressIndicator(),
    );
  }

}
