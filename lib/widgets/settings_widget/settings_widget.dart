import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();

}
class _SettingsWidgetState extends State<SettingsWidget> {
  String? selectedValue = "Monday"; //null;
  var colorOfBox = Colors.blue;

  @override
  void initState() {
  super.initState();
  }

  // String? selectedValue = " ";
  List<String> items = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  // List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  // ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  "Choose a day", //'Select Item',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme
                        .of(context)
                        .hintColor,
                  ),
                ),
                items: items
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  if (value.toString()=="Sunday" || value.toString()=="Saturday") {Text("Выходной"); print("Holiday");colorOfBox = Colors.red;}
                  else colorOfBox = Colors.blue;
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 140,
                itemHeight: 40,
                itemWidth: 140,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(10.0),
            color: colorOfBox,
            // width: 248.0,
            height: 248.0,
            alignment: Alignment.center,
            child: Text('$selectedValue',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white)),
            // transform: Matrix4.rotationZ(0.1),
          ),
        ],
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('selectedValue', selectedValue));
  }
}