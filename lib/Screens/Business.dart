import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/AppCubit.dart';
import 'package:newsapplication/AppStates.dart';
import 'package:newsapplication/Reusable.dart';

class Bussiness extends StatefulWidget {
  const Bussiness({Key? key}) : super(key: key);

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Bussiness> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppcCubit _appcCubit = AppcCubit();

          _appcCubit = BlocProvider.of<AppcCubit>(context);

          var List = _appcCubit.BusinessNews;
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
