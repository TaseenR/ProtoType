import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:prototype/main.dart';
//import 'package:prototype/screens/loading/loading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;
  String searchAddress = '';
  final LatLng _center = const LatLng(45.521563, -122.677433);
  static final CameraPosition _helper = CameraPosition(
    target: LatLng(45.521563, -122.677433),
    bearing: 192.833,
    zoom: 20.0,
  );
  static final Marker googlePlexMarker = Marker(
    markerId: MarkerId('_helper'),
    infoWindow: InfoWindow(title: 'Google plex'),
    position: LatLng(45.521563, -122.677433),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  searchAndNavigate() {
    locationFromAddress(searchAddress).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10,
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: {googlePlexMarker},
            ),
            Positioned(
                top: 30.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15.0, left: 15.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: searchAndNavigate,
                        iconSize: 30.0,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        searchAddress = val;
                      });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
