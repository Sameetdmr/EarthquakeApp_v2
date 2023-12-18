import 'package:depremapp/ui/maps/MapsPage.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EarthquakeCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final double latitude;
  final double longitude;
  final String mag;
  final Color magColor;
  final String depth;
  const EarthquakeCard({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.latitude,
    required this.longitude,
    required this.mag,
    required this.magColor,
    required this.depth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigator().pushToMain(MapsPage(
          title: title,
          latitude: latitude,
          longitude: longitude,
          dateTime: dateTime,
          depth: depth,
          magColor: magColor,
          mag: mag,
        ));
      },
      child: Card(
        child: ListTile(
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: context.general.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            dateTime,
            style: context.general.textTheme.bodySmall,
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mag,
                style: context.general.textTheme.titleLarge?.copyWith(color: magColor),
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
