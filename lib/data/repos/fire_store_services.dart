import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guru/data/models/tour_guide/TourGuideModel.dart';

class FireStoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'tour_guides'; // Name of the Firestore collection

  Future<bool> tourGuideExists(String phoneNumber) async {
    final querySnapshot = await _firestore
        .collection(_collectionName)
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
  Future<void> addTourGuide(TourGuideRequestBody tourGuide) async {
    try {
      await _firestore.collection(_collectionName).doc('tourGuideId').set(tourGuide.toJson());
    } catch (e) {
      throw Exception('Failed to add tour guide: $e');
    }
  }

  Future<List<TourGuideRequestBody>> getTourGuides(String city) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(_collectionName).where('selectedCity', isEqualTo: city).get();
      return querySnapshot.docs.map((doc) => TourGuideRequestBody.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to get tour guides: $e');
    }
  }


// Add more methods for updating, deleting, and fetching tour guides as needed
}
