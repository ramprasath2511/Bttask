
import 'package:bttask/Model/match.dart';
import 'package:flutter/material.dart';

class TeamName extends StatelessWidget {

  final double width;

final Team team;
final String teamtype;

  TeamName(this.width, this.team, this.teamtype);

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
          SizedBox(height: 12),
          Container(
            height: 80.0,
            width: 60.0,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("Images/teamgame.gif"),
      fit: BoxFit.fill,
      ),
    ),
          ),
          SizedBox(height: 12),
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