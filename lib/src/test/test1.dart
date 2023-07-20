import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String textToShow = 'Initial Text';

  void changeText() {
    setState(() {
      textToShow = 'Updated Text';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(textToShow),
        ElevatedButton(
          onPressed: changeText,
          child: Text('Change Text'),
        ),
      ],
    );
  }
}
