abstract class TouristState {}

class TouristInitial extends TouristState {}

class TouristLoading extends TouristState {}

class TouristSuccess extends TouristState {}

class TouristFailure extends TouristState {
  final String error;

  TouristFailure({required this.error});
}

class TouristLoaded extends TouristState {
  final Map<String, dynamic> touristData;

  TouristLoaded({required this.touristData});
}
