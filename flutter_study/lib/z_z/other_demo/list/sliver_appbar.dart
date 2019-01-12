import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AJSliverAppbar extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


//提示程序提供状态混合
//TickerProviderStateMixin
class _MyHomePageState extends State<AJSliverAppbar> with TickerProviderStateMixin {
  final List<ListItem> listData = [];
  final List<ListItem> listData1 = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2,vsync: this);
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题${20-i}", Icons.cake));
      listData1.add(new ListItem("我是测试标题${i}", Icons.cake));
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("我是一个帅气的标题",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
                    fit: BoxFit.fill,
                  )),
            ),

            //滑动至顶端推上去
            SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.red,
                    tabs: [
                      Tab(icon: Icon(Icons.security), text: "security"),
                      Tab(icon: Icon(Icons.cake), text: "cake"),
                    ],

                  ),
                ),
//              pinned: true,
//              floating: true,
            )
          ];
        },
        body: Center(
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) {

              return new ListItemWidget(_tabController.index == 0 ? listData[index] : listData1[index]);
            },
            itemCount: _tabController.index == 0 ? listData.length : listData1.length,
          ),
        ),
      ),
    );;
  }

}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new ListTile(
        leading: new Icon(listItem.iconData),
        title: new Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}