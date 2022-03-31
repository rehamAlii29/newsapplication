import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/AppCubit.dart';
import 'package:newsapplication/AppStates.dart';
import 'package:newsapplication/Reusable.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

var searchController = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppcCubit? _appCubit = AppcCubit.get(context);
          Widget appbartitles = Text(_appCubit.titles[_appCubit.CurrentIndex]);
          List bodysearch = _appCubit.serachResult;
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: !_appCubit.issearch
                    ? appbartitles
                    : appbartitles = TextFormField(
                        controller: searchController,
                        decoration:
                            const InputDecoration(hintText: "search here"),
                        onChanged: (value) {
                          _appCubit.getSearchResult(value);
                        },
                      ),
                actions: [
                  IconButton(
                    icon: !_appCubit.issearch
                        ? const Icon(Icons.search)
                        : const Icon(Icons.close),
                    onPressed: () {
                      AppcCubit.get(context).serachResult.clear();
                      searchController.clear();
                      _appCubit.showsearchbox();
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      _appCubit.changeMode();
                    },
                    icon: _appCubit.isDark
                        ? Icon(
                            Icons.brightness_6_outlined,
                            color: HexColor("#edcd00"),
                          )
                        : const Icon(
                            Icons.brightness_3,
                            color: Colors.black,
                          ),
                  )
                ],
              ),
              body: bodysearch.isEmpty
                  ? _appCubit.Screens[_appCubit.CurrentIndex]
                  : ListView.builder(itemBuilder: (context, index) {
                      return BuildOneItem(
                          _appCubit.serachResult[index], context);
                    }),
              bottomNavigationBar: CurvedNavigationBar(
                  index: _appCubit.CurrentIndex,
                  items: _appCubit.bottombaritems,
                  color: HexColor("#b83b8e"),
                  buttonBackgroundColor: Colors.white,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  animationCurve: Curves.easeInOut,
                  animationDuration: const Duration(milliseconds: 600),
                  onTap: (index) {
                    _appCubit.bottomNavigationBarchange(index);
                  }));
        });
  }
}
