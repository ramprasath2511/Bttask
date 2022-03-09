
import 'package:flutter/material.dart';

class TeamLogoName extends StatelessWidget {

  final double width;



  TeamLogoName(this.width);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
           "Home or Away",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Icon(Icons.camera),
          SizedBox(height: 16),
          Text(
            "teamname",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}