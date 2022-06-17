import 'package:flutter/material.dart';
import 'package:week_menu/resources/resources.dart';
import 'package:week_menu/widgets/recipe_list/recipe_list_widget.dart';

import '../../Theme/app_colors.dart';
import 'week_days.dart';

class DaysListWidget extends StatefulWidget {
  List<Recipe> recipes;

   DaysListWidget({Key? key, required this.recipes}) : super(key: key);

  @override
  State<DaysListWidget> createState() => _DaysListWidgetState(this.recipes);
}

class _DaysListWidgetState extends State<DaysListWidget> {
  var dayListState = List.filled(7, 0);
  List<String> DaysNames= ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  List<String> MealTime= ['Завтрак', 'Обед', 'Ужин', 'Добавить приём пищи'];
  int dayController=0;

  _DaysListWidgetState(recipes);

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
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height-184,
                width: 56,
                child: ListView.builder(
                  itemCount: 7,
                    // itemExtent: 7,
                  itemBuilder: (BuildContext context, int index) {
                  if (dayController == index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        height: 64,
                        width: 64,
                        padding: const EdgeInsets.only(left: 4, right: 4,
                            top: 8, bottom: 8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(0),
                            ),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, top: 12),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(24),),
                              color: AppColors.mainLightGreen,
                            ),
                            child: Text(DaysNames[index],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.mainGreenMoreDark),
                              /*textAlign: TextAlign.center,*/),
                          ),
                        ),
                      ),
                    );
                  }
                  else {
                  return
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, right: 8),
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
                          onPressed: () => setState(() {
                              dayController = index;
                            }),
                          child: Text(DaysNames[index],
                            /*textAlign: TextAlign.center,*/),
                        ),
                      ),
                    );}
                  }
                ),
              ),
            ), //DaysNames
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 13.0),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                      width: MediaQuery.of(context).size.width-88,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height-184,
                      width: MediaQuery.of(context).size.width-88,
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            if (index==3) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: SizedBox(
                                  height: 24,
                                  width: MediaQuery.of(context).size.width-80,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.white),
                                      foregroundColor: MaterialStateProperty.all(
                                          AppColors.unselectedGrey),
                                      textStyle: MaterialStateProperty.all(
                                        const TextStyle(fontSize: 12,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(MealTime[index],
                                      textAlign: TextAlign.center,),
                                  ),
                                ),
                              );
                            } else {
                              return
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                  child: Container(
                                  // height: 48,
                                    width: MediaQuery.of(context).size.width-72,
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 24, 8, 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(MealTime[index],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  color: AppColors.mainGreenMoreDark
                                                  /*letterSpacing: -0.6,*/
                                                ),
                                                // textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 8,),
                                              SizedBox(
                                                height: 48,
                                                width: MediaQuery.of(context).size.width-258,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(
                                                        Colors.white),
                                                    foregroundColor: MaterialStateProperty.all(
                                                        AppColors.foregroundDarkText),
                                                    textStyle: MaterialStateProperty.all(
                                                      const TextStyle(fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    alignment: Alignment.centerLeft,
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('Гречка вареная с маслом',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    // textAlign: TextAlign.start,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 48,
                                                width: MediaQuery.of(context).size.width-258,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(
                                                        Colors.white),
                                                    foregroundColor: MaterialStateProperty.all(
                                                        AppColors.foregroundDarkText),
                                                    textStyle: MaterialStateProperty.all(
                                                      const TextStyle(fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    alignment: Alignment.centerLeft,
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('Чай с бутербродом',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    // textAlign: TextAlign.start,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                              child: SizedBox(
                                                height: 96,
                                                width: 96,
                                                child: Image(
                                                  height: 96,
                                                  width: 96,
                                                  fit:BoxFit.fill,
                                                  image: AssetImage(AppImages.kotletiKlassicheskie2480300x233),
                                                )
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ),
                              );
                            }
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}