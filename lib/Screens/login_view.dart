import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/core/component/custom_text_form_field.dart';
import 'package:guru/core/component/form_for_register_tourist.dart';
import 'package:guru/core/component/show_list_cities_dialog.dart';
import 'package:guru/core/component/show_list_payment_dialog.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/custom_text_button.dart';
import 'package:guru/core/utils/styles.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_cubit.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_state.dart';
import 'package:image_picker/image_picker.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? _selectedUserType;
  DateTime? _selectedDate;
  String? _selectedPaymentType;

  String? _selectedCity;

  final ImagePicker _picker = ImagePicker();
  // Function to handle image selection
  //File? _image;
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        context.read<TourGuideCubit>().image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(""),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                Column(
                  children: [
                    Center(
                      child: Card(
                        color: const Color.fromARGB(255, 5, 179, 170),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            width: 160,
                            height: 160,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                //color: Colors.grey[200],

                                borderRadius: BorderRadius.circular(70)),
                            child: Image.asset(
                              "images/logo_remove.png",
                              height: 120,
                              width: 120,
                              // fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 61, 58)),
                          onPressed: () {
                            setState(() {
                              _selectedUserType = 'Tour Guide';
                            });
                          },
                          child: const Text(
                            "Tour Guide Registration",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    if (_selectedUserType == 'Tour Guide' ||
                        _selectedUserType == null)
                      BlocListener<TourGuideCubit, TourGuideState>(
                        listener: (context, state) {
                          if (state is TourGuideLoading) {
                            // Show a loading indicator
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(),
                                        SizedBox(width: 20),
                                        Text("Submitting..."),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (state is TourGuideSuccess) {
                            // Dismiss the loading indicator
                            Navigator.of(context).pop();

                            // Show a success message
                            ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(
                                  content:
                                      Text('Form submitted successfully!')),
                            );
                          } else if (state is TourGuideFailure) {
                            // Dismiss the loading indicator
                            Navigator.of(context).pop();

                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                        child: Form(
                          key: context.read<TourGuideCubit>().formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                controller: context
                                    .read<TourGuideCubit>()
                                    .tourGuideNameController,
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
                                controller: context
                                    .read<TourGuideCubit>()
                                    .tourGuidePhoneNumberController,
                                hintText: "Enter Your Phone Number",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }

                                  // Check if the phone number starts with '01' and has exactly 11 digits in total
                                  if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                                    return 'Please enter a valid Egyptian phone number starting with 01';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                controller: context
                                    .read<TourGuideCubit>()
                                    .selectedCityController,
                                hintText: 'Select City',
                                isEnabled: false,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: ColorsApp.primaryColor,
                                    width: 1.3,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: ColorsApp.primaryColor,
                                ),
                                function: () {
                                  showListCityDialog(context, size);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select City';
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              context.read<TourGuideCubit>().image != null
                                  ? Image.file(
                                      context.read<TourGuideCubit>().image!)
                                  :const Text('No image selected.',
                                      style: TextStyle(color: Colors.red)),
                              ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: ColorsApp.darkPrimary,
                                ),
                                label: const Text(
                                  'Upload Photo',
                                  style:
                                      TextStyle(color: ColorsApp.darkPrimary),
                                ),
                                onPressed: _pickImage,
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                controller: context
                                    .read<TourGuideCubit>()
                                    .workExperiencesController,
                                hintText: "Enter Your Work Experience",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your work experience';
                                  }
                                  return null;
                                },
                                maxLines: 5,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: AppTextButton(
                                  buttonText: 'Create',
                                  textStyle:
                                      Styles.font14LightGreyRegular(context),
                                  backgroundColor: ColorsApp.darkPrimary,
                                  onPressed: () {
                                    if (context
                                            .read<TourGuideCubit>()
                                            .formKey
                                            .currentState
                                            ?.validate() ??
                                        false) {
                                      context
                                          .read<TourGuideCubit>()
                                          .addTourGuide();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
