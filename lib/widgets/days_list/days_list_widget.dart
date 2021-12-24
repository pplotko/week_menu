import 'package:flutter/material.dart';
import 'package:json_placeholder_app/widgets/days_list/week_days.dart';
import 'package:json_placeholder_app/Theme/app_colors.dart';

class DaysListWidget extends StatefulWidget {
  DaysListWidget({Key? key}) : super(key: key);

  @override
  State<DaysListWidget> createState() => _DaysListWidgetState();
}

class _DaysListWidgetState extends State<DaysListWidget> {
  var dayListState = List.filled (7, 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: Day.week.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              dayListState [index] == 0 ? dayListState [index] = 1 : dayListState [index] = 0;
              print(index);
              setState(() {
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Text('Detail page');
              // },),
              // );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildDayCard(Day.week[index]),
                dayListState [index] == 1 ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      children: [
                        Text("Завтрак: "),
                        Text("Какая-то вкусняшка)"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Обед: "),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Ужин: "),
                      ],
                    )]),
                ) :
                Container(color: Colors.red),
              ],
            ),
          );
        },
      );
    }
}
Widget buildDayCard(Day day) {
  return Card(
    elevation: 8.0,
    color: AppColors.mainLightBlue,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
        )
    ),
    child: Padding( padding: const EdgeInsets.all(10.0),
      child: Column( children: [ /*Text(day.id.toString()),
          const SizedBox( height: 14.0, ),*/
        Text( day.label,
          style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.w700,
            fontFamily: 'Palatino', ),
        ),
        ], ),
    ),
  );
}