import 'package:flutter/material.dart';

class ProfilePhoto extends StatefulWidget {
  ProfilePhoto(this.photoUrl);

  final String photoUrl;

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                widget.photoUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 90,
            height: 90,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              strokeWidth: 4,
              value: 0.05,
            ),
          )
        ],
      ),
    );
  }
}
