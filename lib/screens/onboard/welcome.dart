import 'package:expense_tracker/screens/auth/signin.dart';
import 'package:expense_tracker/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7F3DFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/Vector.png"),
                  Image.asset("assets/recordcircle.png")
                ],
              ),
              const SizedBox(
                height: 400,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                              child: Text(
                            "Welcome to expense_tracker.",
                            style: TextStyle(fontSize: 36, color: Colors.white),
                          )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: CircleAvatar(
                                radius: 50,
                                child: SvgPicture.asset("assets/vector2.svg")),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "The best way to track your expenses.",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Image.asset("assets/recordcircle2.png")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
