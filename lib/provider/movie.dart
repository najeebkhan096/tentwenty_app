import 'package:flutter/material.dart';
import 'package:tentwenty/Api/api_request.dart';
import 'package:tentwenty/modal/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> _searchmovies = [];
  List<Movie> get movies => _movies;
  List<Movie> get searchedmovies => _searchmovies;
  void addMovie(Movie item) {
    _movies.add(item);
    notifyListeners();
  }
  void setMovies(List<Movie> items) {
    _movies=items;
    notifyListeners();
  }


  void setSearchedMovies(List<Movie> items) {
    _searchmovies=items;
    notifyListeners();
  }
  void removeMovie(int index) {
    _movies.removeAt(index);
    notifyListeners();
  }
  Future<void> fetchMovies() async {
    _movies = await api_request.fetchMovies();
    notifyListeners();
  }




}
