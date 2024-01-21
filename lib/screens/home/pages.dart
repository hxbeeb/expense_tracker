import 'package:expense_tracker/providers/user.dart';
import 'package:expense_tracker/screens/home/add.dart';
import 'package:expense_tracker/screens/home/budget.dart';
import 'package:expense_tracker/screens/home/home.dart';
import 'package:expense_tracker/screens/home/profile.dart';
import 'package:expense_tracker/screens/home/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class pages extends StatefulWidget {


 const  pages( {super.key});

  @override
  State<pages> createState() => _pagesState();
}

class _pagesState extends State<pages> {
  var i = 0;
  List screens = [home(), transactions(), add(), budget(), profile()];
  @override
  Widget build(BuildContext context) {
    return Consumer<users>(
        builder: (BuildContext context, users value, Widget? child) {
     
      return Scaffold(
        body: screens[i],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (v) {
              setState(() {
                i = v;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/home.svg",
                    color: i != 0 ? Colors.grey : Color(0xFF7F3DFF),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/Transaction.svg",
                    color: i == 1 ? Color(0xFF7F3DFF) : null,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF7F3DFF),
                      child: SvgPicture.asset(
                        "assets/close.svg",
                      )),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/pie chart.svg",
                    color: i == 3 ? Color(0xFF7F3DFF) : null,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/user.svg",
                    color: i == 4 ? Color(0xFF7F3DFF) : null,
                  ),
                  label: "")
            ]),
      );
    });
  }
}
