// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieTableAdapter extends TypeAdapter<MovieTable> {
  @override
  final int typeId = 0;

  @override
  MovieTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieTable(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      voteAverage: fields[3] as num,
      backdropPath: fields[4] as String,
      releaseDate: fields[5] as String,
      overview: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieTable obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
