import 'package:flutter/material.dart';

class StandingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 8,
            right: 8,
            bottom: 8),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Icon(Icons.keyboard_backspace_sharp),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text("Standing"),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text("")
                      ]
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
