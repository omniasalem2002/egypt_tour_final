import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/styles.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_cubit.dart';

showListCityDialog(BuildContext ctxt, Size size) {
  showDialog(
    context: ctxt,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Select City',
          style: Styles.font14BlueSemiBold(ctxt).copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _cities.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<TourGuideCubit>(ctxt).selectedCityController.text = _cities[index];
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      _cities[index],
                      style: Styles.font17GreyRegular(context)
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.pink),
            ),
          )
        ],
      );
    },
  );
}
final List<String> _cities = [
  'Cairo',
  'giza'
  'Luxor',
  'Aswan',
  'Alexandria',
  'Sharm El Sheikh',
  'Hurghada',
  'Dahab',
  'Siwa Oasis',
  'Marsa Alam',
  'Port Said',
];/*List<String> productCategories = [
  'category 1',
  'category 2',
  'category 3',
  'category 4',
  'category 5',
  'category 6',
  'category 7',
  'category 8',
  'category 9',
  'category 10',
  'category 11',
  'category 12',
  'category 13',
  'category 14',
  'category 15',
  'category 16',
  'category 17',
  'category 18',
];*/