
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luso_american_financial/helper/shared_preferences.dart';
import 'package:luso_american_financial/luso_american.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.initMySharedPreferences();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const LusoAmerican());
}










//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   runApp(const LusoAmerican());
// }
//
// class LusoAmerican extends StatelessWidget {
//   const LusoAmerican({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: GoogleMapDemo(),
//     );
//   }
// }
//
// class GoogleMapDemo extends StatefulWidget {
//   const GoogleMapDemo({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleMapDemo> createState() => _GoogleMapDemoState();
// }
//
// class _GoogleMapDemoState extends State<GoogleMapDemo> {
//   final Completer<GoogleMapController> _controller = Completer();
//   final CameraPosition _kLake = const CameraPosition(
//     // bearing: 192.8334901395799,
//     target: LatLng(21.2334238, 72.8650465),
//     tilt: 59.440717697143555,
//     zoom: 19.151926040649414,
//   );
//   final CameraPosition _kGooglePlex = const CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Google Map"),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//             child: GoogleMap(
//               mapType: MapType.hybrid,
//               initialCameraPosition: _kLake,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
//   }
// }