import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc_screen.dart';
import 'package:news_app/bloc/states_screen.dart';
import '../../shared/constant/styles.dart';


import '../../shared/component/component.dart';
import '../../shared/constant/constant.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
   width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<NewsBloc, NewsStates>(builder: (context, state)
    {

      var businessList=NewsBloc.get(context).buiseness;
      return buildPageContent(businessList) ;
    }, listener: (context, index) {});
  }


}
