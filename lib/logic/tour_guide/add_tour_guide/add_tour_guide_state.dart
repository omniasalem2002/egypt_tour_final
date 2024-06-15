

import 'package:guru/data/models/tour_guide/TourGuideModel.dart';

abstract class TourGuideState {}

class TourGuideInitial extends TourGuideState {}

class TourGuideLoading extends TourGuideState {}

class TourGuideSuccess extends TourGuideState {

}
class GetTourGuideSuccess extends TourGuideState {
  final List<TourGuideRequestBody> tourGuides;
  GetTourGuideSuccess({required this.tourGuides});

}

class TourGuideFailure extends TourGuideState {
  final String error;

  TourGuideFailure({required this.error});
}