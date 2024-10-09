// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubyscore/utilities/date_service.dart';
import 'package:rubyscore/constants/colors.dart';

class MatchesDate extends StatelessWidget {
  final String dayNum;
  final String dayName;
  final bool isToday;
  DateMethods dateMethods = DateMethods();
   MatchesDate({
    Key? key,
    required this.dayNum,
    required this.dayName,
    this.isToday=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
          return Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            decoration: const BoxDecoration(
              color: Color(0xFFF9F9FB),
              borderRadius: BorderRadius.all(Radius.circular(45)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isToday ? 'Today' : '$dayName',
                  style: TextStyle(
                    fontSize: 22,
                    color: isToday ? MyColors.mypurple: Color(0xFFC2C2C2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '$dayNum', // Display the current day number
                      style: TextStyle(
                        fontSize: 22,
                        color: isToday ? MyColors.mypurple: Color(0xFFC2C2C2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      dateMethods.getMonthName(), // Display the month name
                      style: TextStyle(
                        fontSize: 22,
                        color: isToday ? MyColors.mypurple: Color(0xFFC2C2C2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } 
  }

