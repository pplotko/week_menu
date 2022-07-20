import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:week_menu/Theme/app_colors.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  var titel;
  bool isBackPath;
  var path;
  // final double height;

  MyCustomAppBar({
    Key? key, this.titel, required this.isBackPath, required this.path,
    // this.height,
    // required this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    print('isBackPath = $isBackPath');
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[AppColors.mainGreenDark, AppColors.mainGreenDark,],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppbarLeftSidePlaceholder(isBackPath: isBackPath, path: path,),
                AppbarCenterPlaceholder(titel),
                AppbarRightSidePlaceholder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppbarLeftSidePlaceholder extends StatelessWidget {
  bool isBackPath;
  var path;

  AppbarLeftSidePlaceholder( {Key? key, required this.isBackPath, required this.path,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = context.read<Model>();
    // final _value = context.watch<Model>().isMenuPressed;
    // print('value = $_value');
    Color menuColor;

    // _value ? menuColor = const Color(0xFFE91E63) : menuColor = const Color(0xFF452518);

    if (isBackPath) {
      return GestureDetector(
        child:
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Container(
                // padding: const EdgeInsets.only(left: 10, top: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  color: AppColors.mainGreenDark,
                ),
                child:
                  const Icon(
                    Icons.arrow_back,
                    color: AppColors.selectedColor,
                  ),
              ),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Icon(Icons.coffee,
          //       color: Colors.green,
          //       // menuColor,
          //       size: 40,
          //     ),
          //     Text('Menu',
          //       style: TextStyle(
          //         // color: menuColor,
          //       ),
          //     ),
          // ],
          // ),
        // leading: Builder(
        //     builder: (BuildContext context) {
        //       return IconButton(
        //         icon: const Icon(Icons.arrow_back),
        //         onPressed: () {
        //           // Navigator.of(context).maybePop();
        //           final navigator = Navigator.of(context);
        //           navigator.pushReplacementNamed('/main');
        //         },
        //         // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //       );
        //     }),
        onTap: () {
          // Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(path);
        },
        // model.menuPressed,
      );
    } else {
      return GestureDetector(
        child:
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Container(
              // padding: const EdgeInsets.only(left: 10, top: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20),),
                color: AppColors.selectedColor,
              ),
              child:
              const Icon(
                Icons.arrow_back,
                color: AppColors.selectedColor,
              ),
            ),
          ),
        ),
        onTap: () {},
        // model.menuPressed,
      );
    }
  }
}

class AppbarRightSidePlaceholder extends StatelessWidget {
  const AppbarRightSidePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = context.read<Model>();
    // final _value = context.watch<Model>().isAddressPressed;
    // print('value = $_value');
    // Color menuColor;
    //
    // _value ? menuColor = const Color(0xFFE91E63) : menuColor = const Color(0xFF452518);

    return GestureDetector(
      child:
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 40,
          width: 40,
          child: Container(
            // padding: const EdgeInsets.only(left: 10, top: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20),),
              color: AppColors.selectedColor,
            ),
            child: Text('ДП',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainGreenMoreDark),
              /*textAlign: TextAlign.center,*/),
            alignment: Alignment.center,
          ),
        ),
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Icon(Icons.location_on,
      //       // color: menuColor,
      //       size: 40,
      //     ),
      //     Text('Address',
      //       style: TextStyle(
      //         // color: menuColor,
      //       ),
      //     ),
      //   ],
      // ),
      onTap: (){},
      // model.addressPressed,
    );
  }
}

class AppbarCenterPlaceholder extends StatelessWidget {
  AppbarCenterPlaceholder(String this.titel, {super.key});
  var titel;
  @override
  Widget build(BuildContext context) {
    // final model = context.read<Model>();
    // final _value = context.watch<Model>().isCenterPlaceholderPressed;
    // Color shadowColor;
    //
    // _value ? shadowColor = const Color(0xFFE91E63) : shadowColor = const Color(0xFFf9e3ce);
    titel == null ? titel = ' ': titel = titel;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text("menu planer",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.foregroundLightGreen),
              /*textAlign: TextAlign.center,*/),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Text(titel,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foregroundLightGreen),
              /*textAlign: TextAlign.center,*/),
          ],
        ),
      ),
        // Container(
        // // height: 60,
        // width: 180,
        // decoration: BoxDecoration(
        //   // border: Border.all(width: 2.5, color: Colors.green),
        //   borderRadius: const BorderRadius.all(Radius.circular(8)),
        //   boxShadow: [
        //     BoxShadow(
        //       // color: shadowColor,
        //       offset: const Offset(0, 0),
        //       blurRadius: 16,
        //       spreadRadius: 1,
        //     ),
        //   ],
        // ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(16.0),
        //     child: Image.asset("assets/picters/like_bear.png")),
      // ),
      onTap: () {
        // model.centerPlaceholderPressed();
        },
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _value = context.watch<Model>().isCenterPlaceholderPressed;
    final _value = true;
    String imgLink;
    if (_value) {
      imgLink = 'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p.jpg';
      return Image.network(imgLink);
    }
    else {
      return Container();
    }
  }
}