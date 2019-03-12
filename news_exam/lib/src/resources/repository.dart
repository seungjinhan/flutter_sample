import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  //NewsDbProvicer dbProvider = NewsDbProvicer();
  //NewsApiPrivider apiProvicer = NewsApiPrivider();

  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiPrivider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  // iterate over sources when dbprovider
  // get fetch
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    var source;
    var idx = 0;
    print('size : ${sources.length}');
    
    for (source in sources) {
      print('idx ${idx}');
      item = await source.fetchItem(id);
      if (item != null) {
        print('kkk');
        break;
      }
      print('result : ${idx}');
      idx++;
    }

    print('@@@');
    for (var cache in caches) {
      print('cache ${cache}');
      if (cache != source) {
        cache.addItem(item);
      }
    }
    print(item);
    return item;
    //   var item = await dbProvider.fetchItem(id);
    //   if (item != null) {
    //     return item;
    //   }

    //   item = await apiProvicer.fetchItem(id);

    //   await dbProvider.addItem(item);

    //   return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
