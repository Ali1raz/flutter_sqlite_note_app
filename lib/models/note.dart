class Note {
  int id;
  String title;
  String description;
  String date;
  int priority;

  Note({required this.id ,required this.title,required this.description,required this.date,required this.priority});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'priority': priority,
    };
  }

  factory Note.fromMapObject(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      priority: map['priority'],
    );
  }
}