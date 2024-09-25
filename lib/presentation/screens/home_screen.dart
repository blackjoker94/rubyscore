import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rubyscore/constants/colors.dart';
import 'package:rubyscore/presentation/widgets/sport_catergory.dart';
import 'package:rubyscore/presentation/widgets/matches_date.dart';
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
      body: BlocBuilder<SoccerCubit, SoccerState>(builder: (context, state) {
        if (state is SoccerLoading) {
          LoadingWidget();
        } else if (state is SoccerFailed) {
          FailedWidget();
        }
        return Column(
          children: [
            Container(
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
            Container(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //Todo => mesh 3aref a3melha bel cubit
                  MachesDate(),
                  MachesDate(),
                  MachesDate(),
                  MachesDate(),
                  MachesDate(),
                  MachesDate(),
                  MachesDate(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: LoadingIndicator(
        indicatorType: Indicator.ballClipRotateMultiple,
        colors: const [Color(0xFF7471FE)],
        strokeWidth: 2,
      )),
    );
  }
}

class FailedWidget extends StatelessWidget {
  const FailedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Image.asset('assets/images/Failed.png'),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'Failed to Load.. Can\'t Score.',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: MyColors.mypurple,
            ),
          )
        ],
      ),
    );
  }
}
