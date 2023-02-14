 class MovieEntity {
   final bool? adult;
   final String? backdropPath;
   final int? id;
   final String? title;
   final String? originalLanguage;
   final  String? originalTitle;
   final String? overview;
   final String? posterPath;
   final  String? mediaType;
   final List<int>? genreIds;
   final double? popularity;
   final String? releaseDate;
   final bool? video;
   final double? voteAverage;
   final int? voteCount;

   const MovieEntity({
     this.adult, this.backdropPath, this.id, this.title, this.originalLanguage, this.originalTitle, this.overview, this.posterPath, this.mediaType, this.genreIds, this.popularity, this.releaseDate, this.video, this.voteAverage, this.voteCount});

   @override
   String toString() {
      return 'Movie: {title: ${title}, posterpath: ${posterPath}}';
   }
 }