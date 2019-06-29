import 'package:exercises/models/group_response.dart';
import 'package:exercises/models/exercise.dart';
import 'package:exercises/models/Group.dart';
import 'package:exercises/models/setting.dart';

class GroupMockProvider {
  final String _endpoint = "https://randomuser.me/api/";


  GroupMockProvider() {
    //BaseOptions options = new BaseOptions(receiveTimeout: 5000, connectTimeout: 10000);
  //  _dio = Dio(options );
  //  _setupLoggingInterceptor();
  }

  Future<GroupsResponse>  getGroups()  =>
  //  try {
   //   Response response = await _dio.get(_endpoint);
    Future.delayed(Duration(seconds: 1), () =>  GroupsResponse.mock(mockdata()));

  //  } catch (error, stacktrace) {
   //   print("Exception occured: $error stackTrace: $stacktrace");
  //    return UserResponse.withError(_handleError(error));
   // }


  List<Group> mockdata()
  {
    Exercise ex0 = new Exercise("ex 1");
    ex0.settings.add(new Setting("Height","5.6"));
    ex0.settings.add(new Setting("Shoulder","53"));
    ex0.settings.add(new Setting("arm angle","53"));
    Exercise ex1 = new Exercise("ex 2");
    ex1.settings.add(new Setting("Height","5.6"));
    ex1.settings.add(new Setting("Shoulder","53"));
    ex1.settings.add(new Setting("arm angle","53"));
    Exercise ex2 = new Exercise("ex 3");
    ex2.settings.add(new Setting("Height","5.6"));
    ex2.settings.add(new Setting("Shoulder","53"));
    ex2.settings.add(new Setting("arm angle","53"));
    Exercise ex3 = new Exercise("ex 4");
    ex3.settings.add(new Setting("Height","5.6"));
    ex3.settings.add(new Setting("Shoulder","53"));
    ex3.settings.add(new Setting("arm angle","53"));
    Exercise ex4 = new Exercise("ex 5");
    ex4.settings.add(new Setting("Height","5.6"));
    ex4.settings.add(new Setting("Shoulder","53"));
    ex4.settings.add(new Setting("arm angle","53"));
    Exercise ex5 = new Exercise("ex 6");
    ex5.settings.add(new Setting("Height","5.6"));
    ex5.settings.add(new Setting("Shoulder","53"));
    ex5.settings.add(new Setting("arm angle","53"));
    Exercise ex6 = new Exercise("ex 7");
    ex6.settings.add(new Setting("Height","5.6"));
    ex6.settings.add(new Setting("Shoulder","53"));
    ex6.settings.add(new Setting("arm angle","53"));
    Exercise ex7 = new Exercise("ex 8");
    ex7.settings.add(new Setting("Height","5.6"));
    ex7.settings.add(new Setting("Shoulder","53"));
    ex7.settings.add(new Setting("arm angle","53"));
    Exercise ex8 = new Exercise("ex 9");
    ex8.settings.add(new Setting("Height","5.6"));
    ex8.settings.add(new Setting("Shoulder","53"));
    ex8.settings.add(new Setting("arm angle","53"));
    //  Exercise ex9 = new Exercise("ex 10");
    List<Group> groups = new List();
    Group g1 = new Group("g1");
    Group g2 = new Group("g2");
    Group g3 = new Group("g3");
    g1.exers.add(ex0);
    g1.exers.add(ex1);
    groups.add(g1);

    g2.exers.add(ex3);
    g2.exers.add(ex2);
    g2.exers.add(ex3);
    groups.add(g2);

    g3.exers.add(ex4);
    g3.exers.add(ex5);
    g3.exers.add(ex6);
    g3.exers.add(ex3);
    g3.exers.add(ex2);
    groups.add(g3);
    return groups;
  }
}