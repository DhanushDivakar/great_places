import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

//this is the first screen of the app
class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
          builder:(ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) : Consumer<GreatPlaces>(
            child: Center(
              child: const Text("Got no places yet start adding some"),
            ),
            builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                ? ch
                : ListView.builder(
                    itemCount: greatPlaces.items.length,
                    itemBuilder: (ctx, i) => ListTile(
                      leading: CircleAvatar(backgroundImage: FileImage(greatPlaces.items[i].image),),
                      title: Text(greatPlaces.items[i].title),
                      onTap: () {},
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
