
import 'package:exercises/models/setting.dart';
class Exercise {
  String Name;
  List<Setting> settings ;
  Exercise(this.Name){
    this.settings = new List<Setting>();
  }
}