
import 'package:flutter/foundation.dart';

class SavedItem {
  final String id;
  final String name;
  final String imagePath;
  final String location;

  SavedItem({this.id, this.name, this.imagePath, this.location});


}

class SavedDoc with ChangeNotifier {
  Map<String, SavedItem> _items = {};

  Map<String, SavedItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }


  void addItem (
      String doctorId,
      String name,
      String imagePath,
      String location,
      ) {
    if (_items.containsKey(doctorId)) {
      // change quantity...
      _items.update(
        doctorId,
            (existingCartItem) => SavedItem(
              id: existingCartItem.id,
              name:existingCartItem.name,
              imagePath:existingCartItem.imagePath,
              location:existingCartItem.location,

        ),
      );
    } else {
      _items.putIfAbsent(
        doctorId,
            () => SavedItem(
          id: DateTime.now().toString(),
           name: name,
              imagePath: imagePath,
              location: location
        ),
      );
    }
    notifyListeners();
  }



  void removeItem(String doctorId) {
    _items.remove(doctorId);
    notifyListeners();
  }



  void clear() {
    _items = {};
    notifyListeners();
  }
}
