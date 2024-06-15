import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guru/data/models/tourist/TouristModel.dart';

class FireStoreServicesForTourist {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'tourist'; // Name of the Firestore collection

   Future<bool> touristExists(String phoneNumber) async {
    final querySnapshot = await _firestore
        .collection(_collectionName)
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
  Future<void> addTourist(TourisModel tourist) async {
    try {
      await _firestore.collection(_collectionName).add(tourist.toJson());
    } catch (e) {
      throw Exception('Failed to add tourist: $e');
    }
  }

/* Future<List<TourGuideRequestBody>> getTourGuides(String city) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(_collectionName).where('selectedCity', isEqualTo: city).get();
      return querySnapshot.docs.map((doc) => TourGuideRequestBody.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to get tour guides: $e');
    }
  }*/


// Add more methods for updating, deleting, and fetching tour guides as needed
}
