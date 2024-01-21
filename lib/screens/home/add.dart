import 'package:flutter/material.dart';

class add extends StatelessWidget {
  const add({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/expense');
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
                          "Add Expense",
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 22),
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 70,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/income');
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
                          "Add Income",
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 22),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
