class UrlConstant {
  static const API_KEY = "wIC7cFSNNcJMbmb2fhvkg2QfuuDgNwq3pSOYeGZ7";
  static const BASE_URL = "https://api.nasa.gov/mars-photos";

  static const NASA_SPIRIT_URL =
      "$BASE_URL/api/v1/rovers/spirit/photos?sol=1000&api_key=$API_KEY";
  static const NASA_CURIOSITY_URL =
      "$BASE_URL/api/v1/rovers/curiosity/photos?sol=1000&api_key=$API_KEY";
  static const NASA_OPPORTUNITY_URL =
      "$BASE_URL/api/v1/rovers/opportunity/photos?sol=1000&api_key=$API_KEY";
}
