import 'package:flutter/material.dart';
import 'package:registrationDemo/models/registration.dart';
import 'package:registrationDemo/utils/database_helper.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';


class HomeScreen extends StatefulWidget {
  final Registration registration;
  HomeScreen({this.registration});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreeenState(this.registration);
  }
}

class _HomeScreeenState extends State<HomeScreen> {
  String name;
  String address;
  String state;
  String country;
  String hobby;
  String dob;
  String image;

  DatabaseHelper helper = DatabaseHelper();

  _HomeScreeenState(Registration registration);

  Position _currentPosition;
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }



  Future _selectDate() async {
    DateTime picked =  await showDatePicker(context: context, initialDate: new DateTime.now(), firstDate: new DateTime(1990), lastDate: new DateTime(2021));
    if(picked != null) {
      setState(() {
        dob = picked.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Registration registration;
    int result;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text("Registration"),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => {name = value},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.home),
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => {name = value},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => {state = value},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => {country = value},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Hobby',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => {hobby = value},
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.email),
            //       labelText: 'Date Of Birth',
            //       border: OutlineInputBorder(),
            //     ),
                
            //     onChanged: (value) => {dob = value},
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child:Row(children: <Widget>[
                Text("Select DOB"),
                RaisedButton( child : Text("Date Picker") , onPressed :()=> _selectDate(),),
                Text(dob),
              ],)
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: MaterialButton(
                  child: Text("Submit"),
                  onPressed: () async => {
                        await helper
                            .insertUser(new Registration(name, address, state,
                                country, hobby, dob, image))
                            .then((value) => print(value))
                      }),
            ),
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
