class Itinerary {
  final String id;
  final String tripId;
  final String placeName;
  final String date;
  final String time;
  final String notes;

  Itinerary({
    required this.id,
    required this.tripId,
    required this.placeName,
    required this.date,
    required this.time,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tripId': tripId,
      'placeName': placeName,
      'date': date,
      'time': time,
      'notes': notes,
    };
  }
}
