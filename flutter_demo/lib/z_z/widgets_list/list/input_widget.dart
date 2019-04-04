import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_constant.dart';

/**
 * 封装的输入框，方便使用，避免多重嵌套
 */
class InputWidget extends StatefulWidget {
  bool underLine;
  bool outLine;
  bool textCenterVertical;
  bool textCenterHorizotal;
  bool needDelete;
  String curText;
  bool autoFocus;
  double underlineSize;
  String assetLeadIcon;
  double leadIconSize;
  double leadIconMarginLeft;
  double leadIconMarginRight;
  double leadIconMarginBottom;

  Widget actionWidget;
  String assetDeleteIcon;
  double deleteIconSize;
  double deleteIconMarginRight;
  double deleteIconMarginBottom;
  double actionWidgetMarginRight;
  double actionWidgetMarginBottom;

  String hintText;
  String defaultText;
  double fontSize;

  double height;
  double margin;
  double cursorWidth;
  int maxLines;
  int maxLength;

  double contentPaddingLeft;
  double contentPaddingTop;
  double contentPaddingRight;
  double contentPaddingBottom;

  Color fillColor;
  Color hintColor;
  Color textColor;
  Color cursorColor;
  Color underLineUnselectColor;
  Color underLineSelectColor;
  Color outlineUnselectColor;
  Color outlineSelectColor;

  bool obscureText;

  TextInputType inputType;
  List<TextInputFormatter> formatters;
  Function onTextChanged;
  Function onActionWidgetTap;

  InputWidget(
      {this.autoFocus = false, //是否需要自动获得焦点
      this.underLine = true, //默认需要下划线
      this.outLine = false, //是否需要边框
      this.needDelete = true, //是否需要删除
      this.textCenterVertical = false, //是否文字居中
      this.textCenterHorizotal = false, //文字
      this.obscureText = false, //是否要显示成密码格式，点点
      this.assetLeadIcon, //左边图标
      this.assetDeleteIcon = "images/input_delete.png", //删除图标
      this.fillColor = Colors.white, //填充颜色
      this.textColor = const Color(0xFF5D5858), //文字颜色
      this.hintColor = const Color(0xFFCDC1C1), //提示颜色
      this.actionWidget, //右边widget
      this.underlineSize = 1.0,
      this.leadIconSize = 22,
      this.deleteIconSize = 20,
      this.leadIconMarginLeft = 0,
      this.leadIconMarginRight = 25,
      this.leadIconMarginBottom = 10,
      this.deleteIconMarginBottom = 10,
      this.deleteIconMarginRight = 4,
      this.actionWidgetMarginRight = 4,
      this.actionWidgetMarginBottom = 6,
      this.hintText = '',
      this.defaultText = '',
      this.fontSize = 14,
      this.height = 50,
      this.margin = 40,
      this.maxLines = 1,
      this.maxLength = 11,
      this.cursorWidth = 2,
      this.cursorColor = Colors.blue,
      this.contentPaddingLeft = 46,
      this.contentPaddingTop = 10,
      this.contentPaddingRight = 0,
      this.contentPaddingBottom = 10,
      this.underLineUnselectColor = ColorConstant.defaultLineColor,
      this.underLineSelectColor = ColorConstant.activeLineColor,
      this.outlineUnselectColor = ColorConstant.defaultLineColor,
      this.outlineSelectColor = ColorConstant.activeLineColor,
      this.formatters,
      this.inputType,
      this.onTextChanged,
      this.onActionWidgetTap});

  String get text => curText;

  State createState() {
    return _InputWidgetState();
  }
}

class _InputWidgetState extends State<InputWidget> {
  InputDecoration getInputDecoration() {
    double marginVertical =
        (widget.height - widget.fontSize * widget.maxLines) / 2;
    if (widget.textCenterVertical) {
      if (widget.outLine == true) {
        return new InputDecoration(
          counterText: "",
          focusedBorder: ColorConstant.getOutLine(widget.outlineSelectColor,
              width: widget.underlineSize, radius: widget.height / 2),
          //默认的
          enabledBorder: ColorConstant.getOutLine(widget.outlineUnselectColor,
              width: widget.underlineSize, radius: widget.height / 2),
          hintStyle:
              new TextStyle(color: widget.hintColor, fontSize: widget.fontSize),
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          filled: true,
          contentPadding: EdgeInsets.only(
            top: marginVertical,
//            bottom: marginVertical,
            left: widget.textCenterHorizotal ? 0 : widget.contentPaddingLeft,
            right: widget.contentPaddingRight,
          ),
        );
      } else if (widget.underLine == false) {
        return new InputDecoration(
          counterText: "",
          focusedBorder: ColorConstant.getUnderLine(widget.underLineSelectColor,
              width: 0.0),
          //默认的
          enabledBorder: ColorConstant.getUnderLine(
              widget.underLineUnselectColor,
              width: 0.0),
          hintStyle:
              new TextStyle(color: widget.hintColor, fontSize: widget.fontSize),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(
            //top: marginVertical,
            //bottom: marginVertical,
            left: widget.textCenterHorizotal ? 0 : widget.contentPaddingLeft,
            right: widget.contentPaddingRight,
          ),
        );
      }
    } else {
      return new InputDecoration(
        counterText: "",
        focusedBorder: ColorConstant.getUnderLine(widget.underLineSelectColor,
            width: widget.underlineSize),
        //默认的
        enabledBorder: ColorConstant.getUnderLine(widget.underLineUnselectColor,
            width: widget.underlineSize),
        hintStyle:
            new TextStyle(color: widget.hintColor, fontSize: widget.fontSize),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.only(
            left: widget.contentPaddingLeft,
            top: widget.contentPaddingTop,
            right: widget.contentPaddingRight,
            bottom: widget.contentPaddingBottom),
      );
    }
  }

