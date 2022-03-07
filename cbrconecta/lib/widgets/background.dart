import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.2, 0.5, 0.8, 0.7],
        colors: [
          Color(0XFFE3F2FD),
          Color(0XFFBBDEFB),
          Color(0XFF90CAF9),
          Color(0XFF64B5F6)
        ],
      )),
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: size.height * 0.4,
            top: 0,
            right: 0,
            child:
                Image.asset("assets/images/logo.png", width: size.width * 0.5),
          ),
          child
        ],
      ),
    );
  }
}
