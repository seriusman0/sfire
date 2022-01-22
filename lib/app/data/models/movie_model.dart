class Movie {
  String? title;
  String? genre;

  Movie({this.title, this.genre});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['genre'] = genre;
    return data;
  }
}
