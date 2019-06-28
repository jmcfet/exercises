import 'package:flutter/material.dart';
import 'package:exercises/models/setting.dart';
Widget GlobalSettingsView(){
  List<Setting> globalsettings  = new List<Setting>();
  globalsettings.add(new Setting("upper arm length","53"));
  globalsettings.add(new Setting("lower arm","53"));
  Widget settings = new Container(
      alignment: Alignment.topCenter,
      child: new Column(

          children: [
            Container(height: 30,
              //   width:200,
              child:
              Text("Global settings",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

              ),
            ),

            Container(
              height: 75,
              //  width:200,
              margin: EdgeInsets.only(left:16,right: 16),
              //padding: EdgeInsets.all(16.0),
              //color:Colors.red,
              decoration: BoxDecoration(
                color: Colors.grey[150],
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              child: new ListView(
                // column of three rows

                children:
                showGlobalSettings(globalsettings),

              ),
            )
          ]
      )
  );
  return settings;
}

List<Widget> showGlobalSettings ( List<Setting> settings) {

  List<Widget> globalrows = new List<Widget>();


  settings.forEach((s) {
    List<Widget> widgetforows =  new List<Widget>();
    Widget w = Expanded(
        flex: 5,
        child:
        Text(s.Name,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black38,
          ),
        )

    );
    widgetforows.add(w);

    w = Expanded(

        flex: 2,
        child:
        Text(s.Value,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black38,
          ),
        )

    );
    widgetforows.add(w);

    Row labelRow = new Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: widgetforows);
    globalrows.add(labelRow);

  }
  );
  return globalrows;
}