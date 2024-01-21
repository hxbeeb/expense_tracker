import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class expense extends StatelessWidget {
  const expense({super.key});

  @override
  Widget build(BuildContext context) {
    var type1 = 0;
    var type2 = 0;
    return Scaffold(
      backgroundColor: const Color(0xFF0077FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0077FF),
        title: const Text(
          "Expense",
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
                                  borderSide: BorderSide(color: Colors.white))),
                          onChanged: (v) {},
                          value: type1,
                          items: const [
                            DropdownMenuItem(
                              value: 0,
                              child: Text("Category"),
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
                      TextField(
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
                                  borderSide: BorderSide(color: Colors.white))),
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
                          borderType:
                              BorderType.RRect, // Use RRect for rounded corners
                          radius:
                              Radius.circular(12), // Radius for rounded corners
                          padding: EdgeInsets.all(
                              12), // Padding inside the dotted border
                          child: Container(
                            width: double.infinity,
                            height: 40,
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
                        onTap: () {},
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
  }
}
