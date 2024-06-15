import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:guru/Screens/about.dart';
import 'package:guru/Screens/contact.dart';
import 'package:guru/Screens/country_city_selection.dart';
import 'package:guru/Screens/login_view.dart';
import 'package:guru/Screens/profile.dart';
import 'package:guru/Screens/tour_guides.dart';
import 'package:guru/core/component/form_for_register_tourist.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/1.png'},
    {"id": 2, "image_path": 'assets/images/1.jpg'},
    {"id": 3, "image_path": 'assets/images/2.jpg'},
    {"id": 4, "image_path": 'assets/images/3.jpg'},
    {"id": 5, "image_path": 'assets/images/4.jpg'},
    {"id": 6, "image_path": 'assets/images/5.jpg'},
    {"id": 7, "image_path": 'assets/images/6.jpg'},
    {"id": 8, "image_path": 'assets/images/7.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(""),
      ),
      body: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 0.8,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.teal),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Guru app connects ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    " Tourists ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 1, 61, 58),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "with ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    " Tour Guides ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 1, 61, 58),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 61, 58),
                minimumSize: const Size(225, 40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CountryCitySelection();
                    },
                  ),
                );
              },
              label: const Text(
                "Search Tour Guides",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 61, 58),
                minimumSize: const Size(200, 40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginView();
                    },
                  ),
                );
              },
              label: const Text(
                "Tour Guide Registration",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ]),
    );
  }
}
