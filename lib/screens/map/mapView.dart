import 'dart:convert';

import 'package:appentus_task/controllers/mapController.dart';
import 'package:appentus_task/controllers/userController.dart';
import 'package:appentus_task/screens/grid/gridScreen.dart';
import 'package:appentus_task/widgets/circleContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final mapController = Get.put(MapController());
  final uc = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            CircleContainer(
              height: 46,
              child: uc.user.image!.isNotEmpty
                  ? Image.memory(
                      base64Decode(
                        uc.user.image!,
                      ),
                      fit: BoxFit.fill)
                  : Image.asset(
                      "assets/placeImage.png",
                      fit: BoxFit.fill,
                    ),
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text('${uc.user.name}', style: TextStyle()),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              uc.logout();
            },
            child: Text('Logout', style: TextStyle()),
          )
        ],
      ),
      body: GetBuilder(
        builder: (MapController controller) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(26.9124, 75.7873),
                zoom: 12.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController.controller = controller;
              },
              markers: mapController.markers,
              myLocationEnabled: true,
            ),
          );
        },
        initState: (s) {
          mapController.getLocation();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: () {
          mapController.goToNextScreen();
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => GridScreen()));
        },
      ),
    );
  }
}
