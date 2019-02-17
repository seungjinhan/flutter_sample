class PhotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotoModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  PhotoModel.fromJson(Map<String, dynamic> jObj) {
    albumId = jObj['albumId'];
    id = jObj['id'];
    title = jObj['title'];
    url = jObj['url'];
    thumbnailUrl = jObj['thumbnailUrl'];
  }

  toString() {
    print(albumId);
    print(id);
    print(title);
    print(url);
  }
}
