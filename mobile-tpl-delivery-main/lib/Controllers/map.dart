import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MapController extends GetxController {
  Position currentPosition;
  String currentAddress;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
      forceAndroidLocationManager: true,
    ).then((Position position) {
      currentPosition = position;
      update();
      _getAddressFromLatLng();
      update();
      final location = GetStorage();
      location.write('latitude', currentPosition.latitude);
      location.write('longitude', currentPosition.longitude);
      print(currentPosition.latitude);
      print(currentPosition.longitude);

      update();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = placemarks[0];

      currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
      print("${place.locality}, ${place.postalCode}, ${place.country}");
      update();
    } catch (e) {
      print(e);
    }
  }
}
