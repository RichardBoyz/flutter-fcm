import 'package:flutteriosfcm/screens/home/index.dart';
import 'package:flutteriosfcm/screens/list/index.dart';
import 'package:flutteriosfcm/screens/list_detail/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
      children: [
        GetPage(
          name: AppRoutes.List,
          page: () => const ListPage(),
          children: [
            GetPage(
              name: AppRoutes.Detail,
              page: () => const DetailView(),
            ),
          ],
        ),
      ],
    )
  ];
}
