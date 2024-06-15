
class TourGuideRequestBody {
  final String name;
  final String phoneNumber;
  final String image;
  final String workExperiences;
  final String selectedCity;


  TourGuideRequestBody({
    required this.name,
    required this.phoneNumber,
    required this.image,
    required this.workExperiences,
    required this.selectedCity,

  });

  factory TourGuideRequestBody.fromJson(Map<String, dynamic> json) {
    return TourGuideRequestBody(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
      workExperiences: json['workExperiences'],
      selectedCity: json['selectedCity'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'image': image,
      'workExperiences': workExperiences,
      'selectedCity' : selectedCity,
    };
  }
}
