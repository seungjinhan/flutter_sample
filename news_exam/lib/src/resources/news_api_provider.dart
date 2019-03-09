import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' show Client;
import 'package:news_exam/src/models/item_model.dart';
import 'package:news_exam/src/resources/repository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiPrivider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final res = await client.get('$_root/topstories.json');

    final ids = json.decode(res.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final res = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(res.body);

    return ItemModel.fromJson(parsedJson);
  }
}
