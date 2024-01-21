import 'package:expense_tracker/screens/auth/signin.dart';
import 'package:expense_tracker/screens/onboard/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const welcome()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF7F3DFF)
            // gradient: LinearGradient(
            //     colors: [AppColor.appPrimaryColor],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight)
            ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image.asset("assets/recordcircle.png")],
              ),
              Column(
                children: [
                  SizedBox(
                      child: Image.asset(
                    "assets/Vector.png",
                  )),
                  const Text(
                    "CipherX",
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ],
              ),
              Stack(children: [Image.asset("assets/recordcircle2.png"),
              const Column(
                children: [
                  SizedBox(height: 200,),
                  Text(
                    "By",
                    style: TextStyle(color: Colors.white),
                  ),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Open Source ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Community",
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ), ],
              ),]),
            ],
          ),
        ),
      ),
    );
  }
}
