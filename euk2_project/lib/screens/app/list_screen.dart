import 'package:euk2_project/blocs/location_management_bloc/location_management_bloc.dart';
import 'package:euk2_project/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:euk2_project/features/icon_management/icon_manager.dart';
import 'package:euk2_project/features/location_data/data/euk_location_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

///The screen that shows the list of all EUK Locations.
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget _buildListTile(BuildContext context, int index) {
    final EUKLocationData data = context.read<LocationManagementBloc>().locationManager.locations[index];
    return ListTile(
      title: Text(data.address),
      subtitle: Text('${data.city}, ${data.ZIP}'),
      trailing: getIconByType(data.type),
      onTap: () => context.read<LocationManagementBloc>().add(OnFocusOnLocation(LatLng(data.lat, data.long), zoom: 15)),
    );
  }
}

///The AppBar for the List Screen.
class AppBarListScreen extends StatelessWidget {
  const AppBarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('List lokací'),
      centerTitle: true,
    );
  }
}

