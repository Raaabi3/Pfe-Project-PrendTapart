import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIN Code Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PinCodeScreen(),
    );
  }
}

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String pin = '';

  void _onKeyboardTap(String value) {
    setState(() {
      if (pin.length < 4) {
        pin += value;
      }
    });
  }

  void _onBackspaceTap() {
    setState(() {
      if (pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      }
    });
  }

  Widget _buildPinDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(4, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < pin.length ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget _buildKeyboardButton(String value) {
    return Expanded(
      child: InkWell(
        onTap: () => _onKeyboardTap(value),
        child: Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Expanded(
      child: InkWell(
        onTap: _onBackspaceTap,
        child: Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(Icons.backspace, size: 24.0),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildKeyboardButton('1'),
            _buildKeyboardButton('2'),
            _buildKeyboardButton('3'),
          ],
        ),
        Row(
          children: <Widget>[
            _buildKeyboardButton('4'),
            _buildKeyboardButton('5'),
            _buildKeyboardButton('6'),
          ],
        ),
        Row(
          children: <Widget>[
            _buildKeyboardButton('7'),
            _buildKeyboardButton('8'),
            _buildKeyboardButton('9'),
          ],
        ),
        Row(
          children: <Widget>[
            Spacer(),
            _buildKeyboardButton('0'),
            _buildBackspaceButton(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildPinDots(),
            SizedBox(height: 32.0),
            _buildKeyboard(),
          ],
        ),
      ),
    );
  }
}
