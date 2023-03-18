 import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';

class MovieEntity {

   const MovieEntity({
      this.adult, this.backdropPath, this.id, this.title, this.originalLanguage, this.originalTitle, this.overview, this.posterPath, this.mediaType, this.genreIds, this.popularity, this.releaseDate, this.video, this.voteAverage, this.voteCount});

   final bool? adult;
   @JsonKey(name:"backdrop_path")
   final String? backdropPath;
   final int? id;
   final String? title;
   final String? originalLanguage;
   final  String? originalTitle;
   final String? overview;
   @JsonKey(name: "poster_path")
   final String? posterPath;
   final  String? mediaType;
   final List<int>? genreIds;
   final double? popularity;
   final String? releaseDate;
   final bool? video;
   final double? voteAverage;
   final int? voteCount;

   @override
   String toString() {
      return 'Movie: {title: ${title}, poster path: ${backdropPath}}';
   }

  factory MovieEntity.fromMovieDetailEntity(MovieDetailEntity movieDetailEntity) {
      return MovieEntity(id: movieDetailEntity.id,posterPath: movieDetailEntity.posterPath,backdropPath: movieDetailEntity.backDropPath,voteAverage: movieDetailEntity.voteAverage,releaseDate: movieDetailEntity.releaseDate);
  }
 }