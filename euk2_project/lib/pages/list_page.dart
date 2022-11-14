import 'package:euk2_project/locations/location_data_test.dart';
import 'package:euk2_project/locations/test_locations.dart';
import 'package:flutter/material.dart';

//const int itemCount = 20;

///AppBar of the List Screen.
AppBar listAppBar = AppBar(
  title: const Text("List"),
);


class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: testDestinations.length,
        itemBuilder: buildListItem,
      ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
        TestLocationData data = testDestinations[index];

        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(data.address),
            subtitle: Text('${data.city}, ${data.ZIP}'),
            leading: getIconByType(data.type),
            trailing: const Icon(Icons.navigate_next),
          ),
        );
      }
}
