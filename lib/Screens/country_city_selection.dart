import 'package:flutter/material.dart';
import 'package:guru/Screens/tour_guides.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/custom_text_button.dart';
import 'package:guru/core/utils/styles.dart';
import 'package:lottie/lottie.dart';

class CountryCitySelection extends StatefulWidget {
  const CountryCitySelection({super.key});

  @override
  State<CountryCitySelection> createState() => _CountryCitySelectionState();
}

class _CountryCitySelectionState extends State<CountryCitySelection> {
  String? _selectedCountry;
  String? _selectedCity;

  final List<String> _countries = ['Egypt'];
  final List<String> _cities = [
    'Cairo',
    'Luxor',
    'Giza',
    'Aswan',
    'Alexandria',
    'Sharm El Sheikh',
    'Hurghada',
    'Dahab',
    'Siwa Oasis',
    'Marsa Alam',
    'Port Said',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Country and City"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 1, 61, 58),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset("images/country.json"),
              Form(
                //key: ,
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: DropdownButtonFormField<String>(
                          value: _selectedCountry,
                          decoration: InputDecoration(
                            fillColor: ColorsApp.darkPrimary,
                            labelText: 'Select country you want to visit',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: ColorsApp.darkPrimary,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          items: _countries.map((String type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: DropdownButtonFormField<String>(
                          value: _selectedCity,
                          decoration: InputDecoration(
                            fillColor: ColorsApp.darkPrimary,
                            labelText: 'Select city you want to visit',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: ColorsApp.darkPrimary,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          items: _cities.map((String type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCity = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: AppTextButton(
                          buttonText: 'Tour Guides',
                          textStyle: Styles.font14LightGreyRegular(context),
                          backgroundColor: ColorsApp.darkPrimary,
                          onPressed: () {
                            if (_selectedCountry == null ||
                                _selectedCountry!.isEmpty) {
                              // Show error dialog if no city is selected
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Please select a country.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (_selectedCity == null ||
                                _selectedCity!.isEmpty) {
                              // Show error dialog if no city is selected
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Please select a city.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // Proceed with navigation if a city is selected
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TourGuides(
                                        city:
                                            _selectedCity!); // Pass the selected city
                                  },
                                ),
                              );

                              //validateThenDoAddDepartment(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
