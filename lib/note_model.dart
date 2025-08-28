class Note {
  final String id;
  final String title;
  final String description;

  Note({
    required this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'timestamp': DateTime.now(),
    };
  }
}
