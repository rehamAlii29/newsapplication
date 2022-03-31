import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/AppCubit.dart';
import 'package:newsapplication/AppStates.dart';
import 'package:newsapplication/CacheHelper.dart';
import 'package:newsapplication/DioHelper.dart';
import 'package:newsapplication/Home.dart';
import 'package:material_color_gen/material_color_gen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getbool(key: 'isDark');
  runApp(News(isDark));
}

var primaryswatch = HexColor("#b83b8e").toMaterialColor();

class News extends StatelessWidget {
  // const News({Key? key}) : super(key: key);
  final bool? isDark;
  const News(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppcCubit()
        ..changeMode(fromCache: isDark)
        ..getBussinessNews()
        ..getScienceNews()
        ..getSportNews()
        ..homeNews()
        ..getHealthNews()
        ..getSearchResult(""),
      child: BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppcCubit appcCubit = AppcCubit();
          appcCubit = BlocProvider.of<AppcCubit>(context);

          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: HexColor("#b83b8e"),
                  primarySwatch: primaryswatch,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      iconTheme: const IconThemeData(
                        color: Colors.black,
                      ),
                      actionsIconTheme:
                          IconThemeData(color: HexColor("#b83b8e")),
                      elevation: 0,
                      centerTitle: true,
                      titleTextStyle: TextStyle(
                        color: HexColor("#b83b8e"),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      backgroundColor: Colors.white,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.dark,
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white,
                      )),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    headline4: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.black,
                    backgroundColor: HexColor('#FFFFFF'),
                  )),
              darkTheme: ThemeData(
                  primarySwatch: primaryswatch,
                  scaffoldBackgroundColor: HexColor('#B2B2B2'),
                  appBarTheme: AppBarTheme(
                      actionsIconTheme:
                          IconThemeData(color: HexColor("b83b8e")),
                      titleTextStyle: TextStyle(
                        color: HexColor("#b83b8e"),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      elevation: 0,
                      backgroundColor: HexColor('#B2B2B2'),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.light,
                        statusBarBrightness: Brightness.light,
                        statusBarColor: HexColor('#DDDDDD'),
                      )),
                  textTheme: const TextTheme(
                      headline4: TextStyle(color: Colors.white, fontSize: 15),
                      bodyText1: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  backgroundColor: HexColor('#B2B2B2'),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.white,
                    selectedItemColor: Colors.orange,
                    backgroundColor: HexColor('#DDDDDD'),
                  )),
              themeMode: appcCubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const Home());
        },
      ),
    );
  }
}
