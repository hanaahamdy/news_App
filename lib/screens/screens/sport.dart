import 'package:buildcondition/buildcondition.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc_screen.dart';
import '../../bloc/states_screen.dart';

import '../../shared/component/component.dart';
import '../../shared/constant/constant.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var list = NewsBloc.get(context).sports;
    return BlocConsumer<NewsBloc, NewsStates>(
        builder: (context, state) {
          return
            buildPageContent(list);
        },
        listener: (context, state) => {});
  }


}
