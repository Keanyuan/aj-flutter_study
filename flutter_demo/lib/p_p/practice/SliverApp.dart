

import 'package:flutter/material.dart';
import '../practice/NavigationIconView.dart';

class SliverApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SliverAppState();
  }
}

class _SliverAppState extends State<SliverApp> with TickerProviderStateMixin{

  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();

    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: const Icon(Icons.access_alarm),
        title: 'Alarm',
        color: Colors.deepPurple,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: CustomIcon(),
        icon: CustomInactiveIcon(),
        title: 'Box',
        color: Colors.deepOrange,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.cloud),
        icon: const Icon(Icons.cloud_queue),
        title: 'Cloud',
        color: Colors.teal,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.favorite),
        icon: const Icon(Icons.favorite_border),
        title: 'Favorites',
        color: Colors.indigo,
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(Icons.event_available),
        title: 'Event',
        color: Colors.pink,
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;

  }
  Widget _buildAssetsWidget(context){
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions.add(view.transition(_type, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });
    return Center(child: Stack(children: transitions),);
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }



  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews.map<BottomNavigationBarItem>((NavigationIconView navigationView){
        return navigationView.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index){
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

//    final controller = PageController(
//      initialPage: 1,
//    );
//    final pageView = PageView(
//      controller: controller,
//      scrollDirection: Axis.vertical,
//      children: <Widget>[
//        Container(),
//        Container(),
//      ],);

    //table
    final tabel = Table(
      //周边装饰
      border: TableBorder.all(),
      columnWidths: {1: FractionColumnWidth(0.2)},
      //水平相对宽度
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,

//      defaultColumnWidth: FixedColumnWidth(30.0),
      defaultColumnWidth: IntrinsicColumnWidth(),
      children: [
        TableRow(children: [
          Container(),
          Container(),
          Container()
        ]),
        TableRow(children: [
          Container(),
          Container(),
          Container()
        ])
      ],
    );


    final sliversAppBar = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.blue,
          title: Text("SliverAppBar", style: TextStyle(color: Colors.white),),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(background: Container(margin: EdgeInsets.only(top: 60.0), child: Image.asset("images/lake.jpg",),),),
          //是否浮动
          floating: false,
          //是否固定
          pinned: true,
        ),
        SliverList(delegate: SliverChildListDelegate([
          Container(width: double.infinity, height: 400.0, color: Colors.green,),
          Container(width: double.infinity, height: 400.0, color: Colors.blue,),
          Container(width: double.infinity, height: 400.0, color: Colors.red,),
        ])),
      ],
    );

    final sliversAppBar1 = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text("SliverAppBar", style: TextStyle(color: Colors.blue),),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(background: Container(margin: EdgeInsets.only(top: 60.0), child: Image.asset("images/home_logo.png"),),),
          //是否浮动
          floating: false,
          //是否固定
          pinned: true,
        ),
        SliverList(delegate: SliverChildBuilderDelegate((
                (BuildContext context, int index){
              return SliverGrid.count(
                crossAxisCount: 4,
                children: <Widget>[
                  Container(color: Colors.red,),
                ],
              );
            }), childCount: 3)),
      ],
    );

    final stake = Stack(
      children: <Widget>[
        Container(color: Colors.green,),
        Opacity(
          opacity: 0.24,
          child: Container(color: Colors.red,),
        ),
        AnimatedOpacity(
          opacity: 0.4,
          duration: Duration(microseconds: 3000),
          child: Container(color: Colors.blue,),)
      ],
    );




    return Scaffold(
      key: _scaffoldKey,
      body: sliversAppBar,
    );




    //底部tabbar
    return new Scaffold(
      appBar: AppBar(title: Text("hhh")),
      body: _buildAssetsWidget(context),
      bottomNavigationBar: bottomNavigationBar,
    );


    //Opacity 透明度   AnimatedOpacity带动画透明度
    return Scaffold(
      key: _scaffoldKey,
      body: stake,
    );

    return Scaffold(
      key: _scaffoldKey,
      body: AnimatedContainer(
        color: Colors.red,
        child: new Container(),
        curve: Curves.bounceIn,
        duration: Duration(milliseconds: 100),
      ),
    );


  }
}