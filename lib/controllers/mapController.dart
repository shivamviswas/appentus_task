


import 'package:appentus_task/screens/grid/gridScreen.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController{


  GoogleMapController? controller;
  Location currentLocation = Location();
  Set<Marker> markers={};

  void getLocation() async{
    //var loc = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){

      controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 16.0,
      )));
      markers.clear();
      markers.add(Marker(markerId: MarkerId('Your Location'),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
      ));
      update();
    });
  }


  goToNextScreen(){
    markers.clear();
    controller!.dispose();
  }


  @override
  void onClose() {
    super.onClose();
    print("============ = = =  = = Close ");
    markers.clear();
    controller!.dispose();
  }
}