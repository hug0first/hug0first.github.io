import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'PicturePages.dart';

class GetFiles {
  Future<List<String>> getFileStrings(String path, PicturePages picturePages) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains(path))
        .toList();
    picturePages.setNumPages(imagePaths.length);
    return imagePaths;
  }
}