class AddTourGuideResponse {
  final String status;
  final String message;

  AddTourGuideResponse({
    required this.status,
    required this.message,
  });

  factory AddTourGuideResponse.fromJson(Map<String, dynamic> json) {
    return AddTourGuideResponse(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
