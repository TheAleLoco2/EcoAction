import 'package:eco_action/widgets/profile_photo.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  FriendCard(this.photoUrl);

  final photoUrl;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [ProfilePhoto(photoUrl), Text("data")],
      ),
    );
  }
}
