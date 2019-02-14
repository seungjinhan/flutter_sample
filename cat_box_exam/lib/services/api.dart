import 'dart:convert';
import 'package:cat_box_exam/models/cat.dart';

class CallApi {
  static List<Cat> catListFromJson(String jsonData) {
    List<Cat> catList = [];
    json.decode(jsonData)['cats'].forEach((cat) => catList.add(_catObj(cat)));
    return catList;
  }

  static Cat _catObj(Map<String, dynamic> map) {
    return Cat(
      externalId: map['id'],
      name: map['name'],
      description: map['description'],
      avatarUrl: map['image_url'],
      location: map['location'],
      likeCounter: map['like_counter'],
      isAdopted: map['adopted'],
      pictures: List<String>.from(map['pictures']),
      cattributes: List<String>.from(map['cattributes']),
    );
  }
}
