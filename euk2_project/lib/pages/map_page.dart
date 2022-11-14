import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

///AppBar of the More Screen.
AppBar? mapAppBar = AppBar(
  title: const Text('Mapa'),
);

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> markers = Set();

  ///zobrazení aktuální pozice uživatele
  Future<void> getCurrentLocation() async {
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
            zoom: 12.0,
          ),
        ),
      );
    });
  }

  final MapType _currentMapType = MapType.normal;

  void getMarkers() {
    markers.add(
      const Marker(
        markerId: MarkerId("Místo 3"),
        position: LatLng(49.8758258, 17.8759750),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Nemocnice F-M',
          snippet: 'Toalety',
        ),
        icon: BitmapDescriptor.defaultMarker,
        //icon: markerbitmap, //Icon for Marker
      ),
    );

    markers.add(
      const Marker(
        markerId: MarkerId("Místo 1"),
        position: LatLng(49.9337922, 17.8793431),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Nemocnice F-M',
          snippet: 'Toalety',
        ),
        icon: BitmapDescriptor.defaultMarker,
        // icon: markerbitmap, //Icon for Marker
      ),
    );

    markers.add(
      const Marker(
        markerId: MarkerId("Místo 2"),
        position: LatLng(49.8701600, 17.8791761),
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Hypermarket Kaufland',
          snippet: 'WC',
        ),
      ),
    );
  }

  @override
  void initState() {
    //addMarkers();

    setState(() {
      getMarkers();
      getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 12.0,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        mapType: _currentMapType,
      ),
    );
  }
}
