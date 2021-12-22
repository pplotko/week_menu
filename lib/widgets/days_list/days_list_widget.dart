import 'package:flutter/material.dart';
import 'package:json_placeholder_app/widgets/days_list/week_days.dart';
import 'package:json_placeholder_app/Theme/app_colors.dart';

class DaysListWidget extends StatelessWidget {
  const DaysListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: Day.week.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Text('Detail page');
              },),
              );
            },
            child: buildDayCard(Day.week[index]),
          );
        },
      );
    }
  }
Widget buildDayCard(Day day) {
  return Card(
    elevation: 6.0,
    color: AppColors.mainLightBlue,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
        )
    ),
    child: Padding( padding: const EdgeInsets.all(16.0),
      child: Column( children: <Widget>[ /*Text(day.id.toString()),
          const SizedBox( height: 14.0, ),*/
        Text( day.label,
          style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.w700,
            fontFamily: 'Palatino', ),
        )
      ], ), ),
  );
}