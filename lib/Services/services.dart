import 'dart:convert';
import 'package:http/http.dart' as http;
import '../AppConstants/appConstants.dart';

class Services{

  Future getUnsplashImages({required int page}) async {
    Uri urlf = Uri.parse('${photosUrl}page=$page&per_page=10');
    try {
      var res = await http.get(
        urlf,
        headers: getHeader(),
      );
      return json.decode(res.body);
    } catch (e) {
      return e;
    }
  }
}