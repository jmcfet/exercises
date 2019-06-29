import 'package:exercises/Repository/Groups_mockprovider.dart';
import 'package:exercises/models/group_response.dart';

class GroupsRepository{
  GroupMockProvider _apiProvider = GroupMockProvider();

  Future<GroupsResponse> getGroups(){
    return _apiProvider.getGroups();
  }
}