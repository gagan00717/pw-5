import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ready.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => rUready()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "START",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Yoga for Begineers",
                  style: TextStyle(fontSize: 20),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/868757/pexels-photo-868757.jpeg?auto=compress&cs=tinysrgb&w=600",
                  fit: BoxFit.cover,
                )),
            leading: Icon(Icons.backpack_sharp),
            actions: [
              IconButton(onPressed: (() {}), icon: Icon(Icons.thumb_up))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  children: [
                    Text("16 Min || 26 Workout",
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 2,
                        ),
                    itemBuilder: (context, index) => ListTile(
                          leading: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Image.network(
                              "https://media3.giphy.com/media/3oKIPavRPgJYaNI97W/200.webp?cid=ecf05e471dsiefbbqzz43pvz1dwz3mvk7yj9w0kq8wlx60r9&rid=200.webp&ct=g",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            "Yoga $index",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text((index % 2 == 0) ? "00.20" : "x20"),
                        ),
                    itemCount: 10),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
