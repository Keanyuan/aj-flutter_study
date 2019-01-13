// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDemo extends StatefulWidget {
  static const String routeName = '/cupertino/alert';

  @override
  _CupertinoAlertDemoState createState() => _CupertinoAlertDemoState();
}

class _CupertinoAlertDemoState extends State<CupertinoAlertDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _title = "CupertinoAlert";


  //显示dialog
  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      print('You selected: $value');
      setState(() {
        _title = 'You selected: $value';
      });

//      if (value != null) {
//        _scaffoldKey.currentState.showSnackBar(
//          SnackBar(
//            content: Text('You selected: $value'),
//          ),
//        );
//      }
    });
  }

  void showDemoActionSheet<T>({BuildContext context, Widget child}) {
    //底部弹出框
    showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      if (value != null) {

        setState(() {
          _title = 'You ActionSheet selected: $value';

        });
//        _scaffoldKey.currentState.showSnackBar(
//          SnackBar(
//            content: Text('You selected: $value'),
//          ),
//        );
      }
    });
  }
  //-------------
  _init(){
    if(tabImages == null ) {
      tabImages = [
        [
          getImagePath('images/home.png'),
          getImagePath('images/home_select.png')
        ],
        [
          getImagePath('images/new.png'),
          getImagePath('images/new_select.png')
        ],
        [
          getImagePath('images/me.png'),
          getImagePath('images/me_select.png')
        ],
      ];
    }

  }

  Image getImagePath(path) {
    return new Image.asset(path, width: 20.0, height: 20.0,);
  }
  var tabImages;//底部菜单栏数组
  var tabTitles = ['培训考试', '参考资料', '我的'];  //底部菜单文字

  List<BottomNavigationBarItem> getBottomNavigationBar() {
    List<BottomNavigationBarItem> list = new List();
    for(var i = 0;i < 3; i++ ) {
      list.add( new BottomNavigationBarItem(icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }
  Image getTabIcon(int currentIndex) {
    if(currentIndex == _tabIndex) {
      return tabImages[currentIndex][1];
    }else {
      return tabImages[currentIndex][0];
    }
  }
  Text getTabTitle(int currentIndex) {
    return new Text(
      tabTitles[currentIndex],
      style: getTextStyle(currentIndex),
    );
  }
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696),fontSize: 12.0);   // 正常情况的字体样式
  final tabTextStyleChoose = new TextStyle(color: Colors.blue,fontSize: 12.0);   //选中之后的样式
  TextStyle getTextStyle(int currentIndex) {
    if(currentIndex == _tabIndex ){
      return tabTextStyleChoose;
    }else {
      return tabTextStyleNormal;
    }
  }

  int _tabIndex = 0;  //默认选中第一个索引

  @override
  Widget build(BuildContext context) {
    var i = 1;
    if(i == 0){
      _init();
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: getBottomNavigationBar(),
            currentIndex: _tabIndex,
            onTap: (index){
              setState(() {
                _tabIndex = index;
              });
            }
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Page 1 of tab $index'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: const Text('Next page'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text('Page 2 of tab $index'),
                              ),
                              child: Center(
                                child: CupertinoButton(
                                  child: const Text('Back'),
                                  onPressed: () { Navigator.of(context).pop(); },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      );
    }


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: const Text("CupertinoAlert")
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 72.0),
        children: <Widget>[
          Text(_title),
          CupertinoButton(
            child: const Text('Alert'),
            color: CupertinoColors.activeBlue,
            onPressed: () {
              showDemoDialog<String>(
                context: context,
                child: CupertinoAlertDialog(
                  title: const Text('Discard draft?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('Discard'),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Discard');
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text('Cancel'),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          CupertinoButton(
            child: const Text('Alert with Title'),
            color: CupertinoColors.activeBlue,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDemoDialog<String>(
                context: context,
                child: CupertinoAlertDialog(
                  title: const Text('Allow "Maps" to access your location while you are using the app?'),
                  content: const Text('Your current location will be displayed on the map and used '
                      'for directions, nearby search results, and estimated travel times.'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('Don\'t Allow'),
                      onPressed: () {
                        Navigator.pop(context, 'Disallow');
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text('Allow'),
                      onPressed: () {
                        Navigator.pop(context, 'Allow');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          CupertinoButton(
            child: const Text('Alert with Buttons'),
            color: CupertinoColors.activeBlue,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDemoDialog<String>(
                context: context,
                child: const CupertinoDessertDialog(
                  title: Text('Select Favorite Dessert'),
                  content: Text('Please select your favorite type of dessert from the '
                      'list below. Your selection will be used to customize the suggested '
                      'list of eateries in your area.'),
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          CupertinoButton(
            child: const Text('Alert Buttons Only'),
            color: CupertinoColors.activeBlue,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDemoDialog<String>(
                context: context,
                child: const CupertinoDessertDialog(),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          CupertinoButton(
            child: const Text('Action Sheet'),
            color: CupertinoColors.activeBlue,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDemoActionSheet<String>(
                context: context,
                child: CupertinoActionSheet(
                    title: const Text('Favorite Dessert'),
                    message: const Text('Please select the best dessert from the options below.'),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: const Text('Profiteroles'),
                        onPressed: () {
                          Navigator.pop(context, 'Profiteroles');
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Cannolis'),
                        onPressed: () {
                          Navigator.pop(context, 'Cannolis');
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Trifle'),
                        onPressed: () {
                          Navigator.pop(context, 'Trifle');
                        },
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text('Cancel'),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                    )
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          CupertinoButton(
            child: const Text('ModalPopup'),
            color: CupertinoColors.activeBlue,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDemoActionSheet<String>(context: context, child: Container(
                padding: const EdgeInsets.only(bottom: 0.0, left: 0.0, right: 0.0),
                height: 200.0,
                color: Colors.red,
              ),);
            },
          ),
        ],
      ),
    );
  }
}

class CupertinoDessertDialog extends StatelessWidget {
  const CupertinoDessertDialog({Key key, this.title, this.content}) : super(key: key);

  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Cheesecake'),
          onPressed: () {
            Navigator.pop(context, 'Cheesecake');
          },
        ),
        CupertinoDialogAction(
          child: const Text('Tiramisu'),
          onPressed: () {
            Navigator.pop(context, 'Tiramisu');
          },
        ),
        CupertinoDialogAction(
          child: const Text('Apple Pie'),
          onPressed: () {
            Navigator.pop(context, 'Apple Pie');
          },
        ),
        CupertinoDialogAction(
          child: const Text("Devil's food cake"),
          onPressed: () {
            Navigator.pop(context, "Devil's food cake");
          },
        ),
        CupertinoDialogAction(
          child: const Text('Banana Split'),
          onPressed: () {
            Navigator.pop(context, 'Banana Split');
          },
        ),
        CupertinoDialogAction(
          child: const Text('Oatmeal Cookie'),
          onPressed: () {
            Navigator.pop(context, 'Oatmeal Cookies');
          },
        ),
        CupertinoDialogAction(
          child: const Text('Chocolate Brownie'),
          onPressed: () {
            Navigator.pop(context, 'Chocolate Brownies');
          },
        ),
        CupertinoDialogAction(
          child: const Text('Cancel'),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ],
    );
  }
}
