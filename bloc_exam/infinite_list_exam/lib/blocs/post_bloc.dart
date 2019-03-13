import 'package:bloc/bloc.dart';
import 'package:infinite_list_exam/blocs/events/post_event.dart';
import 'package:infinite_list_exam/blocs/models/post_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_list_exam/blocs/states/post_state.dart';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  get initialState => PostUninitializedSatate();

  @override
  Stream<PostEvent> transform(Stream<PostEvent> events) {
    return (events as Observable<PostEvent>).debounce(
      Duration(milliseconds: 500),
    );
  }

  @override
  Stream<PostState> mapEventToState(PostState currentState, PostEvent event) async* {
    if (event is FetchEvent && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitializedSatate) {
          final posts = await _fetchPosts(0, 20);
          yield PostLoadedState(posts: posts, hasReachedMax: false);
        }

        if (currentState is PostLoadedState) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostLoadedState(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostErrorState();
      }
    }
  }

  bool _hasReachedMax(PostState state) => state is PostLoadedState && state.hasReachedMax;

  Future<List<PostModel>> _fetchPosts(int startIndex, int limit) async {
    final res = await httpClient.get('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (res.statusCode == 200) {
      final data = json.decode(res.body) as List;

      return data.map((rawData) {
        return PostModel(
          id: rawData['id'],
          title: rawData['title'],
          body: rawData['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching pasts');
    }
  }
}
