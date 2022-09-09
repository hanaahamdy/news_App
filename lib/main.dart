import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/bloc/bloc_screen.dart';
import 'package:news_app/bloc/states_screen.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/remote/local/local_network.dart';
import 'shared/network/remote/api_helper.dart';

import 'modules/homeLayout.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiHelper.init();
  await CachHelper.initShared();
  bool? isDark=CachHelper.getData(key: 'isDark');
  runApp( MyApp(dark: isDark));
}

class MyApp extends StatelessWidget {

final bool? dark;

 MyApp({required this.dark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..dark(mode:dark)
//        ..getBusinessData()
//        ..getSportsData(),
      ,child:BlocConsumer<NewsBloc,NewsStates>(builder:(context,state){return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                backwardsCompatibility: false,
                systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.white),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 25)),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange),
            primarySwatch: Colors.deepOrange,
          ),
          darkTheme: ThemeData(textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white,fontSize: 19)),
            primarySwatch: Colors.deepOrange,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739')),
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme: AppBarTheme(
              systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: HexColor('333739')),
              backgroundColor: HexColor('333739'),
              backwardsCompatibility: false,
            ),
          ),
          themeMode: NewsBloc.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: Directionality(
              textDirection: TextDirection.ltr, child: HomePage()));} ,listener:(context, state) => {}) ,);

  }
}
