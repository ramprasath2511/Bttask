import 'package:bttask/Model/match.dart';
import 'package:flutter/material.dart';

class TeamDetails extends StatelessWidget {
  final double width;

  final Team team;
  final String teamType;

  const TeamDetails(this.width, this.team, this.teamType);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            teamType,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 80.0,
            width: 60.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Images/player.gif"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            team.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
