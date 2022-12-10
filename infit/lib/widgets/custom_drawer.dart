import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../pages/google_sign_in.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"))),
          ),
          ListTile(
            title: Text(
              "Reset progresss",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.restart_alt,
              size: 28,
            ),
          ),
          ListTile(
            title: Text(
              "Share with friends",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.share,
              size: 28,
            ),
          ),
          ListTile(
            title: Text(
              "Rate Us",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.star,
              size: 28,
            ),
          ),
          ListTile(
            title: Text(
              "privacy",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.security,
              size: 28,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.SignOut();
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,

              children: [
                Icon(
                  Icons.logout_outlined,
                  size: 28,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            endIndent: 30,
            indent: 30,
          ),
          Text(
            "version 1.1.01",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
