import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/logic/tourist/add_tourist_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guru/data/models/tourist/TouristModel.dart';
import 'package:guru/data/repos/fire_store_services_for_tourist.dart';

class AddTouristCubit extends Cubit<TouristState> {
  final FireStoreServicesForTourist _fireStoreServices;
  final SharedPreferences _prefs;

  AddTouristCubit(this._fireStoreServices, this._prefs) : super(TouristInitial());

  TextEditingController touristNameController = TextEditingController();
  TextEditingController touristPhoneNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController touristEmailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addTourist() async {
    emit(TouristLoading());
    try {
      bool exists = await _fireStoreServices.touristExists(touristPhoneNumberController.text);
      if (exists) {
        emit(TouristFailure(error: 'Tourist with this phone number already exists'));
        return;
      }

      await _fireStoreServices.addTourist(TourisModel(
        email: touristEmailController.text,
        whatsAppNumber: whatsAppNumberController.text,
        name: touristNameController.text,
        phoneNumber: touristPhoneNumberController.text,
      ));

      await _saveToSharedPreferences(
        name: touristNameController.text,
        phoneNumber: touristPhoneNumberController.text,
        email: touristEmailController.text,
        whatsAppNumber: whatsAppNumberController.text,
      );

      emit(TouristSuccess());
    } catch (e) {
      emit(TouristFailure(error: e.toString()));
    }
  }

  Future<void> _saveToSharedPreferences({
    required String name,
    required String phoneNumber,
    required String email,
    required String whatsAppNumber,
  }) async {
    await _prefs.setString('name', name);
    await _prefs.setString('phoneNumber', phoneNumber);
    await _prefs.setString('email', email);
    await _prefs.setString('whatsAppNumber', whatsAppNumber);
  }

  Future<void> loadTouristFromSharedPreferences() async {
    final name = _prefs.getString('name') ?? '';
    final phoneNumber = _prefs.getString('phoneNumber') ?? '';
    final email = _prefs.getString('email') ?? '';
    final whatsAppNumber = _prefs.getString('whatsAppNumber') ?? '';

    final touristData = {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'whatsAppNumber': whatsAppNumber,
    };

    emit(TouristLoaded(touristData: touristData));
  }
}
