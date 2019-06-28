import 'package:exercises/models/exercise.dart';


class Group {
  String Name;
  List<Exercise> exers;

  Group(this.Name) {
    this.exers = new List <Exercise>();
  }
}