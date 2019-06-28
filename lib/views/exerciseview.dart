import 'package:flutter/material.dart';
import 'package:exercises/models/Group.dart';
import 'package:exercises/models/exercise.dart';
import 'package:exercises/models/setting.dart';
import 'package:exercises/playVideo.dart';
double cellheight = 40;
double cellWidth = 40;
double unitsize;
double screenheight;
Widget ExerciseView(List<Group> groups,var context)
{

  return Container(
    //height: 600,
    // width: 400,
    alignment: Alignment.topCenter,
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.grey[150],
      border: Border.all(),
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
    child:new ListView(

        children: _populateRowdata(groups,context)

    ),

  );

}

List<Widget> _populateRowdata(List<Group> groups,var context) {
  List<Widget> rows = new List<Widget>();

  Column col = new Column();

  showSettingLabel(rows);

  groups.forEach((g) {
    int loops = g.exers.length > 3 ? g.exers.length : 3;
    int nSetting = 0;
    for (int i = 0; i < loops; i++) {
      List<Widget> widgetsforrow = new List<Widget>();
      bool needleft = false;
      bool needright = false;
      if (i < g.exers.length)
        needleft = true;
      if (i < 3)
        needright = true;
      if (needleft) {
        Widget exName = Expanded(

          flex: 2,
          child: Container(height: cellheight,

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

            flex: 1,
            child: Container(height: cellheight,

              child: Image.asset(
                "assets/images/dogs.jpeg",
                fit: BoxFit.contain,
              ),
            )
        )
        );
        //add play button
        widgetsforrow.add(makeButton(context, cellheight, unitsize));
        if (!needright)
          showSetting(g, 0, widgetsforrow, false);
      }
      if (needright && needleft) {
        var myspacer = Expanded(
          //  width: unitsize ,
          //   height: cellheight,
          flex: 1,
          //   color:Colors.red

        );
        //    widgetsforrow.add(myspacer);
        showSetting(g, nSetting, widgetsforrow, true);
      }
      if (needright && !needleft) {
        var box = Expanded(

            flex: 6,
            child: Container(

            )
        );
        widgetsforrow.add(box);

        showSetting(g, nSetting, widgetsforrow, true);
      }
      Row myrow = new Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: widgetsforrow);

      rows.add(myrow);

      nSetting++;
      List<Widget> widgetsforspacerrow = new List<Widget>();

      //produce spacer row between rows and   group an groups
      if (i == loops - 1) {
        if (g != groups.last)
          showSettingLabel(rows);
      }
      else {
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
  return rows;
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