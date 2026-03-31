class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String? poster;
  final String? type;

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    this.poster,
    this.type,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'Unknown',
      year: json['Year'] ?? 'N/A',
      imdbID: json['imdbID'] ?? '',
      poster: json['Poster'],
      type: json['Type'],
    );
  }
}
