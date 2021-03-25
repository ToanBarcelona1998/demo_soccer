import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/soccer_notifier.dart';

final soccer_notifer =
    StateNotifierProvider<SoccerNotifier>((ref) => SoccerNotifier());

class SoccerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "Top Soccer",
                    style: TextStyle(fontSize: 22, fontFamily: "Chango"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                child: Container(
                  child: Opacity(opacity: 0.5,child: Text("Pos",style: TextStyle(fontWeight: FontWeight.bold),),),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("Club",style: TextStyle(fontWeight: FontWeight.bold),),),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                    child: Text("Goal",style: TextStyle(fontWeight: FontWeight.bold),),),
                ),
              ),
            ],
          ),
          Expanded(
            child: TableSoccer(),
          ),
        ],
      ),
    );
  }
}

class TableSoccer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final soccer = watch(soccer_notifer.state);
    return soccer.length != 0
        ? Container(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: soccer.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Text(
                              soccer[index].player!.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Opacity(
                              opacity: 0.5,
                              child: Text(
                                soccer[index].player!.dateOfBirth.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                soccer[index].player!.position.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                soccer[index].team!.name.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              soccer[index].numberOfGoals.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
