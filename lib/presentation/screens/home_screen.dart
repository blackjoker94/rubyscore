import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubyscore/presentation/widgets/sport_catergory.dart';

import '../../business_logic/cubits/soccer_cubit/soccer_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Ruby",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            TextSpan(
              text: "score",
              style: TextStyle(
                fontSize: 33,
                color: Colors.black,
              ),
            ),
          ]),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 33,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 26),
          ),
        ],
      ),
      body: Container(
        height: 110,
        child: BlocBuilder<SoccerCubit, SoccerState>(
          builder: (context, state) {
            return ListView(
              
              scrollDirection: Axis.horizontal,

                  children: [
                    SportCategory(
                  sportImageText: 'soccer.png',
                  sportName: 'Football',
                  index: 0,
                ),
                SportCategory(
                  sportImageText: 'basketball.png',
                  sportName: 'Basketball',
                  index: 1,
                ),
                SportCategory(
                  sportImageText: 'baseball.png',
                  sportName: 'Baseball',
                  index: 2,
                ),
                  ],
            );
          },
        ),
      ),
    );
  }
}
