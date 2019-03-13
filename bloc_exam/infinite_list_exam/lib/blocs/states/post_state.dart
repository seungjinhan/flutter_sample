import 'package:equatable/equatable.dart';
import 'package:infinite_list_exam/blocs/models/post_model.dart';

abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}

/*
 * will tell the presentation layer 
 * it needs to rendeer a loading indicator 
 * while the initial batch of posts are loaded
 */
class PostUninitializedSatate extends PostState {
  @override
  String toString() => 'PostUninitialzedState';
}

/*
 * will tell the presentation layer that an error has occurred while fetching posts
 */
class PostErrorState extends PostState {
  @override
  String toString() => 'PostErrorState';
}

/*
 * will tell the presentation layer it has content to render
 * posts - will be the List<Post> which will be displayed
 * hasReachedMax - will tell the presentation layer whether or not it has reach the maximum number of posts
 */
class PostLoadedState extends PostState {
  final List<PostModel> posts;
  final bool hasReachedMax;

  PostLoadedState({
    this.posts,
    this.hasReachedMax,
  }) : super([posts, hasReachedMax]);

  PostLoadedState copyWith({List<PostModel> posts, bool hasReachedMax}) {
    return PostLoadedState(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() => 'PostLoadedState { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}
