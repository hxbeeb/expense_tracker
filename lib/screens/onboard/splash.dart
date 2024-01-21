import 'dart:async';

import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/screens/auth/signin.dart';
import 'package:expense_tracker/screens/home/pages.dart';
import 'package:expense_tracker/screens/onboard/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (googleSignIn.currentUser != null) {
    //   var id = googleSignIn.currentUser!.id;
    //   context.read<users>().id(id);
    // }
    // if (auth.currentUser != null) {
    //   var id = googleSignIn.currentUser!.id;
    //   context.read<users>().id(id);
    // }
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Future.delayed(const Duration(seconds: 3), () {
    //   if (googleSignIn.currentUser == null || auth.currentUser == null) {
    //     Navigator.pushReplacementNamed(context, '/welcome');
    //   } else {
    //     Navigator.pushReplacementNamed(context, '/pages');
    //   }
    // });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<users>(
        builder: (BuildContext context, users value, Widget? child) {
      if (googleSignIn.currentUser != null) {
        var id = googleSignIn.currentUser;
        value.id = id;
      }
      if (auth.currentUser != null) {
        var id = googleSignIn.currentUser;
        value.id = id;
      }
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>value.id==null? welcome():pages()),
        ),
      );
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color(0xFF7F3DFF)
              // gradient: LinearGradient(
              //     colors: [AppColor.appPrimaryColor],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight)
              ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset("assets/recordcircle.png")],
                ),
                Column(
                  children: [
                    SizedBox(
                        child: Image.asset(
                      "assets/Vector.png",
                    )),
                    const Text(
                      "CipherX",
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ],
                ),
                Stack(children: [
                  Image.asset("assets/recordcircle2.png"),
                  const Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        "By",
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Open Source ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Community",
                            style: TextStyle(color: Colors.amber),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      );
    });
  }
}
