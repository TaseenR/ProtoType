import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:prototype/main.dart';
//import 'package:prototype/screens/loading/loading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prototype/screens/authenticate/auth.dart';
import 'package:prototype/screens/maps/tfl.dart';
import 'package:tfl_api_client/tfl_api_client.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final AuthService _auth = AuthService();

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
    position: LatLng(51.5072, 0.1276),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  searchAndNavigate() {
    locationFromAddress(searchAddress).then((result) {
      returnListOfBikes();
      makeMarker(result[0].latitude, result[0].longitude);
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10,
      )));
    });
  }

  Future<List<Place>> x = returnAll();
  List<Marker> list = [googlePlexMarker];

  makeMarker(lon, lan) {
    list.add(Marker(
      markerId: MarkerId('' + lon.toString() + lan.toString()),
      infoWindow: InfoWindow(title: '' + lon.toString() + lan.toString()),
      position: LatLng(lon, lan),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));
  }

  returnListOfBikes() {
    x.then((result) {
      for (var i = 0; i < 30; i++) {
        list.add(Marker(
          markerId: MarkerId(
              '' + result[i].lat.toString() + result[i].lon.toString()),
          infoWindow: InfoWindow(
              title: '' + result[i].lat.toString() + result[i].lon.toString()),
          position: LatLng(result[i].lat!, result[i].lon!),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.black45,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  setState(() {});
                },
                icon: Icon(Icons.logout),
                label: Text('Log Out'))
          ],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: Set<Marker>.of(list),
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
