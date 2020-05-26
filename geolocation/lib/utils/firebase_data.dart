import 'package:http/http.dart' as http;
import 'dart:convert';

class FirebaseData {
  static String userName;
  static Future<void> updateLatLng(uid, latitude, longitude) async {
    var url =
        "https://geolocation-89f89.firebaseio.com/users/${uid}.json";
    await http.patch(url,
        body: json.encode({
          'latitude': latitude,
          'longitude': longitude,
        }));
    // print("In FirebaseData: latitude: " + latitude.toString());
    // print("In FirebaseData: longitude: " + longitude.toString());
  }

  static Future<void> uploadImage(imageUrl, capturedDate, userId) async {
    var url = "https://geolocation-89f89.firebaseio.com/captured_images.json";
    await http.post(url,
        body: json.encode({
          'imageUrl': imageUrl,
          'capturedDate': capturedDate,
          'userId': userId,
        }));
  }

  static Future<void> getUserName(uid) async{
    var url =
        "https://geolocation-89f89.firebaseio.com/users/${uid}/name.json";
    var response=await http.get(url);
    userName=json.decode(response.body);
    
  }
}
