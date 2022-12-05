import 'package:depremapp/ui/components/CustomAppBar.dart';
import 'package:depremapp/ui/home/HomePageViewModel.dart';
import 'package:depremapp/ui/maps/MapsPage.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:depremapp/utils/theme/CustomTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants/App_Constants.dart';
import '../../utils/theme/colors/ColorSchemeLight.dart';
import '../components/CustomLottie.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _homePageViewModel = Get.put(HomePageViewModel());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Depremler',
        rightIcon: Icon(Icons.refresh),
        onpressed: () {
          _homePageViewModel.getDeprem();
        },
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
            : Center(child: CustomLottie(lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING)),
      ),
    );
  }

  Widget _buildCardWidget(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.02.sh, vertical: 0.02.sw),
      child: GestureDetector(
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
              style: CustomTextTheme.instance.cardTitleText,
            ),
            subtitle: Text(
              _homePageViewModel.eartQuakePM.value.dateList![index],
              style: CustomTextTheme.instance.boldSubtitleText.copyWith(color: Colors.grey.shade700),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_homePageViewModel.eartQuakePM.value.magList![index].toString(), style: CustomTextTheme.instance.boldCardLeadingText.copyWith(color: _homePageViewModel.eartQuakePM.value.colorList![index])),
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
