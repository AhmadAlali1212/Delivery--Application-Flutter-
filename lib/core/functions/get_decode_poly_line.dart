import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

Set<Polyline> polyLineSet = {};

Future<Set<Polyline>> getDecodePolyLine(
  double lat,
  double long,
  double descLat,
  double descLong,
) async {
  polyLineSet.clear();

  const apiKey = '';

  List<LatLng> polyLineCo = [];

  final url = Uri.parse(
    'https://maps.googleapis.com/maps/api/directions/json'
    '?origin=$lat,$long'
    '&destination=$descLat,$descLong'
    '&mode=driving'
    '&key=$apiKey',
  );

  final response = await http.get(url);
  final responseBody = jsonDecode(response.body);

  print('Directions status: ${responseBody['status']}');

  if (responseBody['status'] != 'OK') {
    print(
      'Directions API failed: '
      '${responseBody['status']} - '
      '${responseBody['error_message'] ?? ''}',
    );

    polyLineCo.add(LatLng(lat, long));
    polyLineCo.add(LatLng(descLat, descLong));
  } else {
    final routes = responseBody['routes'] as List;

    if (routes.isNotEmpty) {
      for (var leg in routes[0]['legs']) {
        for (var step in leg['steps']) {
          String polyline = step['polyline']['points'];

          List<PointLatLng> decoded = PolylinePoints.decodePolyline(polyline);

          for (var p in decoded) {
            polyLineCo.add(LatLng(p.latitude, p.longitude));
          }
        }
      }
    }
  }

  polyLineSet.add(
    Polyline(
      polylineId: const PolylineId('route_polyline'),
      color: const Color.fromARGB(255, 37, 129, 209),
      width: 6,
      points: polyLineCo,
    ),
  );

  print('Polyline points count: ${polyLineCo.length}');

  return polyLineSet;
}
