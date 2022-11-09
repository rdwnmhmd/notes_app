class Note {
  int id;
  String title;
  String description;
  Note({required this.id, required this.title, required this.description});
  Note copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
