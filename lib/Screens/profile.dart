import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/logic/tourist/add_tourist_cubit.dart';
import 'package:guru/logic/tourist/add_tourist_state.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 61, 58),
      ),
      body: BlocListener<AddTouristCubit, TouristState>(
        listener: (context, state) {
          if (state is TouristSuccess) {
            context.read<AddTouristCubit>().loadTouristFromSharedPreferences();
          }
        },
        child: BlocBuilder<AddTouristCubit, TouristState>(
          builder: (context, state) {
            if (state is TouristLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TouristLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name: ${state.touristData['name']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Email: ${state.touristData['email']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Phone Number: ${state.touristData['phoneNumber']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'WhatsApp Number: ${state.touristData['whatsAppNumber']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            } else if (state is TouristFailure) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
