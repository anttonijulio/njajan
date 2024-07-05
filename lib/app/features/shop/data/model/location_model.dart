import '../../domain/entity/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.latitude,
    required super.longitude,
  });

  factory LocationModel.fromRemote(Map<String, dynamic> data) {
    return LocationModel(
      latitude: data['latitude'],
      longitude: data['longitude'],
    );
  }
}
