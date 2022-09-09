import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc_screen.dart';
import 'package:news_app/bloc/states_screen.dart';

import '../../shared/component/component.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsStates>(
        builder: (context, state) {
          List search=NewsBloc.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body:
             ListView(
              children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container
                (height: 50,
                child: TextFormField(
                  onSaved: (val){NewsBloc.get(context).getSearchData(value: val);},
                  onChanged: (vlue){
                  NewsBloc.get(context).getSearchData(value: vlue);
                },
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      label: Text(
                        "search",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      prefix: Icon(Icons.search)),
                ),
              )
            ),
            buildPageContent(search )
              ],
            ),

          );
        },
        listener: (context, state) {});
  }
}
