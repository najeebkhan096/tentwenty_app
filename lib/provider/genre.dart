import 'package:flutter/material.dart';
import 'package:tentwenty/Api/api_request.dart';
import 'package:tentwenty/modal/genre.dart';


class GenreProvider extends ChangeNotifier {
  List<Genre> _genres = [];


  List<Genre> get genres => _genres;



  Future<void> fetchGenres() async {
    _genres = await api_request.fetchGenres();
    notifyListeners();
  }

  List<Genre> getGenresByID(List<int> ids){
return    genres.where((element) => ids.contains(element.id)).toList();
  }




}
