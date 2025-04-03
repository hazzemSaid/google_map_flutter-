import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class googlemapwidget extends StatefulWidget {
  const googlemapwidget({super.key});

  @override
  State<googlemapwidget> createState() => _googlemapwidgetState();
}

class _googlemapwidgetState extends State<googlemapwidget> {
  late GoogleMapController mapController;
  Uint8List image = Uint8List(0);
  Set<Marker> markers = {};
  @override
  void initstyle() async {
    String mapstyle = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/WYstyle.json');
    mapController.setMapStyle(mapstyle);
    image = await function("assets/images/marker.png", 40);
    markers = {
      Marker(
        infoWindow: InfoWindow(title: "hello id", snippet: "hello world"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        markerId: MarkerId('1'),
        position: LatLng(30.602058784166292, 32.260417069270844),
      ),
      Marker(
        infoWindow: InfoWindow(title: "hello id", snippet: "hello world"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        markerId: MarkerId('2'),
        position: LatLng(30.502058784166292, 32.260417069270844),
      ),
      Marker(
        infoWindow: InfoWindow(title: "hello id", snippet: "hello world"),
        icon: BitmapDescriptor.bytes(image),
        markerId: MarkerId('3'),
        position: LatLng(30.502058784166292, 32.360417069270844),
      ),
    };
    setState(() {});
  }

  Future<Uint8List> function(String image, int width) async {
    var imageByteData = await rootBundle.load(image);
    var imagecodec = await ui.instantiateImageCodec(
      imageByteData.buffer.asUint8List(),
      targetWidth: width,
    );
    var imageInfo = await imagecodec.getNextFrame();
    var byteData = await imageInfo.image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    var pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          // mapType: MapType.hybrid,
          onMapCreated: (controller) {
            mapController = controller;
            initstyle();
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(30.602058784166292, 32.260417069270844),
            zoom: 13,
          ),
        ),
        // Positioned(
        //   bottom: 20,
        //   right: 20,

        //   child: FloatingActionButton(
        //     onPressed: () {
        //       setState(() {
        //         mapController.animateCamera(
        //           duration: Duration(seconds: 2),
        //           CameraUpdate.newLatLng(
        //             LatLng(30.602058784166292, 12.260417069270844),
        //           ),
        //         );
        //       });
        //     },
        //     child: Icon(Icons.location_searching),
        //   ),
        // ),
      ],
    );
  }
}
