class Trip {
  final String id;
  final String userId;
  final String startLocation;
  final String endLocation;
  final double budget;
  final int duration;
  final String travelType; // e.g., "budget", "luxury", "solo"

  Trip({
    required this.id,
    required this.userId,
    required this.startLocation,
    required this.endLocation,
    required this.budget,
    required this.duration,
    required this.travelType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'startLocation': startLocation,
      'endLocation': endLocation,
      'budget': budget,
      'duration': duration,
      'travelType': travelType,
    };
  }
}
