import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingLoading extends RatingState {}

class RatingSuccess extends RatingState {}

class RatingError extends RatingState {
  final String message;

  RatingError(this.message);
}

class TourGuideRatingCubit extends Cubit<RatingState> {
  TourGuideRatingCubit() : super(RatingInitial());

  Future<void> ratingCalculation(String tourGuideId, String touristId, double rating) async {
    emit(RatingLoading());
    DocumentReference tourGuideReference =
    FirebaseFirestore.instance.collection('tour_guides').doc(tourGuideId);

    try {
      // Add/update tourist's rating in the sub-collection
      DocumentReference ratingReference = tourGuideReference
          .collection('ratings')
          .doc(touristId);

      await ratingReference.set({'rating': rating}, SetOptions(merge: true));

      // Recalculate the average rating
      QuerySnapshot ratingsSnapshot = await tourGuideReference.collection('ratings').get();
      double totalRating = 0;
      int ratingsCount = ratingsSnapshot.docs.length;

      for (var doc in ratingsSnapshot.docs) {
        totalRating += doc['rating'];
      }

      double averageRating = totalRating / ratingsCount;

      // Update the tour guide's average rating
      await tourGuideReference.update({'rating': averageRating.toStringAsFixed(2)});

      emit(RatingSuccess());
    } catch (e) {
      emit(RatingError(e.toString()));
    }
  }
}
