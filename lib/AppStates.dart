abstract class AppStates {}

class IntialState extends AppStates {}

class BottomnavigationBarChange extends AppStates {}

class GetSciencesucess extends AppStates {}

class GetScienceerror extends AppStates {
  final String? Error;
  GetScienceerror(this.Error);
}

class GetSportsucess extends AppStates {}

class GetSporterror extends AppStates {
  final String? Error;
  GetSporterror(this.Error);
}

class GetsBusinesssucess extends AppStates {}

class GetBusinesserror extends AppStates {
  final String? Error;
  GetBusinesserror(this.Error);
}

class HomeNewsloading extends AppStates {}

class HomeNewsSuccess extends AppStates {}

class HomeNewserror extends AppStates {
  final String? error;
  HomeNewserror(this.error);
}

class GetbussinessLoading extends AppStates {}

class GetSportLoading extends AppStates {}

class GetScienceLoading extends AppStates {}

class ChangeMood extends AppStates {}

class SearchLoading extends AppStates {}

class GetSearchSuccess extends AppStates {}

class GetSearchFailed extends AppStates {
  final String? Error;
  GetSearchFailed(this.Error);
}

class HealthNewsloading extends AppStates {}

class HealthNewsSuccess extends AppStates {}

class HealthNewserror extends AppStates {
  final String? error;
  HealthNewserror(this.error);
}

class showsearchbar extends AppStates {}

//class ShowResultpup extends AppStates {}
