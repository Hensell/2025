/*"info": {
    "count": 826,
    "pages": 42,
    "next": "https://rickandmortyapi.com/api/character?page=2",
    "prev": null
  },*/

class InfoEntity {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoEntity({required this.count, required this.pages, this.next, this.prev});

  factory InfoEntity.fromJSON(Map<String, dynamic> json) {
    return InfoEntity(
        count: json['count'],
        pages: json['pages'],
        next: json['next'] ?? '',
        prev: json['prev'] ?? '');
  }
}
