class Constants {
  static const apiKey = 'b7caaa1cf274efcfcbfded77afb87b13';
  static const String baseurl = "https://api.themoviedb.org/3/movie/popular";
  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  static String getDetails(int movieId) {
    return "/3/movie/$movieId";
  }
}
