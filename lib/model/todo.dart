import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String category;

  @HiveField(3)
  bool isDone;

//<editor-fold desc="Data Methods">
  Todo({
    this.id,
    required this.title,
    required this.category,
    required this.isDone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          category == other.category &&
          isDone == other.isDone);

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ category.hashCode ^ isDone.hashCode;

  @override
  String toString() {
    return 'Todo{' +
        ' id: $id,' +
        ' title: $title,' +
        ' category: $category,' +
        ' isDone: $isDone,' +
        '}';
  }

  Todo copyWith({
    int? id,
    String? title,
    String? category,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'category': this.category,
      'isDone': this.isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      category: map['category'] as String,
      isDone: map['isDone'] as bool,
    );
  }

//</editor-fold>
}