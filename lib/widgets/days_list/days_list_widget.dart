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


// Container(
//   width: double.infinity,
//   height: double.infinity,
//   decoration: const BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: <Color>[AppColors.mainLightGreen, AppColors.foregroundLightGreen],
//     ),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//     child:
//       Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         ListView.builder(
//           itemCount: 7,
//           // itemExtent: 7,
//           itemBuilder: (BuildContext context, int index) {
//             return
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child: SizedBox(
//                   height: 48,
//                   width: 48,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           AppColors.foregroundLightGreen),
//                       foregroundColor: MaterialStateProperty.all(
//                           AppColors.mainGreenDark),
//                       textStyle: MaterialStateProperty.all(
//                         const TextStyle(fontSize: 12,
//                           fontWeight: FontWeight.w600,),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text('Пн',
//                       textAlign: TextAlign.center,),
//                   ),
//                 ),
//               );
//           }
//         ),
// Padding(
//   padding: const EdgeInsets.fromLTRB(0, 0, 8, 16),
//   child:
// Container(
//     color: Colors.transparent,
//     // child:
//     // DecoratedBox(
//       // decoration: BoxDecoration(
//       //   color: Colors.white,
//       //   border: Border.all(color: Colors.black.withOpacity(0.2)),
//       //   borderRadius: const BorderRadius.all(Radius.circular(5)),
//       //   boxShadow:[
//       //     BoxShadow(
//       //       color: Colors.black.withOpacity(0.1),
//       //       blurRadius: 8,
//       //       offset: const Offset(0,4),
//       //     ),],),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(5)),
//         child: Row(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   // width: 300,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       SizedBox(height: 20),
//                       Text('Завтрак',
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
//                       ),
//                       // SizedBox(height: 5),
//                       SizedBox(height: 20),
//                       SizedBox(
//                         // width: 200,
//                         child: Text('КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // const SizedBox(width: 8),
//               const Image(
//                 image: AssetImage(AppImages.kotletiKlassicheskie2480300x233/*recipe.imgFirstName*/),
//                 height: 96,
//                 width: 96,
//               ),
//             ],
//         ),
//       ),
//   // ),
//     // ListView.builder(
//     //   padding: const EdgeInsets.only(top: 70),
//     //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//     //   itemCount: 3,
//     //   itemExtent: 163,
//     //   itemBuilder: (BuildContext context, int index) {
//     //     // final recipe = _filteredRecipes[index];
//     //     return Padding(
//     //       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//     //       child: Stack(
//     //         children: [DecoratedBox(
//     //           decoration: BoxDecoration(
//     //             color: Colors.white,
//     //             border: Border.all(color: Colors.black.withOpacity(0.2)),
//     //             borderRadius: const BorderRadius.all(Radius.circular(10)),
//     //             boxShadow:[
//     //               BoxShadow(
//     //                 color: Colors.black.withOpacity(0.1),
//     //                 blurRadius: 8,
//     //                 offset: const Offset(0,4),
//     //               ),],
//     //           ),
//     //           child: ClipRRect(
//     //             borderRadius: const BorderRadius.all(Radius.circular(10)),
//     //             child: Row(
//     //               // color: Colors.green,
//     //                 children: [
//     //                   Image(image: AssetImage(AppImages.kotletiKlassicheskie2480300x233/*recipe.imgFirstName*/)),
//     //                   const SizedBox(width: 15),
//     //                   Expanded(
//     //                     child: Column(
//     //                       crossAxisAlignment: CrossAxisAlignment.start,
//     //                       children: [
//     //                         const SizedBox(height: 20),
//     //                         Text('Завтрак',
//     //                           maxLines: 2,
//     //                           overflow: TextOverflow.ellipsis,
//     //                           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
//     //                         ),
//     //                         const SizedBox(height: 5),
//     //                         // Text(recipe.time,
//     //                         //   maxLines: 1,
//     //                         //   overflow: TextOverflow.ellipsis,
//     //                         //   style: const TextStyle(color: Colors.grey,),
//     //                         // ),
//     //                         const SizedBox(height: 20),
//     //                         Text('fhghdgsfhsjdjhcuifhsd gfiguiie',
//     //                           maxLines: 2,
//     //                           overflow: TextOverflow.ellipsis,
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                   const SizedBox(width: 10),
//     //                 ]
//     //             ),
//     //           ),
//     //         ),
//     //           Material(
//     //             color: Colors.transparent,
//     //             child: InkWell(
//     //               borderRadius: BorderRadius.circular(10),
//     //               onTap: () {
//     //                 print('Click');
//     //                 // print(recipe.id.toString());
//     //                 // Navigator.push(context, MaterialPageRoute(
//     //                 //     builder: (context) => RecipeDetailPage(recipe.id)
//     //                 // ));
//     //               },
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     );
//     //   },
//     // ),
//   ),
// SizedBox(width: 16, )
// // ),
//
//
//
//
// // ListView.builder(
// //   itemCount: Day.week.length,
// //   itemBuilder: (BuildContext context, int index) {
// //     return GestureDetector(
// //       onTap: () {
// //         dayListState[index] =  (dayListState[index] == 0) ? 1 : 0;
// //         print(index);
// //         setState(() {
// //         });
// //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
// //         //   return Text('Detail page');
// //         // },),
// //         // );
// //       },
// //       child: Column(
// //         // crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           buildDayCard(Day.week[index]),
// //           dayListState [index] == 1 ? Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //               Row(
// //                 children: const [
// //                   Text("Завтрак: "),
// //                   Text("Какая-то вкусняшка)"),
// //                 ],
// //               ),
// //               Row(
// //                 children: const [
// //                   Text("Обед: "),
// //                 ],
// //               ),
// //               Row(
// //                 children: const [
// //                   Text("Ужин: "),
// //                 ],
// //               )]),
// //           ) :
// //           Container(color: Colors.red),
// //         ],
// //       ),
// //     );
// //   },
// // ),
// ],
// ),
// ),
// );
// }
// }
// Widget buildDayCard(Day day) {
//   return Card(
//     elevation: 8.0,
//     color: AppColors.mainLightBlue,
//     shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0)
//         )
//     ),
//     child: Padding( padding: const EdgeInsets.all(10.0),
//       child: Column( children: [ /*Text(day.id.toString()),
//           const SizedBox( height: 14.0, ),*/
//         Text( day.label,
//           style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.w700,
//             fontFamily: 'Palatino', ),
//         ),
//         ], ),
//     ),
//   );
// }
}