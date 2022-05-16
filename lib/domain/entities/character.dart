class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.availaleComics,
    required this.availaleSeries,
    required this.availaleEvents,
  });

  int id;
  String name;
  String description;
  String thumbnail;
  int availaleComics;
  int availaleSeries;
  int availaleEvents;
}
