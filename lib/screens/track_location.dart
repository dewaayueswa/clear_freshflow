import 'package:flutter/material.dart';

class TrackLocationScreen extends StatelessWidget {
  const TrackLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Delivery Location'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/maps.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
