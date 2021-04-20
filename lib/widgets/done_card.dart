import 'package:flutter/material.dart';

class DoneCard extends StatelessWidget {
  const DoneCard({this.points, this.message});

  final int points;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ganaste " + points.toString() + " puntos",
              style: TextStyle(
                color: Colors.green.shade500,
                fontSize: 20,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              message,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontFamily: "Nunito",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Vuelve en 12 horas por el próximo reto...",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
