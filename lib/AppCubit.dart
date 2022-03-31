import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapplication/AppStates.dart';
import 'package:newsapplication/Screens/Business.dart';
import 'package:newsapplication/CacheHelper.dart';
import 'package:newsapplication/DioHelper.dart';
import 'package:newsapplication/Screens/Health.dart';
import 'package:newsapplication/Screens/HomeNews.dart';

import 'package:newsapplication/Screens/Science.dart';
import 'package:newsapplication/Screens/Sport.dart';

import 'Screens/Business.dart';

class AppcCubit extends Cubit<AppStates> {
  AppcCubit() : super(IntialState());
  static AppcCubit get(context) => BlocProvider.of<AppcCubit>(context);

  List<Widget> Screens = [
    const Bussiness(),
    const Science(),
    const HomeNews(),
    const Sport(),
    const Health()
  ];
  List<Widget> bottombaritems = [
    const Icon(Icons.business, size: 30),
    const Icon(Icons.science, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.sports, size: 30),
    const Icon(Icons.fastfood, size: 30),
  ];
  List<String> titles = ["Business", "Science", "Home", "Sports", "Health"];
  int CurrentIndex = 2;

  bottomNavigationBarchange(int index) {
    CurrentIndex = index;
    if (index == 0) {
      getBussinessNews();
    }
    if (index == 1) {
      getScienceNews();
    }
    if (index == 2) {
      homeNews();
    }
    if (index == 3) {
      getSportNews();
    }
    if (index == 4) {
      getHealthNews();
    }

    emit(BottomnavigationBarChange());
  }

// goz2 el dio
  List<dynamic> home = [];
  List<dynamic> BusinessNews = [];
  List<dynamic> ScienceNews = [];
  List<dynamic> SportNews = [];
  List<dynamic> health = [];
  //
  homeNews() {
    emit(HomeNewsloading());
    if (home.isEmpty) {
      DioHelper.getdata(url: "v2/top-headlines/", query: {
        "country": "eg",
        "apiKey": "08e3c6795b4344dcb1aa24958e9ebc98"
      }).then((value) {
        home = value.data["articles"];
        emit(HomeNewsSuccess());
      }).catchError((onError) {
        emit(HomeNewserror(onError.toString()));
      });
    } else {
      emit(HomeNewsSuccess());
    }
  }

  getBussinessNews() {
    emit(GetbussinessLoading());
    if (BusinessNews.isEmpty) {
      DioHelper.getdata(url: "v2/top-headlines/", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "08e3c6795b4344dcb1aa24958e9ebc98"
      }).then((value) {
        BusinessNews = value.data["articles"];
        emit(GetsBusinesssucess());
      }).catchError((onError) {
        emit(GetBusinesserror(onError.toString()));
      });
    } else {
      emit(GetsBusinesssucess());
    }
  }

  getScienceNews() {
    emit(GetScienceLoading());
    if (ScienceNews.isEmpty) {
      DioHelper.getdata(url: "v2/top-headlines/", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "08e3c6795b4344dcb1aa24958e9ebc98"
      }).then((value) {
        ScienceNews = value.data["articles"];
        emit(GetSciencesucess());
      }).catchError((onError) {
        emit(GetScienceerror(onError.toString()));
      });
    } else {
      emit(getScienceNews());
    }
  }

  getSportNews() {
    emit(GetSportLoading());
    if (SportNews.isEmpty) {
      DioHelper.getdata(url: 'v2/top-headlines/', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '08e3c6795b4344dcb1aa24958e9ebc98'
      }).then((value) {
        SportNews = value.data['articles'];
        emit(GetSportsucess());
      }).catchError((onError) {
        emit(GetSporterror(onError.toString()));
      });
    } else {
      emit(GetSportsucess());
    }
  }

// toggle light dark & light

  bool isDark = false;
  changeMode({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
      emit(ChangeMood());
    } else {
      isDark = !isDark;
      CacheHelper.setbool(key: 'isDark', value: isDark).then((value) {
        emit(ChangeMood());
      });
    }
  }

// goz2 el search
  List<dynamic> serachResult = [];
  getSearchResult(String? value) {
    DioHelper.getdata(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "08e3c6795b4344dcb1aa24958e9ebc98"
    }).then((value) {
      serachResult = value.data['articles'];
      emit(GetSearchSuccess());
    }).catchError((onError) {
      emit(GetSearchFailed(onError.toString()));
    });
  }

  getHealthNews() {
    emit(HealthNewsloading());
    if (ScienceNews.isEmpty) {
      DioHelper.getdata(url: "v2/top-headlines/", query: {
        "country": "eg",
        "category": "health",
        "apiKey": "08e3c6795b4344dcb1aa24958e9ebc98"
      }).then((value) {
        health = value.data["articles"];
        emit(HealthNewsSuccess());
      }).catchError((onError) {
        emit(HealthNewserror(onError.toString()));
      });
    } else {
      emit(HealthNewsSuccess());
    }
  }

//  search
  bool issearch = false;
  showsearchbox() {
    issearch = !issearch;
    emit(showsearchbar());
  }
}
