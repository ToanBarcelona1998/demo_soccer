import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soccer_app/providers/providers.dart';
import 'package:soccer_app/public/shared/result_fail.dart';
import 'package:soccer_app/public/shared/result_fail_code_400.dart';
import 'package:soccer_app/public/shared/result_fail_code_403.dart';
import 'package:soccer_app/public/shared/result_fail_code_404.dart';
import 'package:soccer_app/public/shared/result_fail_code_429.dart';
import 'package:soccer_app/public/shared/result_succes.dart';



class StandingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 7,
              ),
              SizedBox(width: 6,),
              Expanded(
                flex: 4,
                child: Container(),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Pl",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "W",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "D",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "L",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Gd",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Pts",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
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
    final standing_data = watch(standing_notifier).result;
    if(standing_data==null){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else if(standing_data is ResultSucces){
      var list=(standing_data as ResultSucces).data;
      return Container(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          list[index].position.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,),
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 7,
                        child: SvgPicture.network(
                            list[index].team!.crestUrl!)),
                    SizedBox(width: 6,),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          list[index].team!.name!,
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
                            list[index].playedGames
                                .toString(),
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
                            list[index].won.toString(),
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
                            list[index].draw.toString(),
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
                            list[index].lost.toString(),
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
                            list[index].goalDifference
                                .toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          list[index].points.toString(),
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
      );
    }
    else if(standing_data is ResultFailCode400){
      var message=(standing_data as ResultFailCode400).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(standing_data is ResultFailCode403){
      var message=(standing_data as ResultFailCode403).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(standing_data is ResultFailCode404){
      var message=(standing_data as ResultFailCode404).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(standing_data is ResultFailCode429){
      var message=(standing_data as ResultFailCode429).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(standing_data is ResultFail){
      var message=(standing_data as ResultFail).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    return Container();
  }
}
