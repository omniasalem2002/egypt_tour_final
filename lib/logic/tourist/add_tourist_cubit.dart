import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/logic/tourist/add_tourist_state.dart';
import 'package:guru/data/models/tourist/TouristModel.dart';
import 'package:guru/data/repos/fire_store_services_for_tourist.dart';

class AddTouristCubit extends Cubit<TouristState> {
  final FireStoreServicesForTourist _fireStoreServices;

  AddTouristCubit(this._fireStoreServices) : super(TouristInitial());

  TextEditingController touristNameController = TextEditingController();
  TextEditingController touristPhoneNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController touristEmailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addTourist() async {
    if (!formKey.currentState!.validate()) {
      emit(TouristFailure(error: 'Form validation failed'));
      return;
    }

    emit(TouristLoading());

    try {
      await _fireStoreServices.addTourist(TourisModel(
        email: touristEmailController.text,
        whatsAppNumber: whatsAppNumberController.text,
        name: touristNameController.text,
        phoneNumber: touristPhoneNumberController.text,
      ));

      emit(TouristSuccess());
    } catch (e) {
      emit(TouristFailure(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    touristNameController.dispose();
    touristPhoneNumberController.dispose();
    whatsAppNumberController.dispose();
    touristEmailController.dispose();
    return super.close();
  }
}
