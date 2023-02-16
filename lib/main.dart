import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Map App',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Map Application'),
      ),
      body: FlutterMap(
        options: MapOptions(
          minZoom: 10.0,
          center: LatLng(40.71, -74.00),
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(40.73, -74.00),
                builder: (context) => GestureDetector(
                  child: const Icon(
                    Icons.accessibility,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    print('Marker tapped!');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ));
}

TileLayerOptions({required String urlTemplate, required List<String> subdomains}) {}

MarkerLayerOptions({required List<Marker> markers}) {}
