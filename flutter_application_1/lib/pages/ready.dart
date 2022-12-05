import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/workoutdet.dart';
import 'package:provider/provider.dart';

class rUready extends StatelessWidget {
  const rUready({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ARE YOU READY",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    width: 0,
                    height: 40,
                  ),
                  Consumer<TimerModel>(builder: (context, myModel, child) {
                    return Text(
                      myModel.countdown.toString(),
                      style: TextStyle(fontSize: 48),
                    );
                  }),
                ]),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  TimerModel(context) {
    MyTimer(context);
  }
  int countdown = 5;
  MyTimer(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WorkOutDet()));
      }
    });
  }
}
