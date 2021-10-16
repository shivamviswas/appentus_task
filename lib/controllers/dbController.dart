import 'package:hive/hive.dart';

class BoxDatabase {
  static var box;

  static initBox() async {
    box = await Hive.openBox('Users');
  }

  static putData(String key, value) {
    box.put(key, value);
  }

  static getData(String key) {
    return box.get(key);
  }

  static logout(){
    box.deleteFromDisk();
  }
}
