import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  String dob = "";

  _pickFromDate() async {
    DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime(2004, 1, 8),
            firstDate: DateTime(2000),
            lastDate: DateTime(2010))
        .then((value) {
      setState(() {
        dob = value.toString();
      });
      return null;
    });

    var todaysDate =
        DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    if (date != null && todaysDate.isAfter(date)) {
      return;
    }
  }

  void login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTEC.text, password: passwordTEC.text);
  }

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Log In"),
          backgroundColor: const Color.fromARGB(255, 185, 134, 240),
        ),
        backgroundColor: const Color.fromARGB(255, 226, 212, 240),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      size: 70,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 185, 134, 240),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Username",
                            hintText: "Enter Username",
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Colors.black,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              labelText: "Contact No.",
                              hintText: "Enter Contact No.",
                              prefixIcon: Icon(Icons.phone),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailTEC,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "Enter Email",
                              prefixIcon: Icon(Icons.email),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordTEC,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: passwordVisible,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "Enter Password",
                              prefixIcon: Icon(Icons.password),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.calendar_month,
                              ),
                              iconSize: 40,
                              tooltip: "Select DOB",
                              color: const Color.fromARGB(255, 185, 134, 240),
                              onPressed: _pickFromDate),
                          const SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "DOB : $dob",
                            ),
                          )
                        ]),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 3, bottom: 7, right: 275),
                        //     child: Text("DOB : $dob")),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 7, right: 120, left: 120),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: login,
                              color: const Color.fromARGB(255, 185, 134, 240),
                              textColor: Colors.white,
                              elevation: 8,
                              child: const Text("Log In"),
                            )),
                      ],
                    ))
                  ],
                ),
              ),
            )));
    //);
  }
}
