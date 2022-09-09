import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc_screen.dart';
import 'package:news_app/bloc/states_screen.dart';
import 'package:news_app/screens/screens/search.dart';
import '../shared/network/remote/api_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsBloc cubit = BlocProvider.of<NewsBloc>(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    }),
              ),
              IconButton(
                  onPressed: () {
                    cubit.dark();
                  },
                  icon: Icon(Icons.brightness_6_outlined))
            ],
            title: Text("News"),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.navigationChange(index);
            },
            items: cubit.items,
          ),
        );
      },
    );
  }
}
