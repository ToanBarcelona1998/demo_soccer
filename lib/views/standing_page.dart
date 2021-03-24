import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/standing_notifier.dart';

final standing_notifier =
    ChangeNotifierProvider<StandingNotifier>((ref) => StandingNotifier());

class StandingTab extends StatelessWidget {
  String ?code;
  StandingTab({this.code});
  @override
  Widget build(BuildContext context) {
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
                    child: Text("Standing",style: TextStyle(fontSize: 22,fontFamily: "Chango"),),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(child: Container(child: Text("Pos"),),),
                Expanded(flex: 4,child: Container(child: Text("Club"),),),
                Expanded(child: Container(child: Text("Pl"),),),
                Expanded(child: Container(child: Text("W"),),),
                Expanded(child: Container(child: Text("D"),),),
                Expanded(child: Container(child: Text("L"),),),
                Expanded(child: Container(child: Text("Gd"),),),
                Expanded(child: Container(child: Text("Pts"),),),
              ],
            ),
            Expanded(
              child: TableStanding(code: code,),
            ),
          ],
        ),
    );
  }
}

class TableStanding extends ConsumerWidget {
  String ?code;
  TableStanding({this.code});
  @override
  Widget build(BuildContext context, watch) {
    final standing_data = watch(standing_notifier);
    context.read(standing_notifier).fetchDataStanding(code!);
    return standing_data.list.length != 0
    ? Container(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: standing_data.list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].position.toString(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(standing_data.list[index].team!.name!,overflow: TextOverflow.ellipsis,),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].playedGames.toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].won.toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].draw.toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].lost.toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].goalDifference.toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      standing_data.list[index].points.toString(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    : Center(child: CircularProgressIndicator());
  }
}