import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/screens/home/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var user;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
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
          context, MaterialPageRoute(builder: (context) => pages()));

      print("Signed up: ${user!.displayName}");

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  bool v = false;
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<users>(
          builder: (BuildContext context, users value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sign Up"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 70,
                  child: TextField(
                    controller: name,
                    style: const TextStyle(fontSize: 20),
                    autofocus: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Name",
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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          v = !v;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: const Color(0xFF7F3DFF), width: 2),
                            color: v
                                ? const Color(0xFF7F3DFF)
                                : Colors.transparent,
                          ),
                          child: v
                              ? const Icon(
                                  Icons.check,
                                  size: 18.0,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("By singing up, you agree to the ",
                                style: TextStyle(fontSize: 16)),
                            Text("Terms of",
                                style: TextStyle(
                                    color: Color(0xFF7F3DFF), fontSize: 16))
                          ],
                        ),
                        Text(
                          "Service and Privacy Policy",
                          style:
                              TextStyle(color: Color(0xFF7F3DFF), fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: InkWell(
                      onTap: () async {
                        await auth.createUserWithEmailAndPassword(
                            email: email.text, password: password.text);
                        value.id = auth.currentUser;
                        await auth.currentUser!.updateDisplayName(name.text);
                        await auth.currentUser!.updatePhotoURL(
                            "https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg");
                        await db
                            .collection("users")
                            .doc(auth.currentUser!.uid)
                            .set({
                          "name": name.text,
                          "email": email.text,
                          "photo":
                              "https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg",
                          "income": 0,
                          "expense": 0
                        }, SetOptions(merge: true));

                        Navigator.pushReplacementNamed(context, '/pages');
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7F3DFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                          child: Center(
                            child: Text(
                              "Sign Up",
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
                    if (fieldValue == 0 && fieldValue2 == 0) {
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
                    Future<void> fetchFieldValue() async {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      String documentId =
                          value.id.uid; // Replace with your actual document ID

                      try {
                        // Replace "your_collection" with the name of your collection
                        DocumentSnapshot snapshot = await firestore
                            .collection("users")
                            .doc(documentId)
                            .get();

                        if (snapshot.exists) {
                          // Access the value of the 'fieldName' field
                          value.income = snapshot.get("income");
                          value.expense = snapshot.get("expense");
                          value.balance = value.income - value.expense;
                        }
                      } catch (e) {
                        print('Error fetching field value: $e');
                      }
                    }

                    await fetchFieldValue();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => pages()));
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
                            "Sign Up with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text("Login"))
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
