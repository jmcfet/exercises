import 'package:flutter/material.dart';

import 'package:exercises/blocs/globals_bloc.dart';
import 'package:exercises/models/group_response.dart';
import 'package:exercises/models/Group.dart';
//import 'package:exercises/models/exercise.dart';
//import 'package:exercises/models/setting.dart';
import 'package:exercises/views/exerciseview.dart';
import 'package:exercises/views/GlobalSettingsView.dart';
void main() => runApp(MyApp());
//m
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SIS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double cellheight = 40;
  double cellWidth = 40;
  double unitsize;
  double screenheight;
  List<Widget> rows ;
  List<Group> groups;
  @override
  void initState() {
    super.initState();
    bloc.getGroups();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GroupsResponse>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<GroupsResponse> snapshot) {
        if (snapshot.hasData) {
          //   if (snapshot.data.error != null && snapshot.data.error.length > 0) {
          //     return _buildErrorWidget(snapshot.data.error);
          //    }
          return _buildUserWidget(snapshot.data);
          //   } else if (snapshot.hasError) {
          //    return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading data from API...",
                style: Theme.of(context).textTheme.subtitle),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),)
          ],
        ));
  }


  _buildUserWidget(GroupsResponse data) {
    groups = data.results;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: myLayoutWidget(),
      // body: OrientationBuilder(builder: (context, orientation) {

      //   builder: (context, orientation) {
      //     return orientation == Orientation.portrait
      //          ? _buildHorizontalLayout()
      //          : _buildHorizontalLayout();
      //  },
      //  );

    );
  }
  Widget myLayoutWidget(){
    screenheight = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).size.width > 600) {
      return _buildHorizontalLayout();
    } else {
      return _buildVerticalLayout();
    }
  }
  _buildVerticalLayout(){
    return new Column(
        children:  <Widget>[
          Expanded(
              flex:1,
              child:Container(

               child:GlobalSettingsView(),
              )
          ),
          Expanded(
              flex:4,
              child:Container(

                  child: ExerciseView(groups,context)
              )
          )
        ]
    )
    ;
  }
  _buildHorizontalLayout(){
    return new Row(
        children:  <Widget>[
          Expanded(
            flex:3,
            child:GlobalSettingsView(),
          ),
          Expanded(
              flex:7,
              child:ExerciseView(groups,context))

        ]
    )
    ;
  }





}

