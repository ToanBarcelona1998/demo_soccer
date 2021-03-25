import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/standing_notifier.dart';

final standing_notifier =
    ChangeNotifierProvider<StandingNotifier>((ref) => StandingNotifier());

class StandingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xfff0ebe8),Color(0xffeaeaec)],
        )
      ),
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
                    "Standing",
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
                child: Container(
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("Pl",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("W",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("D",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("L",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("Gd",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: 0.5,
                      child: Text("Pts",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
          Expanded(
            child: TableStanding(),
          ),
        ],
      ),
    );
  }
}

class TableStanding extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final standing_data = watch(standing_notifier);
    return standing_data.list.length != 0
        ? Container(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: standing_data.list.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              standing_data.list[index].position.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        //Expanded(child: Image.network(standing_data.list[index].team!.crestUrl!)),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Text(
                              standing_data.list[index].team!.name!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                standing_data.list[index].playedGames.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                standing_data.list[index].won.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                standing_data.list[index].draw.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                standing_data.list[index].lost.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Opacity(
                              opacity: 0.3,
                              child: Text(
                                standing_data.list[index].goalDifference.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              standing_data.list[index].points.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
