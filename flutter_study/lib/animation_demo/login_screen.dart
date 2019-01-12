import 'package:flutter/material.dart';
import 'package:flutter_study/z_z/other_demo/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController;
  TextEditingController _pwController;
  bool isloading = false;
  @override
  void initState() {

    _nameController = TextEditingController();
    _pwController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  Widget _buildTextField(TextEditingController controller,  String lableText, {bool obscureText = false,}){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: lableText,
//            filled: true,
//            fillColor: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HomeScreen")),
        body: SafeArea(
          child: Loading(
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 80.0,),
                  Center(child: Text("Login", style: TextStyle(fontSize: 32.0),),),
                  const SizedBox(height: 80.0,),
                  _buildTextField(_nameController, "name"),
                  _buildTextField(_pwController, "password"),
                  const SizedBox(height: 80.0,),
                  ButtonBar(children: <Widget>[
                    RaisedButton(onPressed: (){
                      setState(() {
                        isloading = true;
                      });
                      Future.delayed(Duration(seconds: 2)).then((v){
                        setState(() {
                          isloading = false;
                        });
                      });

                    }, child: Text("login"), color: Colors.red,),
                    RaisedButton(onPressed: (){}, child: Text("login"), color: Colors.blue,),
                    RaisedButton(onPressed: (){}, child: Text("login"), color: Colors.green,),
                  ],)
                ],
              ),
              isLoading: isloading
          ),
        )
    );
  }
}