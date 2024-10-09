import 'package:flutter/material.dart';
class MatchBoard extends StatelessWidget {
  const MatchBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.fromLTRB(13, 7, 13, 7),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0), // Added padding for left and right
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,// Align items vertically centered
          children: [
            // Teams and Scores
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Aligns vertically in the middle
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
     Row(
       children: <Widget>[
         Image.asset(
           'assets/images/soccer.png',
           height: 25,
           width: 25,
         ),
         SizedBox(width: 10),
         Text(
           "Team 1",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w500,
           ),
         ),
         Spacer(), // Pushes the score to the right
         Text(
           '0', // Score of Team 1
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w500,
           ),
         ),
         Spacer(),
       ],
     ),
     SizedBox(height: 25), // Space between rows
     Row(
       children: <Widget>[
         Image.asset(
           'assets/images/soccer.png',
           height: 25,
           width: 25,
         ),
         SizedBox(width: 10),
         Text(
           "Team 2",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w500,
           ),
         ),
         Spacer(), // Pushes the score to the right
         Text(
           '2', // Score of Team 2
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w500,
           ),
         ),
         Spacer(),
       ],
     ),
                ],
              ),
            ),
            // Match time in the center-right
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "55`", // Match time
                style: TextStyle(
     fontSize: 22,
     fontWeight: FontWeight.bold,
     color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}