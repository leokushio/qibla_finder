
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:qibla_finder/models/surah_model.dart';

class APIProvider extends ChangeNotifier{
  static const surahsURL = 
  'https://api.alquran.cloud/v1/surah';

  String error ='';

  Surahs surahsModel = Surahs(code: 200, status: 'OK', data: []);

  getSurahsFromAPI() async{
    try {
      Response response = await http.get(Uri.parse(surahsURL));
      if (response.statusCode == 200) {
        surahsModel = surahsFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
       error = e.toString();
    }
    // isLoadingOffers = false;
    notifyListeners();
  }
}