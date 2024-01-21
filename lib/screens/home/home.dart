import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              elevation: 0,
              color: Color(0xFFFFF6E5),
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
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/Rectangle 9.jpg"),
                        ),
                        Card(
                          color: Color(0xFFFFF6E5),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                            child: Row(children: [
                              SvgPicture.asset("assets/arrow down 2.svg"),
                              const Text("october")
                            ]),
                          ),
                        ),
                        SvgPicture.asset("assets/notifiaction.svg")
                      ],
                    ),
                    const Text("Account Balance", style: TextStyle(fontSize: 14)),
                    const Text(
                      "₹38000",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          color: Colors.green,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          SvgPicture.asset("assets/income.svg"),
                                    )),
                              ),
                              const Padding(
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
                                      "₹50000",
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
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          SvgPicture.asset("assets/expense.svg"),
                                    )),
                              ),
                              const Padding(
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
                                      "₹12000",
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
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      color: Color(0xFFF1F1FA),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: Color(0xFFFCEED4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/shopping bag.svg",
                                    ),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shopping",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Buy some grocery",
                                      style: TextStyle(
                                          fontSize: 13, color: Color(0xFF91919F)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "-₹120",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "10:00 AM",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFF91919F)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFF1F1FA),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: Color(0xFFEEE5FF),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/recurring bill.svg",
                                    ),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subscription",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Disney + Annual...",
                                      style: TextStyle(
                                          fontSize: 13, color: Color(0xFF91919F)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "-₹499",
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 16),
                                ),
                                Text(
                                  "03:30 PM",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFF91919F)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFF1F1FA),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: Color(0xFFF1F1FA),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/car.svg",
                                    ),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Travel",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Chandigarh to De..",
                                      style: TextStyle(
                                          fontSize: 13, color: Color(0xFF91919F)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "-₹1000",
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 16),
                                ),
                                Text(
                                  "10:00 AM",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFF91919F)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFF1F1FA),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: Colors.red[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/restaurant.svg",
                                    ),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Food",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Go to Restaurant",
                                      style: TextStyle(
                                          fontSize: 13, color: Color(0xFF91919F)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "-₹32",
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 16),
                                ),
                                Text(
                                  "10:00 AM",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFF91919F)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
