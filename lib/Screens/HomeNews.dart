import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/AppCubit.dart';
import 'package:newsapplication/AppStates.dart';
import 'package:newsapplication/Reusable.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var List = AppcCubit.get(context).home;
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BuildOneItem(List[index], context);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: MediaQuery.of(context).size.width * .1,
                  indent: MediaQuery.of(context).size.width * .1,
                  thickness: .7,
                  color: HexColor("#b83b8e"),
                );
              },
              itemCount: List.length);
        });
  }
}
