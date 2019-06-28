
import 'package:exercises/models/Group.dart';

class GroupsResponse {
  final List<Group> results;
  final String error;

  GroupsResponse(this.results, this.error);
  GroupsResponse.mock(List<Group> groups):
    results = groups,error = "";

  //GroupsResponse.fromJson(Map<String, dynamic> json)
  //    : results =
 // (json["results"] as List).map((i) => new User.fromJson(i)).toList(),
  //      error = "";

  //GroupsResponse.withError(String errorValue)
   //   : results = List(),
  //      error = errorValue;
}