// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Forms {
  List<dynamic> questions;
  List<dynamic> id_of_users;
  int? id;
  String? type;
  Forms({
    required this.questions,
    required this.id_of_users,
    this.id,
    this.type,
  });

  Forms copyWith({
    List<dynamic>? questions,
    List<dynamic>? id_of_users,
    int? id,
    String? type,
  }) {
    return Forms(
      questions: questions ?? this.questions,
      id_of_users: id_of_users ?? this.id_of_users,
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questions': questions,
      'id_of_users': id_of_users,
      'id': id,
      'type': type,
    };
  }

  factory Forms.fromMap(Map<String, dynamic> map) {
    return Forms(
      questions: List<dynamic>.from(
        (map['questions'] as List<dynamic>),
      ),
      id_of_users: List<dynamic>.from(
        (map['id_of_users'] as List<dynamic>),
      ),
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Forms.fromJson(String source) =>
      Forms.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Forms(questions: $questions, id_of_users: $id_of_users, id: $id, type: $type)';
  }

  @override
  bool operator ==(covariant Forms other) {
    if (identical(this, other)) return true;

    return listEquals(other.questions, questions) &&
        listEquals(other.id_of_users, id_of_users) &&
        other.id == id &&
        other.type == type;
  }

  @override
  int get hashCode {
    return questions.hashCode ^
        id_of_users.hashCode ^
        id.hashCode ^
        type.hashCode;
  }
}
