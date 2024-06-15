class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to Egypt",
    image: "images/1.jpg",
    desc: "A land of timeless wonders and vibrant culture",
  ),
  OnboardingContents(
    title: "Experience the tranquility of the Nile",
    image: "images/2.jpg",
    desc: "Where history flows alongside modern luxury.",
  ),
  OnboardingContents(
    title: "Savor the flavors of Egypt",
    image: "images/3.jpg",
    desc: "From delicious street food to gourmet dining experiences",
  ),
];
