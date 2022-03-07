import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color warna;
  final VoidCallback press;

  const MyCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.warna,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: const Color(0XFFECEFF1),
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: press,
          splashColor: warna,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 70.0,
                  color: warna,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
