import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items {// this is the copy of the main list any canges int eh list dosent effect to the main list
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage,){
    final newPlace = Place(id: DateTime.now().toString(), title: pickedTitle, location: null, image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    
  }

}