import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapSample extends StatefulWidget {
  const GoogleMapSample({super.key});

  @override
  State<GoogleMapSample> createState() => _GoogleMapSampleState();
}

class _GoogleMapSampleState extends State<GoogleMapSample> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(10.2556961, 105.9667101);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId('Vĩnh Long'),
              position: const LatLng(10.2556961, 105.9667101),
              infoWindow: InfoWindow(
                title: "Quảng trường tp Vĩnh Long",

              ),
            ),
          },
        ),
      ),
    );
  }
}