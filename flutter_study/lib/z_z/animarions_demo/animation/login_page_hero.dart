import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  bool isLogin=false;

  onLoginClick(){
    Future.delayed(Duration(seconds: 2), () {
//      Navigator.of(context).push(
//          new MaterialPageRoute<Null>(
//              builder: (BuildContext context) {
//                return HomePage();
//              }));

      Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder:
            (BuildContext context, _, __) {
          return new HomePage();
        },
      ));
      isLogin=false;
    });
    setState(() {
      isLogin=true;

    });
  }
  @override
  void dispose() {
    super.dispose();
    isLogin=false;
  }
  @override
  Widget build(BuildContext context) {
    var loginButtonWidegt;
    if(isLogin) {
      AnimationController animationController=new AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
      Animation<Color> animation=new Tween(begin: Colors.white,end:Colors.black).animate(animationController);
      loginButtonWidegt =CircularProgressIndicator(backgroundColor: Colors.white,valueColor: animation,);
    }else{
      loginButtonWidegt = Text(
          '登录', style: TextStyle(color: Colors.white));
    }
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/item2.png'),
      ),
    );

    final userName = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '请输入用户名',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: '请输入密码',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
//        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: onLoginClick,
          color: Colors.lightBlueAccent,
          child:loginButtonWidegt,
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        '忘记密码?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final backBtn = new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 40.0,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(height: 48.0),
          backBtn,
          SizedBox(height: 80.0),
          logo,
          SizedBox(height: 48.0),
          userName,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 24.0),
          loginButton,
          forgotLabel
        ],
      ),
    );
  }
}



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final backBtn = new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 40.0,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ],
    );

    final logo = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/item2.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Flutter',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[SizedBox(height: 10.0,),backBtn,logo, welcome, text],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}