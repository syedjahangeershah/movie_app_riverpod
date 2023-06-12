import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'genre_entity.dart';

@immutable
class GenreModel extends Equatable {
  final String name;
  final int id;
  final bool isSelected;

  const GenreModel({
    required this.name,
    this.id = 0,
    this.isSelected = false,
  });

  factory GenreModel.fromEntity(GenreEntity genreEntity) {
    return GenreModel(
      name: genreEntity.name,
      id: genreEntity.id,
      isSelected: false,
    );
  }

  GenreModel toggleSelected() {
    return GenreModel(
      name: name,
      isSelected: !isSelected,
      id: id,
    );
  }

  @override
  List<Object?> get props => [name, isSelected, id];

  @override
  bool? get stringify => true;
}
