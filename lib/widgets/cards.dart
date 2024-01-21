import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Food_card extends StatelessWidget {
  const Food_card({
    super.key,
    this.money,
    this.desc,
    this.cat,
    this.hour,
    this.minute,
    this.type,
  });
  final money;
  final desc;
  final cat;
  final hour;
  final minute;
  final type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1FA),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Food",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                type == "income"
                    ? Text(money, style: const TextStyle(fontSize: 16))
                    : Text(
                        "-${money}",
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                Text(
                  "${hour}:${minute}",
                  style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Travel_card extends StatelessWidget {
  const Travel_card({
    super.key,
    this.money,
    this.desc,
    this.cat,
    this.hour,
    this.minute,
    this.type,
  });
  final money;
  final desc;
  final cat;
  final hour;
  final minute;
  final type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1FA),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Card(
                  color: const Color(0xFFF1F1FA),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/car.svg",
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Travel",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                type == "income"
                    ? Text(money, style: const TextStyle(fontSize: 16))
                    : Text(
                        "-${money}",
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                Text(
                  "${hour}:${minute}",
                  style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class subscription_card extends StatelessWidget {
  const subscription_card({
    super.key,
    this.money,
    this.desc,
    this.cat,
    this.hour,
    this.minute,
    this.type,
  });
  final money;
  final desc;
  final cat;
  final hour;
  final minute;
  final type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1FA),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Card(
                  color: const Color(0xFFEEE5FF),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/recurring bill.svg",
                    ),
                  ),
                ),
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      desc,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                type == "income"
                    ? Text(money, style: const TextStyle(fontSize: 16))
                    : Text(
                        "-${money}",
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                Text(
                  "${hour}:${minute}",
                  style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class shopping_card extends StatelessWidget {
  const shopping_card({
    super.key,
    this.money,
    this.desc,
    this.cat,
    this.hour,
    this.minute,
    this.type,
  });
  final money;
  final desc;
  final cat;
  final hour;
  final minute;
  final type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1FA),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Card(
                  color: const Color(0xFFFCEED4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/shopping bag.svg",
                    ),
                  ),
                ),
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shopping",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                type == "income"
                    ? Text(money, style: const TextStyle(fontSize: 16))
                    : Text(
                        "-${money}",
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                Text(
                  "${hour}:${minute}",
                  style: const TextStyle(fontSize: 13, color: Color(0xFF91919F)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
