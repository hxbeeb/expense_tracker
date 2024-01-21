import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool v = false;
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          color:
                              v ? const Color(0xFF7F3DFF) : Colors.transparent,
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
                    onTap: () {
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
              Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    "assets/flat-color-icons_google.png",
                    width: 70,
                  ),
                  const Text(
                    "Sign Up with Google",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  )
                ]),
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
      ),
    );
  }
}
