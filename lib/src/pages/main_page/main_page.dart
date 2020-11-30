import 'package:felix_core/src/pages/main_page/cupertino_main_scaffold.dart';
import 'package:felix_core/src/pages/main_page/tab_item.dart';
import 'package:felix_core/src/pages/main_page/tabs/chat.dart';
import 'package:felix_core/src/pages/main_page/tabs/events.dart';
import 'package:felix_core/src/pages/main_page/tabs/home.dart';
import 'package:felix_core/src/pages/main_page/tabs/profile.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabItem _currentTab = TabItem.home;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      // home chat events student
      TabItem.home: (_) => HomeTab(),
      TabItem.chat: (_) => ChatTab(),
      TabItem.events: (_) => EventsTab(),
      TabItem.student: (_) => ProfileTab(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoMainScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
