import 'package:eco_action/data/challenges.dart';
import 'package:eco_action/models/challenge_model.dart';
import 'package:eco_action/utils/constants.dart';
import 'package:eco_action/widgets/challenge_card.dart';
import 'package:eco_action/widgets/long_term_challenge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChallengeModel> challenges;
  List<ChallengeModel> longTermChallenges;

  @override
  void initState() {
    super.initState();

    challenges = getChallenges();
    longTermChallenges = getChallenges();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "Eco-Actions",
          style: TextStyle(
            fontSize: 22,
            color: kAccentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChallengeCard(
              challenges[1],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Otros retos:",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: longTermChallenges.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return LTChallengeCard(challenges[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
