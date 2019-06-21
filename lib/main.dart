import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'People Count',
    home: App()
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _people = 0;
  String _infoText = 'Pode Entrar!';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = 'Mundo Invertido?!';
      } else if (_people <= 10) {
        _infoText = 'Pode Entrar!';
      } else {
        _infoText = 'Lotado!';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('images/restaurant.jpg',
          fit: BoxFit.cover,
          height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pessoas: $_people',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text('+1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40
                      ),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text('-1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40
                      ),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30
              ),
            )
          ],
        ),
      ],
    );
  }
}
