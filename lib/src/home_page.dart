import 'package:flutter/material.dart';
import 'package:news/src/blocs/search_provider.dart';
import 'package:news/src/blocs/welcome_provider.dart';
import 'package:news/src/cupertino_home_scaffold.dart';
import 'package:news/src/screens/favourites_page.dart';
import 'package:news/src/screens/news_list.dart';
import 'package:news/src/screens/people_page.dart';
import 'package:news/src/tab_item.dart';
import 'package:news/src/widgets/home/welcome.dart';
import 'package:news/src/widgets/search_bar/search_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.home;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.entries: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => NewsList(),
      TabItem.entries: (context) => WelcomeProvider(child: Welcome()),
      TabItem.account: (_) => SearchWidget()
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
