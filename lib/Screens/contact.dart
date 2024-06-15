import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Us",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 61, 58),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Container(
                alignment: Alignment.center,
                height: 200,
                child: Card(
                  elevation: 10,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("images/guru_contact1.jpg")),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Have questions or need assistance? \nFeel free to reach out to us at:\n\n Email: For any inquiries, feedback, or assistance, please don't hesitate to send us an email at \n\ncontact.guru.company@gmail.com. \n\nOur dedicated team is here to help you with any questions you may have regarding our services or your Guru experience. We look forward to hearing from you!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
