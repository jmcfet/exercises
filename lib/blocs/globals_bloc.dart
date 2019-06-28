import 'package:exercises/models/group_response.dart';
import 'package:exercises/repository/Groups_repository.dart';
import 'package:rxdart/rxdart.dart';

class GroupsBloc {
  final GroupsRepository _repository = GroupsRepository();
  final BehaviorSubject<GroupsResponse> _subject =
  BehaviorSubject<GroupsResponse>();

  //getGroups() async {
  getGroups(){
    GroupsResponse response =  _repository.getGroups();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GroupsResponse> get subject => _subject;

}
final bloc = GroupsBloc();