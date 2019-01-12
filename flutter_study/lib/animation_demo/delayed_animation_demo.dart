import 'package:flutter/material.dart';

/*
* 延迟动画
* */

class DelayedAnimationDemo extends StatefulWidget {
  @override
  State createState() => DelayedAnimationDemoState();
}

class DelayedAnimationDemoState extends State<DelayedAnimationDemo> with SingleTickerProviderStateMixin {

  TextEditingController _nameController, _pwController;

  Animation _animationTitle, _animationTextField, _animationButton;
  AnimationController _animationController;

  @override
  void initState() {

    _nameController = TextEditingController();
    _pwController = TextEditingController();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2, milliseconds: 50));
    _animationTitle = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationTextField = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn)));
    _animationButton = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn)));
    _animationController.forward();

    super.initState();
  }


  Widget _buildTextField(
      TextEditingController controller, bool obscureText, String labelText, double width) {
    return Transform(
      transform: Matrix4.translationValues(_animationTextField.value * width, 0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
//              filled: true,
              labelText: labelText,
//              fillColor: Colors.white
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: _animationController, builder: (BuildContext context, Widget child){
      return Scaffold(
        appBar: AppBar(title: Text("HomeScreen")),
        body: SafeArea(child: ListView(
          children: <Widget>[
            const SizedBox(height: 80.0),
            Transform(
              transform: Matrix4.translationValues(_animationTitle.value * width, 0.0, 0.0),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            const SizedBox(height: 40.0),
            _buildTextField(_nameController, false, "name", width),
            const SizedBox(height: 40.0),
            _buildTextField(_pwController, true, "password", width),
            const SizedBox(height: 40.0),
            Transform(
                transform: Matrix4.translationValues(
                    _animationButton.value * width, 0.0, 0.0),
                child: ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Text('login'),
                      color: Colors.white,
                    )
                  ],
                )),
          ],
        )),
      );
    });
  }

}