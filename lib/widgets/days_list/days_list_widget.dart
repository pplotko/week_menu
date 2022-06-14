import 'package:flutter/material.dart';
import 'package:week_menu/resources/resources.dart';

import '../../Theme/app_colors.dart';
import 'week_days.dart';

class DaysListWidget extends StatefulWidget {
  const DaysListWidget({Key? key}) : super(key: key);

  @override
  State<DaysListWidget> createState() => _DaysListWidgetState();
}

class _DaysListWidgetState extends State<DaysListWidget> {
  var dayListState = List.filled(7, 0);
  List<String> DaysNames= ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  List<String> MealTime= ['Завтрак', 'Обед', 'Ужин', 'Добавить приём пищи'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[AppColors.mainLightGreen, AppColors.foregroundLightGreen],
          ),),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height-184,
                width: 48,
                child: ListView.builder(
                  itemCount: 7,
                    // itemExtent: 7,
                  itemBuilder: (BuildContext context, int index) {
                  return
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        height: 48,
                        width: 48,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.foregroundLightGreen),
                            foregroundColor: MaterialStateProperty.all(
                                AppColors.mainGreenMoreDark),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w500, /*letterSpacing: -0.6,*/),
                            ),
                            padding: MaterialStateProperty.all(EdgeInsets.only(left: 2)),
                            alignment: Alignment.center,
                          ),
                          onPressed: () {},
                          child: Text(DaysNames[index],
                            /*textAlign: TextAlign.center,*/),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0,4),
                      ),],),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height-184,
                  width: MediaQuery.of(context).size.width-88,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width-80,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.mainGreenDark),
                                  textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 12,
                                      fontWeight: FontWeight.w600,),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(MealTime[index],
                                  textAlign: TextAlign.center,),
                              ),
                            ),
                          );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}