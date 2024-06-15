import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/core/component/custom_guide.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_cubit.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_state.dart';

class TourGuides extends StatefulWidget {
  final String city;
  const TourGuides({super.key, required this.city});

  @override
  State<TourGuides> createState() => _TourGuidesState();
}

class _TourGuidesState extends State<TourGuides> {
  @override
  void initState() {
    super.initState();
    context.read<TourGuideCubit>().getTourGuides(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 61, 58),
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<TourGuideCubit, TourGuideState>(
        builder: (context, state) {
          if (state is TourGuideLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TourGuideFailure) {
            return Center(
                child: Text('Failed to load tour guides: ${state.error}'));
          } else if (state is GetTourGuideSuccess) {
            final tourGuides = state.tourGuides;
            return LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = (constraints.maxWidth ~/ 150).toInt();
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: tourGuides.length,
                    itemBuilder: (context, index) {
                      final tourGuide = tourGuides[index];
                      return CustomGuide(tourGuide: tourGuide);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
