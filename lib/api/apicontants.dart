class Constants {
  static const apiKey = 'b7caaa1cf274efcfcbfded77afb87b13';
  static const String baseurl = "https://api.themoviedb.org/3/movie/popular";
  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  static String getDetails(int movieId) {
    return "/3/movie/$movieId";
  }

  static const String genreListEndpoint = "/genre/movie/list";
  static const String discoverMovieEndpoint = "/discover/movie";
  static const String popularMoviesEndpoint = "/movie/popular";
  static const String topRatedMoviesEndpoint = "/movie/top_rated";
  static const String upcomingMoviesEndpoint = "/movie/upcoming";

  static String getGenreListUrl() {
    return "$baseurl$genreListEndpoint?api_key=$apiKey&language=en-US";
  }

  static String getDiscoverMovieUrl(
      {required String genreId, required String pageNo}) {
    return "$baseurl$discoverMovieEndpoint?api_key=$apiKey&with_genres=$genreId&page=$pageNo";
  }

  static String getPopularMoviesUrl() {
    return "$baseurl$popularMoviesEndpoint?api_key=$apiKey";
  }

  static String getTopRatedMoviesUrl() {
    return "$baseurl$topRatedMoviesEndpoint?api_key=$apiKey";
  }

  static String getUpcomingMoviesUrl() {
    return "$baseurl$upcomingMoviesEndpoint?api_key=$apiKey";
  }
}
