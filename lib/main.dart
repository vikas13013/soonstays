import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soonstays/app/data/binding/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'core/widgets/common_loader.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  ///Initiate Easy Loader
  Loading().configEasyLoading();

  ///Initiate Get Storage
  GetStorage.init();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Soon Stays',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding()   ,
    );
  }
}
