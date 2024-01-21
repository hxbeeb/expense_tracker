import 'package:expense_tracker/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<users>(
        builder: (BuildContext context, users value, Widget? child) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        value.id.photoURL ?? auth.currentUser!.photoURL),

                    //  AssetImage("assets/Rectangle 9.jpg"),
                    radius: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        value.id.displayName ??
                            auth.currentUser!.displayName.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Card(
                            color: const Color(0xFFEEE5FF),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/wallet-3.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Account",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Card(
                            color: const Color(0xFFEEE5FF),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/settings.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Card(
                            color: const Color(0xFFEEE5FF),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/upload.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Export Data",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        GoogleSignIn().signOut();

                        auth.signOut();
                      

                        Navigator.pushReplacementNamed(context, '/signin');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Card(
                              color: const Color(0xFFFFE2E4),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/logout.png"),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
