class Interest {
  final String name;
  final bool isSelected;

  const Interest({required this.name, this.isSelected = false});

  Interest copyWith({String? name, bool? isSelected}) {
    return Interest(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

List<Interest> interests = [
  const Interest(name: 'Action'),
  const Interest(name: 'Comedy'),
  const Interest(name: 'Drama'),
  const Interest(name: 'Fantasy'),
  const Interest(name: 'Horror'),
  const Interest(name: 'Mystery'),
  const Interest(name: 'Romance'),
  const Interest(name: 'Thriller'),
  const Interest(name: 'Sci-Fi'),
  const Interest(name: 'Documentary'),
  const Interest(name: 'Anime'),
  const Interest(name: 'Crime'),
];
