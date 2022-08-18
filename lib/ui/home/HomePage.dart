import 'package:depremapp/ui/home/HomePageViewModel.dart';
import 'package:depremapp/ui/maps/MapsPage.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/theme/colors/ColorSchemeLight.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _homePageViewModel = Get.put(HomePageViewModel());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Depremler',
          style: TextStyle(color: Colors.black, fontSize: 24.sp),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Obx(
        () => _homePageViewModel.isLoading.value
            ? ListView.separated(
                itemCount: _homePageViewModel.eartQuakePM.value.titleList!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: ColorSchemeLight.instance.dusk40Color,
                  );
                },
                itemBuilder: (context, index) {
                  return _buildCardWidget(index);
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildCardWidget(int index) {
    return GestureDetector(
      onTap: () {
        CustomNavigator().pushToMain(MapsPage(
          index: index,
        ));
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: ListTile(
          title: Text(
            _homePageViewModel.eartQuakePM.value.titleList![index],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          subtitle: Text(
            _homePageViewModel.eartQuakePM.value.dateList![index],
            style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w300, fontSize: 14.sp),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_homePageViewModel.eartQuakePM.value.magList![index].toString(), style: TextStyle(color: _homePageViewModel.eartQuakePM.value.colorList![index], fontSize: 24.sp, fontWeight: FontWeight.w800)),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
