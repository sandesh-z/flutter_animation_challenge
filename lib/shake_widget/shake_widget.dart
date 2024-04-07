import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget> {
  bool _isShaking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isShaking = true;
          });

          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _isShaking = false;
            });
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
            transform: _isShaking
                ? Matrix4.rotationZ(
                    0.1) // Adjust the value for more intense shake
                : Matrix4.rotationZ(0),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Shake Me!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
