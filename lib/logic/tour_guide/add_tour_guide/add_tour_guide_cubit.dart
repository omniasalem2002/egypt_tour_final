import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:guru/data/models/tour_guide/AddTourGuideResponse.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/data/models/tour_guide/TourGuideModel.dart';
import 'package:guru/data/repos/fire_store_services.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_state.dart';

class TourGuideCubit extends Cubit<TourGuideState> {
  final FireStoreServices _fireStoreService;

  TourGuideCubit(this._fireStoreService) :super(TourGuideInitial());

  TextEditingController tourGuideNameController = TextEditingController();
  TextEditingController tourGuidePhoneNumberController = TextEditingController();
  File? image ;
  TextEditingController workExperiencesController = TextEditingController();

  TextEditingController selectedCityController = TextEditingController();



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void addTourGuide() async {
    emit(TourGuideLoading());

   try{
     String? imageurl =await _uploadImage(image);
     // Check if the tour guide already exists
     bool exists = await _fireStoreService.tourGuideExists(tourGuidePhoneNumberController.text);
     if (exists) {
       emit(TourGuideFailure(error: 'Tour guide with this phone number already exists'));
       return;
     }

     final response = await _fireStoreService.addTourGuide(TourGuideRequestBody(name:
     tourGuideNameController.text,
         phoneNumber: tourGuidePhoneNumberController.text,
         image: imageurl!,
         selectedCity: selectedCityController.text,
         workExperiences: workExperiencesController.text),
     );
     emit(TourGuideSuccess());
         }
      catch(e) {
        emit(TourGuideFailure(error: e.toString()));
      }}
  void getTourGuides(String city) async {
    emit(TourGuideLoading());

    try {
      final List<TourGuideRequestBody> tourGuides = await _fireStoreService.getTourGuides(city);
      emit(GetTourGuideSuccess(tourGuides: tourGuides));
    } catch (e) {
      emit(TourGuideFailure(error: e.toString()));
    }
  }


  Future<String?> _uploadImage(File? image) async {
    if (image == null) {
      print('No image selected.');
      return null;
    }

    String fileName = path.basename(image.path);
    Reference storageReference =
    FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = storageReference.putFile(image);

    try {
      await uploadTask;
      print('Image uploaded to Firebase Storage');

      // Return the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Upload failed: $e');
      return null;
    }
  }


}
