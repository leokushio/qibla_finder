// To parse this JSON data, do
//
//     final surahAudioModel = surahAudioModelFromJson(jsonString);

import 'dart:convert';

SurahAudioModel surahAudioModelFromJson(String str) => SurahAudioModel.fromJson(json.decode(str));

String surahAudioModelToJson(SurahAudioModel data) => json.encode(data.toJson());

class SurahAudioModel {
    int code;
    String status;
    Data data;

    SurahAudioModel({
        required this.code,
        required this.status,
        required this.data,
    });

    factory SurahAudioModel.fromJson(Map<String, dynamic> json) => SurahAudioModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int number;
    String name;
    String englishName;
    String englishNameTranslation;
    String revelationType;
    int numberOfAyahs;
    List<Ayah> ayahs;
    Edition edition;

    Data({
        required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.revelationType,
        required this.numberOfAyahs,
        required this.ayahs,
        required this.edition,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        numberOfAyahs: json["numberOfAyahs"],
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
        edition: Edition.fromJson(json["edition"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "numberOfAyahs": numberOfAyahs,
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
        "edition": edition.toJson(),
    };
}

class Ayah {
    int number;
    String audio;
    List<String> audioSecondary;
    String text;
    int numberInSurah;
    int juz;
    int manzil;
    int page;
    int ruku;
    int hizbQuarter;
    bool sajda;

    Ayah({
        required this.number,
        required this.audio,
        required this.audioSecondary,
        required this.text,
        required this.numberInSurah,
        required this.juz,
        required this.manzil,
        required this.page,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda,
    });

    factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        audio: json["audio"],
        audioSecondary: List<String>.from(json["audioSecondary"].map((x) => x)),
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "audio": audio,
        "audioSecondary": List<dynamic>.from(audioSecondary.map((x) => x)),
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
    };
}

class Edition {
    String identifier;
    String language;
    String name;
    String englishName;
    String format;
    String type;
    dynamic direction;

    Edition({
        required this.identifier,
        required this.language,
        required this.name,
        required this.englishName,
        required this.format,
        required this.type,
        required this.direction,
    });

    factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
        direction: json["direction"],
    );

    Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
        "direction": direction,
    };
}
