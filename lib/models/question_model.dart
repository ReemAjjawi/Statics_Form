// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Forms {
  List<String> form;
  List<int> idOfUsers;
  int id;
  String type;
  Forms({
    required this.form,
    required this.idOfUsers,
    required this.id,
    required this.type,
  });

  Forms copyWith({
    List<String>? form,
    List<int>? idOfUsers,
    int? id,
    String? type,
  }) {
    return Forms(
      form: form ?? this.form,
      idOfUsers: idOfUsers ?? this.idOfUsers,
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'form': form,
      'idOfUsers': idOfUsers,
      'id': id,
      'type': type,
    };
  }


  factory Forms.fromMap(Map<String, dynamic> map) {
    return Forms(
      form: List<String>.from(map['form']),
      idOfUsers: List<int>.from(map['idOfUsers']),
      id: map['id'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Forms.fromJson(String source) => Forms.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Forms(form: $form, idOfUsers: $idOfUsers, id: $id, type: $type)';
  }

  @override
  bool operator ==(covariant Forms other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.form, form) &&
      listEquals(other.idOfUsers, idOfUsers) &&
      other.id == id &&
      other.type == type;
  }

  @override
  int get hashCode {
    return form.hashCode ^
      idOfUsers.hashCode ^
      id.hashCode ^
      type.hashCode;
  }
}
