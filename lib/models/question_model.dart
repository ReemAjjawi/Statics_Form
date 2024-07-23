import 'dart:convert';

class Questions {
  List<String> questions;
  List<int> idOfUsers;
  int age;
  int color;

  Questions({
    required this.questions,
    required this.idOfUsers,
    required this.age,
    required this.color,
  });

  Questions copyWith({
    List<String>? questions,
    List<int>? idOfUsers,
    int? age,
    int? color,
  }) {
    return Questions(
      questions: questions ?? this.questions,
      idOfUsers: idOfUsers ?? this.idOfUsers,
      age: age ?? this.age,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questions': questions,
      'idOfUsers': idOfUsers,
      'age': age,
      'color': color,
    };
  }

  factory Questions.fromMap(Map<String, dynamic> map) {
    return Questions(
      questions: List<String>.from(map['questions'] ?? []),
      idOfUsers: List<int>.from(map['idOfUsers'] ?? []),
      age: map['age'] as int,
      color: map['color'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Questions.fromJson(String source) => Questions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Questions(questions: $questions, idOfUsers: $idOfUsers, age: $age, color: $color)';
  }
}
