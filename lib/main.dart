import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wan/global_store/state.dart';
import 'package:flutter_wan/global_store/store.dart';
import 'package:flutter_wan/home_page/page.dart';
import 'package:flutter_wan/localization/CustomLocalizations.dart';
import 'package:flutter_wan/localization/CustomLocalizationsDelegate.dart';
import 'package:flutter_wan/other_page/ScaffoldRoute.dart';
import 'package:flutter_wan/other_page/webview_page/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context, nullOk: true);
    // print("languageCode: "+ myLocale.languageCode);

    return MaterialApp(
      //国际化设置
      localizationsDelegates: [
        CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CN'),

      ],
      // locale: Localizations.localeOf(context, nullOk: true),
      // locale: const Locale('zh', 'CN'),

      title: "wan",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        
      ),
      // home: ScaffoldRoute(),
      home: createApp(),
    );
  }

  
}

Widget createApp() {
   //PageRoutes 是 fish_redux 提供的基本路由API，每个 page 都有独立的 store
  final AbstractRoutes routes = PageRoutes(
    //注册应用的页面 '' 、 ''
    pages: <String, Page<Object, dynamic>>{
      'home': HomePage(),
      'web_view': WebviewPage(),
    },
    visitor:(String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if(page.isTypeof<GlobalBaseState>()) {
        //页面 连接 global store，即是下面的 app store
        //第一个参数 app store
        //第二个参数 appstore的state变化时，page的state如何变化
        page.connectExtraStore<GlobalState>(GlobalStore.store, (Object pagestate, GlobalState appState) {
          final GlobalBaseState p = pagestate;
          if(pagestate is Cloneable) {
             final Object copy = pagestate.clone();
             final GlobalBaseState newState = copy;

             if(p.themeColor != appState.themeColor) {
              newState.themeColor = appState.themeColor;
             }
             return newState;
          }

          return pagestate;
        });
      }

      //AOP，面向切面编程，主要作用是在不影响原有逻辑的基础上，增添一些常用的功能（比如打印日志、安全检查）。与业务逻辑解耦合，无侵入性。
      page.enhancer.append(
        //view AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        //Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>(),
        ],

        //effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        //Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ]
      );

    }
  );

  return MaterialApp(
    title: 'fish_redux_wan',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    //主页显示的page，根据'home'在routes中找到相应的page
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if(logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          println('${logic.runtimeType} ${action.type.toString()}');
        }
        return effect ?. call(action, ctx);
      };
    };
  };
}