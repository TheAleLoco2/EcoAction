import 'package:eco_action/models/challenge_model.dart';
import 'package:eco_action/models/ods_model.dart';
import 'package:eco_action/utils/constants.dart';
import 'package:eco_action/utils/ods_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChallengeCard extends StatelessWidget {
  ChallengeCard(this.model);

  final ChallengeModel model;

  final List<ODSModel> ODSs = getODSs();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text(
              model.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: kAccentColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontFamily: "Nunito",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              model.challenge,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Nunito",
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: model.odsNumber
                  .map(
                    (number) => Card(
                      elevation: 0,
                      color: ODSs[number + 1].odsColor,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        width: 32,
                        height: 32,
                        child: Center(
                          child: Text(
                            number.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Nunito"),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            child: CustomButton(),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "¡Hecho!",
        style: TextStyle(fontSize: 17),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
