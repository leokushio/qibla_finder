
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:qibla_finder/models/surah_audio_model.dart' as a;
import 'package:qibla_finder/models/surah_audio_model.dart';
import 'package:qibla_finder/models/surah_model.dart' as b;
import 'package:qibla_finder/models/surah_model.dart';
import 'package:qibla_finder/models/surah_list_model.dart';

class APIProvider extends ChangeNotifier{
  static const surahsURL = 
  'https://api.alquran.cloud/v1/surah';

  String error ='';

  Surahs surahsListModel = Surahs(code: 200, status: 'OK', data: []);

  SurahModel surahEnglishModel = 
    SurahModel(
      code: 200, 
      status: 'OK', 
      data: b.Data(
        number: 0, 
        name: 'test', 
        englishName: '', 
        englishNameTranslation: '', 
        revelationType: '', 
        numberOfAyahs: 0, 
        ayahs: [], 
        edition: b.Edition(identifier: '', language: '', name: '', englishName: '', format: '', type: '', direction: '')
      )
    );

  SurahModel surahArabicModel = 
    SurahModel(
      code: 200, 
      status: 'OK', 
      data: b.Data(
        number: 0, 
        name: 'test', 
        englishName: '', 
        englishNameTranslation: '', 
        revelationType: '', 
        numberOfAyahs: 0, 
        ayahs: <b.Ayah>[], 
        edition: b.Edition(identifier: '', language: '', name: '', englishName: '', format: '', type: '', direction: '')
      )
    );

  SurahAudioModel surahAudioModel = SurahAudioModel(
    code: 200, 
    status: "OK", 
    data: a.Data(
      number: 0, 
      name: '', 
      englishName: '', 
      englishNameTranslation: '', 
      revelationType: '', 
      numberOfAyahs: 0, 
      ayahs: <a.Ayah>[], 
      edition: a.Edition(
        identifier: '', 
        language: '', 
        name: '', 
        englishName: '', 
        format: '', 
        type: '', 
        direction: '')
      )
    );

   getSurahAudioFromAPI(int index) async{
    try {
      Response response = await http.get(Uri.parse('$surahsURL/${index.toString()}/ar.alafasy'));
      if (response.statusCode == 200) {
        surahAudioModel = surahAudioModelFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
       error = e.toString();
    }
    // isLoadingOffers = false;
    notifyListeners();
  }
  
  getSurahsFromAPI() async{
    try {
      Response response = await http.get(Uri.parse(surahsURL));
      if (response.statusCode == 200) {
        surahsListModel = surahsFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
       error = e.toString();
    }
    // isLoadingOffers = false;
    notifyListeners();
  }

  getSurahEnglishFromAPI(int index) async{
    try {
      Response response = await http.get(Uri.parse('$surahsURL/${index.toString()}/en.asad'));
      if (response.statusCode == 200) {
        surahEnglishModel = surahModelFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
       error = e.toString();
    }
    // isLoadingOffers = false;
    notifyListeners();
  }
  getSurahArabicFromAPI(int index) async{
    try {
      Response response = await http.get(Uri.parse('$surahsURL/${index.toString()}'));
      if (response.statusCode == 200) {
        surahArabicModel = surahModelFromJson(response.body);
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