import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/providers.dart';
import 'package:soccer_app/public/shared/result_fail.dart';
import 'package:soccer_app/public/shared/result_fail_code_400.dart';
import 'package:soccer_app/public/shared/result_fail_code_403.dart';
import 'package:soccer_app/public/shared/result_fail_code_404.dart';
import 'package:soccer_app/public/shared/result_fail_code_429.dart';
import 'package:soccer_app/public/shared/result_succes.dart';

class SoccerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
    final soccer=watch(soccer_notifer).result;
    if(soccer==null){
      return Container(
        child: Center(child: CircularProgressIndicator(),),
      );
    }
    else if(soccer is ResultSucces){
      var list=(soccer as ResultSucces).data;
      return Container(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Text(
                            list[index].player!.name.toString(),
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
                              list[index].player!.dateOfBirth.toString(),
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
                              list[index].player!.position.toString(),
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
                              list[index].team!.name.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            list[index].numberOfGoals.toString(),
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
        ),
      );
    }
    else if(soccer is ResultFailCode400){
      var message=(soccer as ResultFailCode400).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(soccer is ResultFailCode403){
      var message=(soccer as ResultFailCode403).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(soccer is ResultFailCode404){
      var message=(soccer as ResultFailCode404).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(soccer is ResultFailCode429){
      var message=(soccer as ResultFailCode429).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else if(soccer is ResultFail){
      var message=(soccer as ResultFail).message();
      return Container(
        child: Center(
          child: Text(message),
        ),
      );
    }
    else{
      return Container();
    }
  }
}
