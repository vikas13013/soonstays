import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soonstays/app/data/binding/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'core/services/connectivity_service.dart';
import 'core/widgets/common_internet_banner.dart';
import 'core/widgets/common_loader.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  ///Connectivity Service Register
  await Get.putAsync(
        () => ConnectivityService().init(),
  );

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
      builder: (context, child) {

        final easyLoading = EasyLoading.init();

        return Stack(
          children: [

            easyLoading(
              context,
              child,
            ),

            const InternetBanner(),

          ],
        );
      },
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding()   ,
    );
  }
}
