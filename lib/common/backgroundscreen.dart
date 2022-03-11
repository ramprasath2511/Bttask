import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({ key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: _size.width * 0.6,
            child: Image.asset("Images/footbal_gif.gif"),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 0.9),
          ),
        ),
      ],
    );
  }
}