import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:guru/core/utils/colors_app.dart';

class ContactTourWithPhone extends StatelessWidget {
  final String tourGuideName;
  final String tourGuidePhoneNumber;

  const ContactTourWithPhone({
    Key? key,
    required this.tourGuideName,
    required this.tourGuidePhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tour Guide Contact Number"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 61, 58),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset("images/phone.json"),
                const Text(
                  "You can book your guide for 35 US Dollars",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "$tourGuideName",
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tourGuidePhoneNumber,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 1, 61, 58),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Card(
                        elevation: 20,
                        child: IconButton(
                          icon: const Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 1, 61, 58),
                            size: 40,
                          ),
                          onPressed: () {
                            _launchPhoneCall(tourGuidePhoneNumber);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to launch phone call using url_launcher package
  void _launchPhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
