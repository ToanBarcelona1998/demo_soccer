import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/models/enitys/model_tournament.dart';
import 'package:soccer_app/providers/providers.dart';
import 'package:soccer_app/providers/standing_notifier.dart';
import 'package:soccer_app/views/second_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double radius = 30;
  double margin = 25;
  List<TournamentModel> _list=[];
  @override
  void initState() {
    _list.add(TournamentModel(code: "PL",image: "assets/images/pl.png"));
    _list.add(TournamentModel(code: "PD",image: "assets/images/laliga.png"));
    _list.add(TournamentModel(code: "BL1",image: "assets/images/bundesliga.png"));
    _list.add(TournamentModel(code: "SA",image: "assets/images/seria.png"));
    _list.add(TournamentModel(code: "FL1",image: "assets/images/ligue1.png"));
    _list.add(TournamentModel(code: "PPL",image: "assets/images/nos.png"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff5875e7),Color(0xff4d5dc8)],
        )
      ),
      child: Stack(
        children: [
          Container(
            height: height / 2,
            width: width,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/soccer1.jpg"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Text(
                "Select Tournaments",
                  style: TextStyle(fontSize: 22,fontFamily: "Chango",color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: margin,
            right: margin,
            top: height / 2 - radius,
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: height *0.35,
              width: width - margin * 2,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: _list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      String code=_list[index].code!;
                      context.refresh(standing_notifier);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage(code: code,)));
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(15),
                        color: Color(0xffe6f0fa),
                      ),
                      child: Image.asset(_list[index].image!.trim(),height: 60),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

