// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  int age;
  int? id;
  UserModel({
    required this.name,
    required this.age,
    this.id,
  });

  UserModel copyWith({
    String? name,
    int? age,
    int? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      age: map['age'] as int,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, age: $age, id: $id)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ id.hashCode;
  }
