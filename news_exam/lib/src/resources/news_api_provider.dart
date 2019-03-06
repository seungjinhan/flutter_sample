import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:news_exam/src/models/item_model.dart';

final _root = 'ttps://hacker-news.firebaseio.com/v0';

class NewsApiPrivider {
  Client client = Client();

  fetchTopIds() async {
    final res = await client.get('$_root/topstories.json');
    final ids = json.decode(res.body);

    return ids;
  }

  fetchItem(int id) async {
    final res = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(res.body);

    return ItemModel.fromJson(parsedJson);
  }
}
