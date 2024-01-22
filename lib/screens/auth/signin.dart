import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/screens/home/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final db = FirebaseFirestore.instance;
  var user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> handleSignUp() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      user = authResult.user;
      var id = googleSignIn.currentUser!.id;
      await context.read<users>().id(id);
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const pages()));

      print("Signed up: ${user!.displayName}");

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<users>(
          builder: (BuildContext context, users value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sign In"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                const SizedBox(
                  height: 160,
                ),
                SizedBox(
                  height: 70,
                  child: TextField(
                    controller: email,
                    style: const TextStyle(fontSize: 20),
                    autofocus: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: TextField(
                    controller: password,
                    obscureText: pass,
                    style: const TextStyle(fontSize: 20),
                    autofocus: false,
                    decoration: InputDecoration(
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              pass = !pass;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: InkWell(
                      onTap: () async {
                        await auth.signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                        value.id = auth.currentUser;

                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;
                        String documentId = value.id.uid;

                        DocumentSnapshot snapshot = await firestore
                            .collection("users")
                            .doc(documentId)
                            .get();
                        dynamic fieldValue = await snapshot.get("expense");
                        dynamic fieldValue2 = await snapshot.get("income");

                        value.expense = fieldValue;
                        value.income = fieldValue2;
                        value.balance = value.income - value.expense;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const pages()));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7F3DFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 22),
                            ),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Or with",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    await handleSignUp();
                    value.id = user;
                    FirebaseFirestore firestore = FirebaseFirestore.instance;
                    String documentId = value.id.uid;

                    DocumentSnapshot snapshot = await firestore
                        .collection("users")
                        .doc(documentId)
                        .get();
                    dynamic fieldValue = await snapshot.get("expense");
                    dynamic fieldValue2 = await snapshot.get("income");
                    value.expense = fieldValue;
                    value.income = fieldValue2;
                    value.balance = value.income - value.expense;

                    if (fieldValue == null && fieldValue2 == null) {
                      db.collection("users").doc(auth.currentUser!.uid).set({
                        "name": user.displayName,
                        "email": user.email,
                        "photo": user.photoURL,
                        "income": 0,
                        "expense": 0
                      }, SetOptions(merge: true));
                    } else {
                      db.collection("users").doc(auth.currentUser!.uid).set({
                        "name": user.displayName,
                        "email": user.email,
                        "photo": user.photoURL,
                      }, SetOptions(merge: true));
                    }
                    await db.collection("users").doc(auth.currentUser!.uid).set(
                        {
                          "name": user.displayName,
                          "email": user.email,
                          "photo": user.photoURL
                        },
                        SetOptions(merge: true));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const pages()));
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/flat-color-icons_google.png",
                            width: 70,
                          ),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'signup');
                        },
                        child: const Text("Signup"))
                  ],
                )
              ]),
            ),
          ),
        );
      }),
    );
  }
}
