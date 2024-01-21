import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/widgets/cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<users>(
          builder: (BuildContext context, users value, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              Card(
                elevation: 0,
                color: const Color(0xFFFFF6E5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(value.id.photoURL ??
                                  auth.currentUser!.photoURL.toString())),
                          Card(
                            color: const Color(0xFFFFF6E5),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                              child: Row(children: [
                                SvgPicture.asset("assets/arrow down 2.svg"),
                                Text(DateFormat('MMMM').format(DateTime.now()))
                              ]),
                            ),
                          ),
                          SvgPicture.asset("assets/notifiaction.svg")
                        ],
                      ),
                      const Text("Account Balance",
                          style: TextStyle(fontSize: 14)),
                      Text(
                        "₹${value.balance.toString()}",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            color: Colors.green,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                            "assets/income.svg"),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Income",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      Text(
                                        "₹${value.income}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            color: Colors.red,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                            "assets/expense.svg"),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expenses",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      Text(
                                        "₹${value.expense}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Card(
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 0,
                      color: Color(0xFFFCEED4),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                        child: Text(
                          "Today",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                        child: Text("Week"),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                        child: Text("Month"),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                        child: Text("Year"),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transaction",
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    Card(
                      color: Color(0xFFEEE5FF),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Text("See All",
                            style: TextStyle(color: Color(0xFF7F3DFF))),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: StreamBuilder(
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
                              if (snapshot.data!.docs[index]["category"] ==
                                  "Food") {
                                return Food_card(
                                  money: snapshot.data!.docs[index]["money"],
                                  type: snapshot.data!.docs[index]["type"],
                                  desc: snapshot.data!.docs[index]
                                      ["description"],
                                  hour: snapshot.data!.docs[index]["hour"],
                                  minute: snapshot.data!.docs[index]["minute"],
                                );
                              }
                              if (snapshot.data!.docs[index]["category"] ==
                                  "Shopping") {
                                return shopping_card(
                                  money: snapshot.data!.docs[index]["money"],
                                  type: snapshot.data!.docs[index]["type"],
                                  desc: snapshot.data!.docs[index]
                                      ["description"],
                                  hour: snapshot.data!.docs[index]["hour"],
                                  minute: snapshot.data!.docs[index]["minute"],
                                );
                              }
                              if (snapshot.data!.docs[index]["category"] ==
                                  "Travel") {
                                return Travel_card(
                                  money: snapshot.data!.docs[index]["money"],
                                  type: snapshot.data!.docs[index]["type"],
                                  desc: snapshot.data!.docs[index]
                                      ["description"],
                                  hour: snapshot.data!.docs[index]["hour"],
                                  minute: snapshot.data!.docs[index]["minute"],
                                );
                              }
                              if (snapshot.data!.docs[index]["category"] ==
                                  "Subscription") {
                                return shopping_card(
                                  money: snapshot.data!.docs[index]["money"],
                                  type: snapshot.data!.docs[index]["type"],
                                  desc: snapshot.data!.docs[index]
                                      ["description"],
                                  hour: snapshot.data!.docs[index]["hour"],
                                  minute: snapshot.data!.docs[index]["minute"],
                                );
                              }
                              return shopping_card(
                                  money: snapshot.data!.docs[index]["money"],
                                  type: snapshot.data!.docs[index]["type"],
                                  desc: snapshot.data!.docs[index]
                                      ["description"],
                                  hour: snapshot.data!.docs[index]["hour"],
                                  minute: snapshot.data!.docs[index]["minute"],
                                );
                            });
                      }
                      return const Center(
                        child:  Text("No Transactions"),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
