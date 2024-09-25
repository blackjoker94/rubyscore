// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubyscore/business_logic/cubits/sport_choose_cubit/sport_choose_cubit.dart';
import 'package:rubyscore/constants/colors.dart';

class SportCategory extends StatelessWidget {
  late String sportImageText;
  late String sportName;
  late bool isSportActive;
  final int index;
  SportCategory({
    Key? key,
    required this.sportImageText,
    required this.sportName,
    //required this.isSportActive,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SportChooseCubit>().selectSport(index),
      
      child: BlocBuilder<SportChooseCubit, int>(
        builder: (context, selectedIndex) {
          bool isSportActive = selectedIndex == index;
          return Container(
            margin: EdgeInsets.fromLTRB(
                15, 20, 0, 20), // symmetric(vertical: 20,horizontal: 22),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            decoration: BoxDecoration(
              color: isSportActive ? MyColors.mypurple : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(33)),
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/${sportImageText}',
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 10.0, height: 0.0),
                Text(
                  "$sportName",
                  style: TextStyle(
                    fontSize: 22,
                    color: isSportActive ? Colors.white : Color(0xFFC2C2C2),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
