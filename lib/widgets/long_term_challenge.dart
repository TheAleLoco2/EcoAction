import 'package:eco_action/models/challenge_model.dart';
import 'package:eco_action/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class LTChallengeCard extends StatelessWidget {
  const LTChallengeCard(this.model);

  final ChallengeModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTileCard(
        elevation: 0,
        initialElevation: 0,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        title: Text(
          model.title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: kAccentColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontFamily: "Nunito",
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              model.challenge,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: Text("¡Hecho!"),
          ),
          // Container(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: Text(
          //       "Hecho",
          //       style: TextStyle(fontSize: 17),
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.blueAccent,
          //       elevation: 0,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(0.0),
          //       ),
          //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
