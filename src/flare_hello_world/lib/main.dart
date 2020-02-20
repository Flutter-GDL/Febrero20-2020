import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Controlling a simple animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // you only need a simple controller
  // rive has a good concrete implementation
  FlareControls _controls;

  @override
  void initState() {
    // TODO: implement initState
    _controls = FlareControls();
    super.initState();
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
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              child: FlareActor(
                "assets/corazon.flr",
                animation: "favorite",
                controller: _controls,
              ),
            ),
            Spacer(),
            FlatButton(
              onPressed: replayAnimation,
              child: Text("Replay"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void replayAnimation() {
    // if the animation is still running do nothing, otherwise play the animation
    // notice bools need to be checked like this
    // its one of those dart things....krant
    if (_controls.isActive.value == false) {
      debugPrint('Playing');
      _controls.play("favorite");
    }
  }
}
