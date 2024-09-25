import 'package:flutter/material.dart';
import 'package:rubyscore/business_logic/cubits/soccer_cubit/soccer_cubit.dart';
import 'package:rubyscore/business_logic/cubits/sport_choose_cubit/sport_choose_cubit.dart';
import 'package:rubyscore/data/repos/football_repo.dart';
import 'presentation/screens/home_screen.dart';
import 'data/web_services/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late FootballRepo footballRepo;
  late SoccerCubit soccerCubit;
  AppRouter() {
    footballRepo = FootballRepo(Api());
    soccerCubit = SoccerCubit(footballRepo);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (BuildContext context) =>
                          SoccerCubit(footballRepo),
                    ),
                    BlocProvider(
                      create: (context) => SportChooseCubit(),
                    ),
                  ],
                  child: const HomeScreen(),
                ));
      case '/match_details':
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
