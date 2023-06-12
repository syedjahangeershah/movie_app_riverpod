import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class GenreEntity extends Equatable {
  final int id;
  final String name;

  const GenreEntity({required this.id, required this.name});

  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    return GenreEntity(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;
}
