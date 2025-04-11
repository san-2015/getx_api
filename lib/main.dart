import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controllers/fav_controller.dart';
import 'package:getx_api/routes/route_name.dart';

void main() {
  Get.put(FavController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        // home: MyHomePage(),
        getPages: RouteName.routes);
  }
}
