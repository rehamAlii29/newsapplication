import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/AppCubit.dart';
import 'package:newsapplication/AppStates.dart';
import 'package:newsapplication/Reusable.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var List = AppcCubit.get(context).health;
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
