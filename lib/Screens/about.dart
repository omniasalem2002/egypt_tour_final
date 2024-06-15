import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
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
                      child: Image.asset("images/guru_about.jpg")),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Welcome to Guru, where we believe every journey deserves an exceptional guide. We are a pioneering force in the travel industry, seamlessly connecting explorers with passionate local guides across the globe. At Guru, our mission is simple: to transform every trip into an unforgettable adventure. Whether you're craving the vibrant energy of bustling cities, the serene beauty of natural landscapes, or the rich tapestry of cultural experiences, our platform empowers you to discover destinations like never before. What sets us apart is our commitment to authenticity and quality. Each of our guides is carefully vetted, ensuring not only expertise in their locale but also a genuine enthusiasm for sharing their knowledge and love for their home turf. From hidden gems off the beaten path to iconic landmarks steeped in history,our guides are dedicated to revealing the heart and soul of every destination. We understand that no two travelers are alike, which is why we offer a diverse range of experiences tailored to your preferences. Whether you're a solo adventurer seeking immersive solo tours, a couple in search of romantic getaways, or a family yearning for unforgettable bonding experiences, Guru has you covered.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),
            ),
            Column(
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
                          child: Image.asset("images/guru_about1.jpg")),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: const Text(
                          "Our platform is designed to make travel planning effortless and enjoyable. With user-friendly tools and personalized recommendations, you can easily craft your dream itinerary, confident that every detail has been expertly curated to exceed your expectations. As a multinational company, we take pride in our global community of travelers and guides. With a presence in countless destinations around the world, Guru fosters connections that transcend borders, languages, and cultures, enriching lives and creating lasting memories one journey at a time. Join us on a voyage of discovery and embark on a transformative travel experience with Guru. Wherever your wanderlust takes you, let us be your trusted companion, guiding you towards moments of awe, inspiration, and connection that will stay with you long after you return home. Your adventure starts here. Welcome to Guru.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
