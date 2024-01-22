import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/widgets/cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class transactions extends StatefulWidget {
  const transactions({super.key});

  @override
  State<transactions> createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
  var type;
  var money;

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<users>(
        builder: (BuildContext context, users value, Widget? child) {
      Future<void> fetchFieldValue(String m, String t) async {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        String documentId =
            value.id.uid; // Replace with your actual document ID

        try {
          // Replace "your_collection" with the name of your collection
          DocumentSnapshot snapshot =
              await firestore.collection("users").doc(documentId).get();

          if (snapshot.exists) {
            if (t == "expense") {
              dynamic fieldValue = await snapshot.get("expense");
              await db.collection("users").doc(value.id.uid).set(
                  {"expense": fieldValue - int.parse(m)},
                  SetOptions(merge: true));
              value.expense = fieldValue - int.parse(m);
            }
            if (t == "income") {
              dynamic fieldValue2 = await snapshot.get("income");
              await db.collection("users").doc(value.id.uid).set(
                  {"income": fieldValue2 - int.parse(m)},
                  SetOptions(merge: true));
              value.income = fieldValue2 - int.parse(m);
            }
            var income = await snapshot.get("income");
            var expense = await snapshot.get("expense");
            value.balance = income - expense;
            value.income = income;
            value.expense = expense;
            // Access the value of the 'fieldName' field
          } else {
            print('Document does not exist');
          }
        } catch (e) {
          print('Error fetching field value: $e');
        }
      }

      return Scaffold(
        body: StreamBuilder(
            stream: db
                .collection("users")
                .doc(value.id.uid)
                .collection("transactions")
                .orderBy("timestamp")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      if (snapshot.data!.docs[index]["category"] == "Food") {
                        return Slidable(
                          endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              onPressed: (_) async {
                                var t = snapshot.data!.docs[index]["type"];
                                var m = snapshot.data!.docs[index]["money"];
                                await fetchFieldValue(m, t);
                                var id = await snapshot.data!.docs[index]
                                    ["timestamp"];
                                await db
                                    .collection("users")
                                    .doc(value.id.uid)
                                    .collection("transactions")
                                    .doc(id)
                                    .delete();
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                            )
                          ]),
                          child: Food_card(
                            money: snapshot.data!.docs[index]["money"],
                            type: snapshot.data!.docs[index]["type"],
                            desc: snapshot.data!.docs[index]["description"],
                            hour: snapshot.data!.docs[index]["hour"],
                            minute: snapshot.data!.docs[index]["minute"],
                          ),
                        );
                      }
                      if (snapshot.data!.docs[index]["category"] ==
                          "Shopping") {
                        return Slidable(
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                onPressed: (_) async {
                                  var t = snapshot.data!.docs[index]["type"];
                                  var m = snapshot.data!.docs[index]["money"];
                                  await fetchFieldValue(m, t);
                                  var id = await snapshot.data!.docs[index]
                                      ["timestamp"];
                                  await db
                                      .collection("users")
                                      .doc(value.id.uid)
                                      .collection("transactions")
                                      .doc(id)
                                      .delete();
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                              )
                            ]),
                            child: shopping_card(
                              money: snapshot.data!.docs[index]["money"],
                              type: snapshot.data!.docs[index]["type"],
                              desc: snapshot.data!.docs[index]["description"],
                              hour: snapshot.data!.docs[index]["hour"],
                              minute: snapshot.data!.docs[index]["minute"],
                            ));
                      }
                      if (snapshot.data!.docs[index]["category"] == "Travel") {
                        return Slidable(
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                onPressed: (_) async {
                                  var t = snapshot.data!.docs[index]["type"];
                                  var m = snapshot.data!.docs[index]["money"];
                                  await fetchFieldValue(m, t);
                                  var id = await snapshot.data!.docs[index]
                                      ["timestamp"];
                                  await db
                                      .collection("users")
                                      .doc(value.id.uid)
                                      .collection("transactions")
                                      .doc(id)
                                      .delete();
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                              )
                            ]),
                            child: Travel_card(
                              money: snapshot.data!.docs[index]["money"],
                              type: snapshot.data!.docs[index]["type"],
                              desc: snapshot.data!.docs[index]["description"],
                              hour: snapshot.data!.docs[index]["hour"],
                              minute: snapshot.data!.docs[index]["minute"],
                            ));
                      }
                      if (snapshot.data!.docs[index]["category"] ==
                          "Subscription") {
                        return Slidable(
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                onPressed: (_) async {
                                  var t = snapshot.data!.docs[index]["type"];
                                  var m = snapshot.data!.docs[index]["money"];
                                  await fetchFieldValue(m, t);
                                  var id = await snapshot.data!.docs[index]
                                      ["timestamp"];
                                  await db
                                      .collection("users")
                                      .doc(value.id.uid)
                                      .collection("transactions")
                                      .doc(id)
                                      .delete();
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                              )
                            ]),
                            child: shopping_card(
                              money: snapshot.data!.docs[index]["money"],
                              type: snapshot.data!.docs[index]["type"],
                              desc: snapshot.data!.docs[index]["description"],
                              hour: snapshot.data!.docs[index]["hour"],
                              minute: snapshot.data!.docs[index]["minute"],
                            ));
                      }
                      return Slidable(
                          endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              onPressed: (_) async {
                                var t = snapshot.data!.docs[index]["type"];
                                var m = snapshot.data!.docs[index]["money"];
                                var id = snapshot.data!.docs[index].id;
                                await db
                                    .collection("users")
                                    .doc(value.id.uid)
                                    .collection("transactions")
                                    .doc(id)
                                    .delete();
                                await fetchFieldValue(m, t);
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                            )
                          ]),
                          child: shopping_card(
                            money: snapshot.data!.docs[index]["money"],
                            type: snapshot.data!.docs[index]["type"],
                            desc: snapshot.data!.docs[index]["description"],
                            hour: snapshot.data!.docs[index]["hour"],
                            minute: snapshot.data!.docs[index]["minute"],
                          ));
                    });
              }
              return const Center(
                child: const Text("No Transactions"),
              );
            }),
      );
    }));
  }
}
