import 'package:flutter/material.dart';
import 'playVideo.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  double cellheight = 30;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  Widget makeButton() {
    return new SizedBox(
        height: cellheight,
        width: 40,
        child: new IconButton(

          icon: Icon(Icons.play_circle_filled),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(  // transitions to the new route using a platform-specific animation.
                    builder: (context) => PlayVideo(
                      videoURL: 'https://www.youtube.com/watch?v=C0DPdy98e4c',
                    )
                )
            );
          },
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: myLayoutWidget(),

    );
  }
  Widget myLayoutWidget() {
    Exercise ex0 = new Exercise("ex 1");
    Exercise ex1 = new Exercise("ex 2");
    Exercise ex2 = new Exercise("ex 3");
    Exercise ex3 = new Exercise("ex 4");
    Exercise ex4 = new Exercise("ex 5");
    Exercise ex5 = new Exercise("ex 1");
    Exercise ex6 = new Exercise("ex 2");
    Exercise ex7 = new Exercise("ex 3");
    Exercise ex8 = new Exercise("ex 4");
    Exercise ex9 = new Exercise("ex 5");
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

    Column col = new Column();
    List<Widget> rows = new List<Widget>();
    List<Widget> widgetsforrow = new List<Widget>();

    groups.forEach((g)  {
      int loops = g.exers.length > 3 ? g.exers.length : 3;
      for (int i=0;i< loops; i++) {
        List<Widget> widgetsforrow = new List<Widget>();
        bool needleft = false ;
        bool needright = false;
        if (i < g.exers.length  )
          needleft = true;
        if (i < 3)
          needright = true;
        if (needleft) {
          Widget w = Container(


            alignment: Alignment.topCenter,
            width: 40,
            height: cellheight,

            child:
            Text(g.exers[i].Name,
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          );
          widgetsforrow.add(w);
          widgetsforrow.add(new Container(
            width:40,
            height: cellheight,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/dogs.jpeg",
              fit: BoxFit.cover,
            ),
          )
          );
          widgetsforrow.add(makeButton() );

        }
        if (needright && needleft) {
          var box = SizedBox(
            width: 10,
            height: cellheight,

          );
          widgetsforrow.add(box);
          widgetsforrow.add(CreateContainer(30, cellheight * 1,10));
          widgetsforrow.add(CreateContainer(30, cellheight * 1,10));
        }
        if (needright && !needleft) {

          var box = SizedBox(
            width: 120,
            height: cellheight,

          );
          widgetsforrow.add(box);
          widgetsforrow.add(CreateContainer(30, cellheight * 1,10));
          widgetsforrow.add(CreateContainer(30, cellheight * 1,10));
        }
        Row myrow = new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgetsforrow);

        rows.add(myrow);
        List<Widget> widgetsforspacerrow = new List<Widget>();
        //produce spacer row between rows in group an groups
        double height1 = 3;
        if (i == loops-1){
           height1 = 20;

           widgetsforspacerrow.add(new SizedBox(
               width: 100,
               height: height1,

             )
           );
          Row spacerRow = new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widgetsforspacerrow);

          rows.add(spacerRow);
        }

    }
  });


    //for (int i=0;i<3; i++) {
    //  Row row = new Row();
      //rows.add(Row)
   //   rows.add(CreateContainer( 100, cellheight * 1));
    //  row.children.add(CreateContainer(100, cellheight * 1));
    //}

    // wrap everything in a purple container
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
      //  color: Colors.purple[900],
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),

      // column of three rows
      child: Column(

        // this makes the column height hug its content
        mainAxisSize: MainAxisSize.min,
        children: rows

      ),

    );
  }

  Widget CreateContainer( double cellwidth, double cellheight,double offset)
  {

    Widget w = Container(

      padding: EdgeInsets.only(left:offset),
      alignment: Alignment.topCenter,
      width: cellwidth,
      height: cellheight,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
      ),

    );
   // row.children.add(w);
    return w;
  }

}
class Exercise {
    String Name;
    Exercise(this.Name);
}

class Group{
  String Name;
  List<Exercise> exers ;
  Group(this.Name){
    this.exers = new List <Exercise>();
  }
}