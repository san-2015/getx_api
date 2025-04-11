import 'package:get/get.dart';

import '../views/content_page.dart';
import '../views/my_detail_page.dart';
import '../views/my_home_page.dart';

class RouteName {
  // static -it belongs to class not the instance.optimization
  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String detailPage = "/detail-page";
  static const String contentPage = "/content-page";

  static String getInitial() => initial;
  //passing the as query parameter
  static String getDetailPage(int id) => "$detailPage?id=$id";
  static String getContentPage() => contentPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MyHomePage()),
    GetPage(name: contentPage, page: () => ContentPage()),
    GetPage(name: detailPage, page: () => DetailPage()),
  ];
}
