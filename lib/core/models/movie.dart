class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String? poster;
  final String? type;
  final String? plot;
  final String? genre;
  final String? director;
  final String? actors;

  List<String> get genreList {
    if (genre == null || genre!.isEmpty) return [];
    return genre!.split(',').map((e) => e.trim()).toList();
  }

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    this.poster,
    this.type,
    this.plot,
    this.genre,
    this.director,
    this.actors,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'Unknown',
      year: json['Year'] ?? 'N/A',
      imdbID: json['imdbID'] ?? '',
      poster: json['Poster'],
      type: json['Type'],
      plot: json['Plot'],
      genre: json['Genre'],
      director: json['Director'],
      actors: json['Actors'],
    );
  }
}
