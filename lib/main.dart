
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_flutter_riverpod/common/routes/routes.dart';
import 'package:ulearning_flutter_riverpod/common/services/http_util.dart';
import 'package:ulearning_flutter_riverpod/common/utils/app_styles.dart';
import 'global.dart';
Future<void> main() async {
  await Global.init();
  var obj1 = HttpUtil();
  var obj2 = HttpUtil();
  if (obj1.hashCode == obj2.hashCode) {
    print("I am a singleton class");
    //   await HttpUtil().post("login", queryParameters: {
    //     'email': "pinku.subhasish@gmail.com",
    //     'password': "123456",
    //   });
    // }

    // await HttpUtil().post("register", queryParameters: {
    //   'name': "pinku",
    //   'email': "pinku1.subhasish@gmail.com",
    //   'password': "123456",
    //   'avatar': "xyz.com",
    //   'type': 2,
    //   'open_id': "uisiueihx xs",
    //   'phone': "9163757468",
    //   'updated_at' : "05-06-2024"
    // });
  }
  runApp(const ProviderScope(child: MyApp()));
}
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
              navigatorKey: navKey,
              title: 'Flutter Demo',
              theme: AppTheme.appThemeData,
              onGenerateRoute: AppPages.generateRouteSettings,
            ));
  }
}

final appCount = StateProvider<int>((ref) {
  return 3;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Riverpod app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: () => navRoute(),
            tooltip: 'Increment',
            child: Icon(Icons.arrow_right_rounded),
          ),
          const FloatingActionButton(
            heroTag: "one",
            onPressed: myTap,
            tooltip: 'Increment',
            child: Icon(Icons.arrow_right_rounded),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void myTap() {
  print("I am tapped");
}

void navRoute() {
  //do what you like here
}

class SecondPage extends ConsumerWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$count",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
