import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/data/repos/fire_store_services.dart';
import 'package:guru/data/repos/fire_store_services_for_tourist.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_cubit.dart';
import 'package:guru/logic/tourist/add_tourist_cubit.dart';
import 'package:guru/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    try {
      await Firebase.initializeApp();
      print('Firebase initialized successfully');
    } catch (e) {
      print('Firebase initialization error: $e');
    }
  }

  // Initialize SharedPreferences

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fireStoreService = FireStoreServices();
    final fireStoreServicesForTourist = FireStoreServicesForTourist();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TourGuideCubit(fireStoreService),
        ),
        BlocProvider(
          create: (context) => AddTouristCubit(fireStoreServicesForTourist),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
