import 'package:flutter/material.dart';

enum TabItem { home, chat, events, student }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(title: '', icon: Icons.home),
    TabItem.chat: TabItemData(title: '', icon: Icons.chat),
    TabItem.events: TabItemData(title: '', icon: Icons.calendar_today),
    TabItem.student: TabItemData(title: '', icon: Icons.school),
  };
}
