import 'package:flutter/material.dart';

class EmployeeWorkDetails extends StatelessWidget {
  static const routeName = 'EmployeeWorkDetails';
  const EmployeeWorkDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text('Employee Work Details'),
      ),
      body: ListView(children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            'assets/images/4301083.jpg',
            fit: BoxFit.cover,
          ),
        )
      ]),
    );
  }
}
