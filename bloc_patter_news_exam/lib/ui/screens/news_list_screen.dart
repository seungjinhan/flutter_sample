import '../../blocs/news_bloc.dart';
import '../views/search_bar.dart';
import '../views/stream_builder.dart';
import 'package:flutter/material.dart';

ScrollController scrollControllerNewsList;

class NewsListScreen extends StatefulWidget {
  @override
  createState() => NewsListScreenState();
}

class NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    setState(() {});
    scrollControllerNewsList = ScrollController(initialScrollOffset: 84);
    super.initState();
  }

  @override
  void dispose() {
    scrollControllerNewsList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllNews();
    setState(() {});
    return SafeArea(
      child: CustomScrollView(
        controller: scrollControllerNewsList,
        slivers: <Widget>[
          buildSearchBar(context), // Serach
          streamBuilder(bloc.allNews),
        ],
      ),
    );
  }
}
