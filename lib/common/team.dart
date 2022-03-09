
import 'package:bttask/Model/match.dart';
import 'package:flutter/material.dart';

class TeamLogoName extends StatelessWidget {

  final double width;

final Team team;
final String teamtype;

  TeamLogoName(this.width, this.team, this.teamtype);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
           teamtype,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Icon(Icons.camera),
          SizedBox(height: 16),
          Text(
               team.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}