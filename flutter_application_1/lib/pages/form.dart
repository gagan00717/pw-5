import 'package:flutter/material.dart';

void main() => runApp(MyForm());

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formTitle = "Form Title";
    return MaterialApp(
      title: formTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(formTitle),
        ),
        body: MyUserForm(),
      ),
    );
  }
}

class MyUserForm extends StatefulWidget {
  @override
  MyUserFormState createState() {
    return MyUserFormState();
  }
}

class MyUserFormState extends State<MyUserForm> {
  final _formKey = GlobalKey<FormState>();
  String? gender;

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your name",
                  labelText: "Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name!";
                  }
                }),
            TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail_outlined),
                  hintText: "Enter your email id",
                  labelText: "Mail Id",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email id!";
                  }
                }),
            TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your age",
                  labelText: "Age",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your age!";
                  }
                }),
            Container(
                child: Row(children: <Widget>[
              RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              Icon(Icons.male_outlined),
              RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              Icon(Icons.female_outlined),
              RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              Icon(Icons.transgender_outlined),
            ])),
            Container(
              padding: EdgeInsets.only(left: 100.0, top: 50.0),
              child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Form is valid");
                    }
                  }),
            ),
          ]),
    );
  }
}
