class TravelCompanion {
  final String id;
  final String tripId;
  final String userId;
  final String status; // "open", "matched"

  TravelCompanion({
    required this.id,
    required this.tripId,
    required this.userId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tripId': tripId,
      'userId': userId,
      'status': status,
    };
  }
}
