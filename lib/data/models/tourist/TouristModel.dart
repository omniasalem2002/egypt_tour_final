
class TourisModel{
  final String name;
  final String phoneNumber;
  final String whatsAppNumber;
  final String email;



  TourisModel({
    required this.name,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.email
  });

  factory TourisModel.fromJson(Map<String, dynamic> json) {
    return TourisModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      whatsAppNumber: json['whatsAppNumber'],
      email: json['email'],


    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'whatsAppNumber': whatsAppNumber,
      'email': email,

    };
  }
}
