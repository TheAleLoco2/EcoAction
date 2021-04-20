import 'package:eco_action/models/challenge_model.dart';

class UserModel {
  String name;
  String picture;
  String uID;
  String email;
  List<ChallengeModel> challengesDone;
  int level;

  UserModel(this.name, this.email, this.picture, this.uID);
}
