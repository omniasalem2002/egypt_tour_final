import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/Screens/contact_tour_with_phone.dart';
import 'package:guru/core/component/custom_text_form_field.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/custom_text_button.dart';
import 'package:guru/core/utils/styles.dart';
import 'package:guru/logic/tourist/add_tourist_cubit.dart';
import 'package:guru/logic/tourist/add_tourist_state.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormForRegisterTourist extends StatefulWidget {
  final String tourGuideName;
  final String tourGuidePhoneNumber;

  const FormForRegisterTourist({
    Key? key,
    required this.tourGuideName,
    required this.tourGuidePhoneNumber,
  }) : super(key: key);

  @override
  State<FormForRegisterTourist> createState() => _FormForRegisterTouristState();
}

class _FormForRegisterTouristState extends State<FormForRegisterTourist> {
  bool formSubmitted = false; // Flag to track if form has been submitted

  @override
  void initState() {
    super.initState();
  //  checkFormSubmissionStatus();
  }

  Future<void> checkFormSubmissionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool submitted = prefs.getBool('formSubmitted') ?? false;
    setState(() {
      formSubmitted = submitted;
    });
  }

  void saveFormSubmissionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('formSubmitted', true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (formSubmitted) {
      return Container(); // Return an empty container if form has been submitted
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking Page"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 1, 61, 58),
          foregroundColor: Colors.white,
        ),
        body: BlocListener<AddTouristCubit, TouristState>(
          listener: (context, state) {
            if (state is TouristLoading) {
              // Show loading indicator
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is TouristSuccess) {
              // Hide loading indicator and show success message
              Navigator.pop(context); // To dismiss the loading dialog
             // saveFormSubmissionStatus();
              // Save form submission status
              Navigator.pushReplacement(
                // PushReplacement to prevent going back to this page
                context,
                MaterialPageRoute(
                  builder: (context) => ContactTourWithPhone(
                    tourGuideName: widget.tourGuideName,
                    tourGuidePhoneNumber: widget.tourGuidePhoneNumber,
                  ),
                ),
              );
            } else if (state is TouristFailure) {
              // Hide loading indicator and show error message
              Navigator.pop(context); // To dismiss the loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Lottie.asset("images/reg.json", height: 250),
                const SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 61, 58),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.tourGuideName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: context.read<AddTouristCubit>().formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: context.read<AddTouristCubit>().touristNameController,
                          hintText: "Enter Your Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.length < 3) {
                              return 'Name must be at least 3 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: context.read<AddTouristCubit>().touristEmailController,
                          hintText: "Enter Your Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Regex pattern to validate email addresses
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        IntlPhoneField(
                          controller: context.read<AddTouristCubit>().whatsAppNumberController,
                          decoration: InputDecoration(
                            hintText: "WhatsApp Number",
                            filled: true,
                            hintStyle: Styles.font14BlueSemiBold(context),
                            fillColor: ColorsApp.moreLightGrey,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'EG', // Default to Egypt
                          onChanged: (phone) {
                            print(phone.completeNumber); // Use this to get the full phone number
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                          validator: (phone) {
                            if (phone == null || phone.completeNumber.isEmpty) {
                              return 'Please enter your WhatsApp number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: context.read<AddTouristCubit>().touristPhoneNumberController,
                          hintText: "Local Phone Number Eg:- 01112345678",
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              // Check if the phone number starts with '01' and has exactly 11 digits in total
                              if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                                return 'Please enter a valid Egyptian phone number starting with 01';
                              }
                            }
                            return null; // If the field is empty, it passes validation
                          },
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: AppTextButton(
                            buttonText: 'Send Information to Guide',
                            textStyle: Styles.font14LightGreyRegular(context),
                            backgroundColor: ColorsApp.darkPrimary,
                            onPressed: () async {
                              if (context.read<AddTouristCubit>().formKey.currentState!.validate()) {
                                // If the form is valid, proceed with the action
                                context.read<AddTouristCubit>().addTourist();
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
      ),
    );
  }
}
