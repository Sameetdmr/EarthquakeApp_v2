class App_Constants {
  static App_Constants? _instance;

  static App_Constants get instance {
    return _instance ??= App_Constants._init();
  }

  App_Constants._init();

  //Lottie Path
  static const LOTTIE_PATH_SPLASH_LOADING = "assets/lottie/earthquake_animation.json";
}