  Widget _getIcons() {
    Widget leadWidget = SizedBox();
    Widget deleteWidget = SizedBox();
    Widget actionWidget = new Container();
    if (widget.assetLeadIcon != null) {
      leadWidget = Container(
        child: Row(children: <Widget>[
          Image.asset(
            widget.assetLeadIcon,
            width: widget.leadIconSize,
            height: widget.leadIconSize,
          ),
          SizedBox(
            width: widget.leadIconMarginRight,
          ),
        ]),
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(
            left: widget.leadIconMarginLeft,
            bottom: widget.leadIconMarginBottom),
      );
    }
    if (widget.assetDeleteIcon != null) {
      bool isTextEmpty =
          widget.defaultText == null || widget.defaultText.isEmpty;
      deleteWidget = Container(
          child: InkWell(
              child: Opacity(
                child: Image.asset(
                  widget.assetDeleteIcon,
                  width: widget.deleteIconSize,
                  height: widget.deleteIconSize,
                ),
                opacity: isTextEmpty || !widget.needDelete ? 0.0 : 1.0,
              ),
              onTap: () {
                if (widget.needDelete) {
                  setState(() {
                    widget.defaultText = '';
                    widget.curText = '';
                    widget.onTextChanged('');
                  });
                }
              }),
          alignment: (widget.textCenterVertical || widget.outLine)
              ? Alignment.centerRight
              : Alignment.bottomRight,
          margin: EdgeInsets.only(
            right: widget.deleteIconMarginRight,
            bottom: (widget.textCenterVertical || widget.outLine)
                ? 0
                : widget.deleteIconMarginBottom,
          ));
    }
    if (widget.actionWidget != null) {
      actionWidget = Container(
        child: InkWell(
            child: widget.actionWidget, onTap: widget.onActionWidgetTap),
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(
            right: widget.actionWidgetMarginRight,
            bottom: widget.actionWidgetMarginBottom),
      );
    }
    return Stack(
      children: <Widget>[leadWidget, deleteWidget, actionWidget],
    );
  }

  //带有图标和delete按键的输入框
  Widget getInput() {
    return new Container(
      margin: EdgeInsets.only(
          left: widget.margin, top: 0, right: widget.margin, bottom: 0),
      height: widget.height,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                new TextField(
                    keyboardAppearance: Brightness.light,
                    autofocus: widget.autoFocus,
                    obscureText: widget.obscureText,
                    style: TextStyle(
                        color: widget.textColor, fontSize: widget.fontSize),
                    enabled: true,
                    controller: TextEditingController.fromValue(
                        TextEditingValue(
                            // 设置内容
                            text: widget.defaultText,
                            selection: TextSelection.fromPosition(TextPosition(
                                affinity: TextAffinity.downstream,
                                offset: widget.defaultText?.length)))),

                    //相当于Android属性hint
                    textAlign:
                        widget.textCenterVertical && widget.textCenterHorizotal
                            ? TextAlign.center
                            : TextAlign.start,
                    cursorColor: widget.cursorColor,
                    cursorWidth: widget.cursorWidth,
                    maxLength: widget.maxLength,
                    maxLines: widget.maxLines,
                    onChanged: (String text) {
                      widget.curText = text;
                      widget.onTextChanged(text);
                    },
                    inputFormatters: widget.formatters,
                    keyboardType: widget.inputType,
                    decoration: getInputDecoration()),
                _getIcons()
              ],
              alignment: widget.outLine || widget.textCenterVertical
                  ? Alignment.centerRight
                  : Alignment.bottomCenter,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      widget.inputType = TextInputType.text;
    }
    return getInput();
  }
}
