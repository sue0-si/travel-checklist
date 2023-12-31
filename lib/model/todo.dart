class Todo {
  String title;
  String category;

//<editor-fold desc="Data Methods">
  Todo({
    required this.title,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          category == other.category);

  @override
  int get hashCode => title.hashCode ^ category.hashCode;

  @override
  String toString() {
    return 'Todo{' + ' title: $title,' + ' category: $category,' + '}';
  }

  Todo copyWith({
    String? title,
    String? category,
  }) {
    return Todo(
      title: title ?? this.title,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'category': this.category,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] as String,
      category: map['category'] as String,
    );
  }

//</editor-fold>
}