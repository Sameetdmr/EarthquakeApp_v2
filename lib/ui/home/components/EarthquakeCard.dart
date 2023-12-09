import 'package:depremapp/ui/maps/MapsPage.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:depremapp/utils/theme/CustomTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarthquakeCard extends StatelessWidget {
  final String title;
  final String date;
  final double latitude;
  final double longitude;
  final double mag;
  final Color magColor;
  const EarthquakeCard({
    Key? key,
    required this.title,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.mag,
    required this.magColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.02.sh, vertical: 0.02.sw),
      child: GestureDetector(
        onTap: () {
          CustomNavigator().pushToMain(MapsPage(
            title: title,
            latitude: latitude,
            longitude: longitude,
          ));
        },
        child: Card(
          color: Colors.white,
          elevation: 4,
          child: ListTile(
            title: Text(
              title,
              style: CustomTextTheme.instance.cardTitleText,
            ),
            subtitle: Text(
              date,
              style: CustomTextTheme.instance.boldSubtitleText.copyWith(color: Colors.grey.shade700),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(mag.toString(), style: CustomTextTheme.instance.boldCardLeadingText.copyWith(color: magColor)),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
