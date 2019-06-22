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
    double nWidgits = 6;
    double width = MediaQuery.of(context).size.width;
    double extraForSpacer = 10;
    double extraForText = 15.0 * 2;
    unitsize = (width - (extraForSpacer + extraForText)) / nWidgits;
    //double unitsize = 50;
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

    Column col = new Column();
    List<Widget> rows = new List<Widget>();

    showSettingLabel(rows);

    groups.forEach((g)  {
      int loops = g.exers.length > 3 ? g.exers.length : 3;
      int nSetting = 0;
      for (int i=0;i< loops; i++) {
        List<Widget> widgetsforrow = new List<Widget>();
        bool needleft = false ;
        bool needright = false;
        if (i < g.exers.length  )
          needleft = true;
        if (i < 3)
          needright = true;
        if (needleft) {
          Widget exName = Expanded(

            flex:2,
            child:Container(height: cellheight,

            child:
            Text(g.exers[i].Name,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),

            ),
          ),
          );
          widgetsforrow.add(exName);
          //add image
          widgetsforrow.add(new Expanded(

            flex:1,
            child:Container(height: cellheight,

              child: Image.asset(
                "assets/images/dogs.jpeg",
                fit: BoxFit.contain,
                ),
              )
          )
          );
          //add play button
          widgetsforrow.add(makeButton(context,cellheight,unitsize) );
          if(!needright)
            showSetting(g,0,widgetsforrow,false);
        }
        if (needright && needleft) {
          var myspacer =Expanded(
          //  width: unitsize ,
         //   height: cellheight,
              flex:1,
           //   color:Colors.red

          );
      //    widgetsforrow.add(myspacer);
          showSetting(g,nSetting,widgetsforrow,true);

        }
        if (needright && !needleft) {

          var box = Expanded(

            flex:6,
            child:Container(

            )
          );
          widgetsforrow.add(box);

          showSetting(g,nSetting,widgetsforrow,true);
        }
        Row myrow = new Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: widgetsforrow);

        rows.add(myrow);

        nSetting++;
        List<Widget> widgetsforspacerrow = new List<Widget>();

        //produce spacer row between rows and   group an groups
        if (i == loops-1){
          if (g != groups.last)
            showSettingLabel(rows);

        }
        else{
          widgetsforspacerrow.add(new SizedBox(
            width: 100,
            height: 5,

          )
          );
          Row spacerRow = new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widgetsforspacerrow);

          rows.add(spacerRow);
        }

    }
  });


    // wrap everything in a white container
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[150],
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child:new ListView(
      // column of three rows
       

        children: rows

      ),

    );
  }

  showSettingLabel(List<Widget> rows){
    List<Widget> widgetsforspacerrow = new List<Widget>();
    var box = Expanded(

        flex:2,
        child:Container(
            color:Colors.blue
        )
    );
    widgetsforspacerrow.add(box);

    Widget label = Expanded(
      flex:3,
      //   color:Colors.cyan,
      child:
      Text("Set machine before starting group",
        style: TextStyle(
          fontSize: 10,
          color: Colors.red,

        ),
        textAlign: TextAlign.left,
      ),
    );
    widgetsforspacerrow.add(label);

    Row labelRow = new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widgetsforspacerrow);
    rows.add(labelRow);
  }
  showSetting(Group g,int nSetting,List<Widget> rows,bool bNoText) {
    Widget w = Expanded(
      flex:5,
      child: bNoText ?
        Container(child:
          Text(g.exers[0].settings[nSetting] != null ? g.exers[0].settings[nSetting]
              .Name : '',
            textAlign:  TextAlign.left,
            style: TextStyle(
              color: Colors.black38,
            ),
          )
        ): Container(height: cellheight)
    );
    rows.add(w);

    w = Expanded(

      flex:2,

        child: bNoText ?
          Container(child:
            Text(g.exers[0].settings[nSetting] != null ? g.exers[0].settings[nSetting]
                .Value : '',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
        ): Container(height: cellheight)
    );
    rows.add(w);
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
Widget makeButton(var context,double cellHeight,double cellWidth) {
  return new Expanded(

    flex:3,
      child:Container(height: cellHeight,
        child: new IconButton(
          padding: new EdgeInsets.all(0.0),
          iconSize: cellHeight,
          alignment: Alignment.topLeft,
          icon: Icon(Icons.play_circle_filled),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(  // transitions to the new route using a platform-specific animation.
                    builder: (context) => PlayVideo(
                      videoURL: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
                    )
                )
            );
          },
        )
      )
  );

}
class Exercise {
    String Name;
    List<Setting> settings ;
    Exercise(this.Name){
      this.settings = new List<Setting>();
    }
}

class Group{
  String Name;
  List<Exercise> exers ;
  Group(this.Name){
    this.exers = new List <Exercise>();
  }

}

class Setting{
  String Name;
  String Value;
  Setting(this.Name,this.Value);
}