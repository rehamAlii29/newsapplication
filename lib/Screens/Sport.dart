import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/Reusable.dart';

import '../AppCubit.dart';
import '../AppStates.dart';

class Sport extends StatefulWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppcCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppcCubit _appcCubit = AppcCubit();

          _appcCubit = BlocProvider.of<AppcCubit>(context);

          var List = _appcCubit.SportNews;
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
