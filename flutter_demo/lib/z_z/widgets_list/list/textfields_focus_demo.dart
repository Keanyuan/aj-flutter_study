import 'package:flutter/cupertino.dart';

/**
 * 实现原理：
 * 使用FocusNode获取当前textField焦点
 * 在TextNode的textInputAction属性中选择键盘action（next/down）
 * 对于最后一个之前的TextField：在onSubmitted属性中解除当前focus状态
 * 再聚焦下一个FocusNode:FocusScope.of(context).requestFocus( nextFocusNode );
 * 对于最后一个TextField,直接解除focus并提交表单
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldFocusDemo extends StatefulWidget {
  @override
  State createState() => TextFieldFocusDemoState();
}

class TextFieldFocusDemoState extends State<TextFieldFocusDemo> {
  TextEditingController _nameController, _pwController;
  FocusNode _nameFocus, _pwFocus;
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
    _nameFocus = FocusNode();
    _pwFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height: 60.0),
            Material(
              borderRadius: BorderRadius.circular(10.0),
              child: TextField(
                focusNode: _nameFocus,
                //控制键盘keyboardType
                keyboardType: TextInputType.multiline,
                controller: _nameController,
                //控制器，控制TextField文字
                obscureText: false,
                ////是否隐藏输入
                autofocus: false,
                //是否自动对焦
                autocorrect: true,
                //是否自动更正 是否显示提示的字符串
                enableInteractiveSelection: true,
                //是否可选中
                textInputAction: TextInputAction.next,
                //return 按钮显示样式
//                maxLength: 10, //显示字符串的最大长度
                maxLines: null,
                //显示行数
                onChanged: (value) {
                  //监听输入框输入
                  print(value);
                  _login();
                },
                onEditingComplete: () {
                  //当用户提交可编辑内容时调用
//                  _nameFocus.unfocus();
                  print("onEditingComplete");
                },
                onSubmitted: (input) {
                  //点击done按钮
                  print(input);
                  _nameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_pwFocus);
                },
//                keyboardType: TextInputType.number, //只显示数字键盘
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  filled: true,
                  icon: Icon(Icons.person),
                  //输入框左侧图标
                  prefixIcon: Icon(Icons.skip_previous),
                  //输入框内左侧图标
                  suffixIcon: Icon(Icons.chevron_right),
                  //输入框内右侧图标
                  labelText: 'name',
                  //提示符
                  hintText: '请输入名字',
                  //占位符
                  helperText: '输入由6-12位字母、数字组成的用户名',
                  //帮助
                  border: OutlineInputBorder(
                    //UnderlineInputBorder
//                    gapPadding: 4.0, //提示符占据的间隙
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
//                textCapitalization: TextCapitalization.words, //首字母大写
//                cursorColor: Colors.red, //光标颜色
//                cursorWidth: 16.0, //光标宽度
//                cursorRadius: Radius.circular(16.0),//光标半径
              ),
            ),
            const SizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10.0),
              child: AccentColorOverride(
                color: Colors.red,
                child: TextField(
                  focusNode: _pwFocus,
                  controller: _pwController,
                  obscureText: true,
                  enableInteractiveSelection: false,
                  //是否可选中
                  textInputAction: TextInputAction.done,
                  onSubmitted: (input) {
                    _pwFocus.unfocus();
                    //登陆请求
                    _login();
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    labelText: "password",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            Material(
                child: CupertinoTextField(
              placeholder: '手机账号',
              maxLines: 2,
              // cursorRadius: ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.red,
                    style: BorderStyle.solid,
//                    width: 2,
                  )),
            )),
//            const SizedBox(height: 20.0),
//            new InputDecorator(
//              decoration: const InputDecoration(
////                icon: const Icon(Icons.color_lens),
//                labelText: 'Color',
//              ),
//              isEmpty: _color == '',
//              child: new DropdownButtonHideUnderline(
//                child: new DropdownButton<String>(
//                  value: _color,
//                  isDense: true,
//                  onChanged: (String newValue) {
//                    setState(() {
//                      _color = newValue;
//                    });
//                  },
//                  items: _colors.map((String value) {
//                    return new DropdownMenuItem<String>(
//                      value: value,
//                      child: new Text(value),
//                    );
//                  }).toList(),
//                ),
//              ),
//            ),
            SizedBox(
              height: 40.0,
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: _login,
                  child: Text('login'),
                  color: Colors.white,
                )
              ],
            ),
            Container(
              color: Colors.red,
              constraints: BoxConstraints(
                  maxHeight: 144.0,
                  maxWidth: _screenWidth(),
                  minHeight: 48.0,
                  minWidth: _screenWidth()),
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration.collapsed(
                  hintText: "Write a comment",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double _screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  _login() async {
    Fluttertoast.showToast(
        msg: "我是一个提示框，我是一个提示框",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 3);
  }


}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        primaryColor: color,
      ),
    );
  }
}
