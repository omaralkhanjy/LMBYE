import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:letmeyoureyes/screens/mainPage.dart';
import 'package:location/location.dart';
import 'package:letmeyoureyes/constants/colors.dart';

// import 'package:untitled5/const.dart';
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  static const String google_api_key =
      "AIzaSyBwLf2rF4gL2FaWaHgmLI0FmzXzGWWcUDE";
  List<LatLng> PolylineCoordinates = [];
  LocationData? currentLocation;
  void getCurrentLocation() {
    Location location = Location();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
      "$google_api_key",
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) =>
            PolylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map page"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                MainColors.secondColor,
                MainColors.primaryColor
              ])),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  const Text('Drawer Header'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "volume of sound",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Slider(
                      value: MainPage().volumeOfSound,
                      onChanged: (value) {
                        setState(() {
                          if (MainPage().volumeOfSound > 10)
                            MainPage().volumeOfSound = 0.1;
                          MainPage().volumeOfSound = value;
                        });
                      })
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body:
          // currentLocation == null
          //     ? const Center(child: Text("loading"))
          //     :
          Container(
        margin: const EdgeInsets.only(top: 0),

        decoration: BoxDecoration(
            border: Border.all(color: MainColors.primaryColor, width: 4),
            borderRadius: BorderRadius.circular(10)),
        // child: GoogleMap(
        //   initialCameraPosition:
        //       CameraPosition(target: sourceLocation, zoom: 13.5),
        //   polylines: {
        //     Polyline(
        //       polylineId: const PolylineId("rout"),
        //       points: PolylineCoordinates,
        //       color: MainColors.primaryColor,
        //       width: 6,
        //     ),
        //   },
        //   markers: {
        //     const Marker(
        //       markerId: MarkerId("Source"),
        //       position: sourceLocation,
        //     ),
        //     const Marker(
        //       markerId: MarkerId("Destination"),
        //       position: destination,
        //     ),
        //   },
        // ),
      ),
    );
  }
}
