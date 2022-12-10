import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyForm());

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const formTitle = "Form Title";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: formTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(formTitle),
        ),
        body: const MyUserForm(),
      ),
    );
  }
}

class MyUserForm extends StatefulWidget {
  const MyUserForm({super.key});

  @override
  MyUserFormState createState() {
    return MyUserFormState();
  }
}

class MyUserFormState extends State<MyUserForm> {
  final _formKey = GlobalKey<FormState>();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your name",
                  labelText: "Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name!";
                  }
                  return null;
                }),
            TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail_outlined),
                  hintText: "Enter your email id",
                  labelText: "Mail Id",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email id!";
                  }
                  return null;
                }),
            TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Enter your age",
                  labelText: "Age",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your age!";
                  }
                  return null;
                }),
            Row(children: <Widget>[
              RadioListTile(
                  title: const Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              const Icon(Icons.male_outlined),
              RadioListTile(
                  title: const Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              const Icon(Icons.female_outlined),
              RadioListTile(
                  title: const Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              const Icon(Icons.transgender_outlined),
            ]),
            Container(
              padding: const EdgeInsets.only(left: 100.0, top: 50.0),
              child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (kDebugMode) {
                        print("Form is valid");
                      }
                    }
                  }),
            ),
          ]),
    );
  }
}
