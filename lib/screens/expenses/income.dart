import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expense_tracker/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class income extends StatefulWidget {
  const income({super.key});

  @override
  State<income> createState() => _incomeState();
}

class _incomeState extends State<income> {
  var type1 = 0;
  var type2 = 0;
  var cat = "";
  TextEditingController description = TextEditingController();
  TextEditingController money = TextEditingController();
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var error = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<users>(
        builder: (BuildContext context, users value, Widget? child) {
      Future<void> fetchFieldValue(String m) async {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        String documentId =
            value.id.uid; // Replace with your actual document ID

        try {
          // Replace "your_collection" with the name of your collection
          DocumentSnapshot snapshot =
              await firestore.collection("users").doc(documentId).get();

          if (snapshot.exists) {
            // Access the value of the 'fieldName' field
            dynamic fieldValue = snapshot.get("income") ?? 0;
            if (fieldValue == null) {
              await db
                  .collection("users")
                  .doc(value.id.uid)
                  .set({"income": int.parse(m)}, SetOptions(merge: true));
            } else {
              await db.collection("users").doc(value.id.uid).set(
                  {"income": fieldValue + int.parse(m)},
                  SetOptions(merge: true));
            }

            if (fieldValue != null) {
              print('Field value: $fieldValue');
            } else {
              print('Field is null or undefined');
            }
          } else {
            print('Document does not exist');
          }
        } catch (e) {
          print('Error fetching field value: $e');
        }
      }

      return Scaffold(
        backgroundColor: const Color(0xFF7B61FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF7B61FF),
          title: const Text(
            "Income",
            style: TextStyle(
              color: Color(0xFFFCFCFC),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  "How much?",
                  style: TextStyle(color: Color(0xFFFCFCFC), fontSize: 18),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: money,
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                  autofocus: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "₹0",
                    hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      child: Column(children: [
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            onChanged: (v) {
                              setState(() {
                                type1 = v!;
                              });
                            },
                            value: type1,
                            items: const [
                              DropdownMenuItem(
                                value: 0,
                                child: Text("Category"),
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Shopping"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Subscription"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Travel"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("Food"),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: description,
                          autofocus: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Description',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            onChanged: (v) {},
                            value: type2,
                            items: const [
                              DropdownMenuItem(
                                value: 0,
                                child: Text("Wallet"),
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text("option 1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("option 2"),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        DottedBorder(
                            color: Colors.grey, // Dotted line color
                            strokeWidth: 1, // Dotted line width
                            borderType: BorderType
                                .RRect, // Use RRect for rounded corners
                            radius: Radius.circular(
                                12), // Radius for rounded corners
                            padding: EdgeInsets.all(
                                12), // Padding inside the dotted border
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: error == true
                                  ? Text("Enter amount and Select Category")
                                  : null,
                              // Your content inside the dotted container
                            )),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 0.1,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: InkWell(
                          onTap: () async {
                            var time = Timestamp.now().millisecondsSinceEpoch;

                            if (type1 == 1) cat = "Shopping";

                            if (type1 == 2) cat = "Subscription";
                            if (type1 == 3) cat = "Travel";
                            if (type1 == 4) cat = "Food";
                            if (money.text != "" && type1 != 0) {
                              var m = money.text;
                              money.text = "";
                              await db
                                  .collection("users")
                                  .doc(auth.currentUser!.uid)
                                  .collection("transactions")
                                  .doc(time.toString())
                                  .set({
                                "type": "income",
                                "money": m,
                                "timestamp": time,
                                "category": cat,
                                "description": description.text,
                                "hour": DateTime.now().hour,
                                "minute": DateTime.now().minute
                              });
                              await fetchFieldValue(m);
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                error = true;
                                type1 = 0;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF7F3DFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
