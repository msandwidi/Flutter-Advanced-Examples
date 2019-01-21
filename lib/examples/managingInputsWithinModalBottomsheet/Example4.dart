import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Example4 extends StatefulWidget {
  Example4();

  final String title = "Managing inputs within modal / bottom sheet";

  @override
  _Example4State createState() => _Example4State();
}

class _Example4State extends State<Example4> {

  String exampleUrl = "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/managingInputsWithinModalBottomsheet";

  // Modal
  bool modalIsChecked = false;
  bool modalIsSwitched = false;
  int modalRadioValue = 0;

  // Bottomsheet
  bool bottomIsChecked = false;
  bool bottomIsSwitched = false;
  int bottomRadioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.info_outline, color: Colors.white),
            onPressed: _launchURL
          )

        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text("Show modal"),
            ),
            RaisedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter state) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              CheckboxListTile(
                                value: bottomIsChecked,
                                title: Text("bottomIsChecked"),
                                onChanged: (value) {
                                  state(() {
                                    bottomIsChecked = value;
                                  });
                                },
                              ),
                              SwitchListTile(
                                value: bottomIsSwitched,
                                title: Text("bottomIsSwitched"),
                                onChanged: (value) {
                                  state(() {
                                    bottomIsSwitched = value;
                                  });
                                },
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio(
                                    value: 0,
                                    groupValue: bottomRadioValue,
                                    onChanged: (value) {
                                      state(() {
                                        bottomRadioValue = value;
                                      });
                                    },
                                  ),
                                  new Text(
                                    'Pizza',
                                  ),
                                  new Radio(
                                    value: 1,
                                    groupValue: bottomRadioValue,
                                    onChanged: (value) {
                                      state(() {
                                        bottomRadioValue = value;
                                      });
                                    },
                                  ),
                                  new Text(
                                    'Spaghetti',
                                  ),
                                  new Radio(
                                    value: 2,
                                    groupValue: bottomRadioValue,
                                    onChanged: (value) {
                                      state(() {
                                        bottomRadioValue = value;
                                      });
                                    },
                                  ),
                                  new Text(
                                    'Burger',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                    });
              },
              child: Text("Show bottom sheet"),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(exampleUrl)) {
      await launch(exampleUrl);
    } else {
      throw 'Could not launch $exampleUrl';
    }
  }
}
