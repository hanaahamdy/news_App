import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states_screen.dart';
import 'package:news_app/screens/screens/buisness.dart';
import 'package:news_app/screens/screens/science.dart';
import 'package:news_app/screens/screens/settings.dart';
import 'package:news_app/screens/screens/sport.dart';
import 'package:news_app/shared/network/remote/local/local_network.dart';

import '../shared/network/remote/api_helper.dart';

class NewsBloc extends Cubit<NewsStates> {
  NewsBloc() : super(InitialState());

  static NewsBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int currentIndex = 0;

  void navigationChange(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      getBusinessData();
    }

    if (currentIndex == 1) {
      getSportsData();
    }
    if (currentIndex == 2) {
      getScienceData();
    }
    emit(BottomNavigationState());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];
  List<dynamic> buiseness = [];

  void getBusinessData() {
    emit(GetBusinessLoadingState());
    ApiHelper.get(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "b8a4c92ee2094cfbb04ff57252f3acb2"
    }).then((value) {
      emit(GetBusinessSuccessState());
      buiseness = value.data['articles'];
      print(buiseness);
    }).catchError((onError) {
      emit(GetBusinessErrorState());
    });
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(GetSportsLoadingState());
    ApiHelper.get(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sports",
      "apiKey": "b8a4c92ee2094cfbb04ff57252f3acb2"
    }).then((value) {
      emit(GetSportsSuccessState());
      sports = value.data['articles'];
      print(buiseness);
    }).catchError((onError) {
      emit(GetSportsErrorState());
    });
  }

  List<dynamic> science = [];

  void getScienceData() async {
    emit(GetScienceLoadingState());
    await ApiHelper.get(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "b8a4c92ee2094cfbb04ff57252f3acb2"
    }).then((value) {
      emit(GetSportsSuccessState());
      science = value.data['articles'];
      print(buiseness);
    }).catchError((onError) {
      print(onError);
      emit(GetScienceErrorState());
    });
  }

  List<dynamic> search = [];

  void getSearchData({var value}) async {
    emit(GetSearchDataLoadingState());
    await ApiHelper.get(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "b8a4c92ee2094cfbb04ff57252f3acb2"
    }).then((value) {
      emit(GetSearchDataSuccessState());
      search = value.data['articles'];
      print(search);
    }).catchError((onError) {
      emit(GetSearchDataErrorState());
    });
  }





  bool isDark = false;
  void dark({bool? mode}) {
    if (mode != null)
    {
      isDark = mode;
      emit(ChangeLightness());
    }
    else
      {
      isDark = !isDark;
      CachHelper.setData(key: 'isDark', value: isDark)
          .then((value) => emit(ChangeLightness()));
    }
  }


}
