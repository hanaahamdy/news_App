import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc_screen.dart';
import '../../bloc/states_screen.dart';
import '../../shared/component/component.dart';
import '../../shared/constant/constant.dart';
class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsBloc, NewsStates>(
        builder: (context, state) {
          List science=NewsBloc.get(context).science;
          return buildPageContent(science);
        },
        listener: (context, state) => {});
  }
}