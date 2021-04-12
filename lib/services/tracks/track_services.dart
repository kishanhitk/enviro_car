import 'package:http/http.dart' as http;

import 'package:enviro_car/main.dart';
import 'package:enviro_car/models/track_list.dart';
import 'package:enviro_car/models/user_model.dart';

class TrackServices {
  static String baseUrl = 'https://envirocar.org/api/stable';
  Future<TrackList> getAllTracks() async {
    final User user = userBox.get('user') as User;
    http.Response resp;
    try {
      resp = await http.get(
        Uri.parse("$baseUrl/tracks"),
        headers: {
          'X-User': user.name!,
          'X-Token': user.token!,
        },
      );
    } catch (e) {
      throw Exception(e);
    }

    final trackList = TrackList.fromJson(resp.body.toString());
    return trackList;
  }
}
