import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/widgets/cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class transactions extends StatefulWidget {
  const transactions({super.key});

  @override
  State<transactions> createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<users>(
        builder: (BuildContext context, users value, Widget? child) {
      return Scaffold(
        body: StreamBuilder(
            stream: db
                .collection("users")
                .doc(value.id.uid)
                .collection("transactions").orderBy("timestamp")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      if (snapshot.data!.docs[index]["category"] == "Food") {
                        return Food_card(
                          money: snapshot.data!.docs[index]["money"],
                          type: snapshot.data!.docs[index]["type"],
                          desc: snapshot.data!.docs[index]["description"],
                          hour: snapshot.data!.docs[index]["hour"],
                          minute: snapshot.data!.docs[index]["minute"],
                        );
                      }
                      if (snapshot.data!.docs[index]["category"] == "Shopping") {
                        return shopping_card(
                          money: snapshot.data!.docs[index]["money"],
                          type: snapshot.data!.docs[index]["type"],
                          desc: snapshot.data!.docs[index]["description"],
                          hour: snapshot.data!.docs[index]["hour"],
                          minute: snapshot.data!.docs[index]["minute"],
                        );
                      }
                      if (snapshot.data!.docs[index]["category"] == "Travel") {
                        return  Travel_card(
                          money: snapshot.data!.docs[index]["money"],
                          type: snapshot.data!.docs[index]["type"],
                          desc: snapshot.data!.docs[index]["description"],
                          hour: snapshot.data!.docs[index]["hour"],
                          minute: snapshot.data!.docs[index]["minute"],
                        );
                      }
                      if (snapshot.data!.docs[index]["category"] ==
                          "Subscription") {
                        return shopping_card(
                        money: snapshot.data!.docs[index]["money"],
                        type: snapshot.data!.docs[index]["type"],
                        desc: snapshot.data!.docs[index]["description"],
                        hour: snapshot.data!.docs[index]["hour"],
                        minute: snapshot.data!.docs[index]["minute"],
                      );
                      }
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
