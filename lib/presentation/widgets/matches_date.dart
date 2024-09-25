import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubyscore/business_logic/cubits/matches_date_cubit/matches_date_cubit.dart';

class MachesDate extends StatelessWidget {
  const MachesDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => context.read<SportChooseCubit>().selectSport(index),

      child: BlocBuilder<MatchesDateCubit, MatchesDateState>(
        builder: (context, state) {
          //code
          return Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            decoration: BoxDecoration(
              color: Color(0xFFF9F9FB),
              borderRadius: BorderRadius.all(Radius.circular(45)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFFC2C2C2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "25",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFC2C2C2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Nov",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFC2C2C2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
