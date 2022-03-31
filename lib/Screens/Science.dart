import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/Reusable.dart';

import '../AppCubit.dart';
import '../AppStates.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppcCubit _appcCubit = AppcCubit();

          _appcCubit = BlocProvider.of<AppcCubit>(context);

          var List = _appcCubit.ScienceNews;
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
