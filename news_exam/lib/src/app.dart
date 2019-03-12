import 'package:flutter/material.dart';
import 'package:news_exam/src/screen/news_list.dart';
import 'bloc/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        home: NewsList(),
      ),
    );
  }
}
