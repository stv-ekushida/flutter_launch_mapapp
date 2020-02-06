import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String urlString = '';

    if (Platform.isIOS) {
      //Apple Maps
//      urlString = 'http://maps.apple.com/?daddr=${latitude},${longitude}&dirflg=d';

      //Google Maps
      urlString =
          'comgooglemaps://?daddr=${latitude},${longitude}&directionsmode=driving&zoom=14';
    } else {
      urlString =
          'https://www.google.co.jp/maps/dir/?api=1&destination=${latitude},${longitude}';
    }
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'マップアプリが起動できません。';
    }
  }
}
