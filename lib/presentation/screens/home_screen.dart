import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rubyscore/utilities/date_service.dart';
import 'package:rubyscore/constants/colors.dart';
import 'package:rubyscore/presentation/widgets/sport_catergory.dart';
import 'package:rubyscore/presentation/widgets/matches_date.dart';
import '../../business_logic/cubits/soccer_cubit/soccer_cubit.dart';
import 'package:rubyscore/presentation/widgets/match_board.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateMethods dateMethods = DateMethods();
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
          return LoadingWidget();
        } else if (state is SoccerFailed) {
          return FailedWidget();
        } else
          return Column(
            children: [
              Container(
                height: 110,
                child: ListView(
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
                ),
              ),
              Container(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Previous days
                    MatchesDate(
                      dayNum: dateMethods.previousDaysNum()[1],
                      dayName: dateMethods.previousDaysNames()[1],
                    ),
                    MatchesDate(
                      dayNum: dateMethods.previousDaysNum()[0],
                      dayName: dateMethods.previousDaysNames()[0],
                    ),
                    // Today
                    MatchesDate(
                      dayNum: dateMethods.getCurrentDay(),
                      dayName: 'Today',
                      isToday: true,
                    ),
                    // Coming days
                    MatchesDate(
                      dayNum: dateMethods.comingDaysNum()[0],
                      dayName: dateMethods.comingDaysNames()[0],
                    ),
                    MatchesDate(
                      dayNum: dateMethods.comingDaysNum()[1],
                      dayName: dateMethods.comingDaysNames()[1],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              TournamentBoard(),
            ],
          );
      }),
    );
  }
}

class TournamentBoard extends StatelessWidget {
  const TournamentBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.fromLTRB(13, 7, 13, 7),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/soccer.png',
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(width: 10.0, height: 0.0),
                    Text(
                      "Champoins League",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MatchBoard()
        ],
      ),
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
