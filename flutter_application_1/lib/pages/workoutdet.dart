import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/break.dart';
import 'package:flutter_application_1/pages/ready.dart';

import 'package:provider/provider.dart';

class WorkOutDet extends StatelessWidget {
  const WorkOutDet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelsec>(
      create: (context) => TimerModelsec(context),
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.sheknows.com/wp-content/uploads/2018/08/gdtsjhqjobppwaarhily.gif?w=1024"),
                          fit: BoxFit.cover)),
                ),
                const Text(
                  " Surya namskara",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("00",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      const Text(":",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Consumer<TimerModelsec>(
                        builder: ((context, myModel, child) {
                          return Text(
                            myModel.countdown.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<TimerModelsec>(
                  builder: ((context, myModel, child) {
                    return ElevatedButton(
                      onPressed: () {
                        myModel.show();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child:
                            const Text("PAUSE", style: TextStyle(fontSize: 20)),
                      ),
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Previous",
                            style: TextStyle(fontSize: 16),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Next",
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: Text(
                        "Next : yoga",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ],
            ),
          ),
          Consumer<TimerModelsec>(
            builder: ((context, myModel, child) {
              return Visibility(
                visible: myModel.visible,
                child: Container(
                  padding: EdgeInsets.all(25),
                  color: Colors.blueAccent.withOpacity(0.9),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "PAUSE",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "RESTART",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "QUIT",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            myModel.hide();
                          },
                          child: Text(
                            "RESUME",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        )
                      ]),
                ),
              );
            }),
          ),
        ],
      )),
    );
  }
}

class TimerModelsec with ChangeNotifier {
  TimerModelsec(context) {
    MyTimer(context);
  }
  int countdown = 30;
  bool visible = false;
  MyTimer(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => breaktime()));
      }
    });
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }
}
