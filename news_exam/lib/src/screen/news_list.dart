import 'package:flutter/material.dart';
import 'dart:async';
import 'package:news_exam/src/bloc/stories_provider.dart';
import '../widgets/news_list_tile.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    bloc.fetTopIds();
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            bloc.fetchItem(snapshot.data[index]);
            return NewsListTile(itemId: snapshot.data[index]);
          },
        );
      },
    );
  }

  // Widget buildList() {
  //   return ListView.builder(
  //     itemCount: 1000,
  //     itemBuilder: (context, int index) {
  //       return FutureBuilder(
  //         future: getFuture(),
  //         builder: (context, snapshot) {
  //           return Container(
  //             height: 80.0,
  //             child: snapshot.hasData ? Text('Im $index') : Text('not yet $index'),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // getFuture() {
  //   return Future.delayed(
  //     Duration(seconds: 2),
  //     () => 'hi',
  //   );
  // }
}
