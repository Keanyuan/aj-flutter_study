//import 'package:crypto/crypto.dart';
//import 'dart:convert';
//import 'package:convert/convert.dart';
//class HttpUtil {
//  static HttpUtil instance;
//  Dio dio;
//  Options options;
//
//  static HttpUtil getInstance() {
//    print('getInstance');
//    if (instance == null) {
//      instance = new HttpUtil();
//    }
//    return instance;
//  }
//
//  HttpUtil() {
//    print('dio赋值');
//    // 或者通过传递一个 `options`来创建dio实例
//    options = Options(
//      // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
//
//      //连接服务器超时时间，单位是毫秒.
//      connectTimeout: 10000,
//
//      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
//      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
//      ///  注意: 这并不是接收数据的总时限.
//      receiveTimeout: 3000,
//      headers: {
//        'X-Requested-With': 'XMLHttpRequest',
//        'Content-Type': 'application/json; charset=UTF-8'
//      },
//    );
//    dio = new Dio(options);
//
//  }
//  //没有指定返回值类型
//  signData( Object params) {
//    String generateMd5(String data) {
//      var content = new Utf8Encoder().convert(data);
//      var digest = md5.convert(content);
//      return hex.encode(digest.bytes);
//    }
//    var time = new DateTime.now().millisecondsSinceEpoch;
//    String token = "";
//    Map<String , dynamic> reqData = new Map();
//
//    Map<String , dynamic> paramsObj = new Map();
//
//    paramsObj = params;
//    var arr = [];
//    paramsObj.forEach((key,value) => (arr.add(key)));
//
//    Map<String , dynamic> object = new Map();
//
//    for (var i = 0; i < arr.length; i++) {
//      var key = arr[i];
//      var value = paramsObj[key];
//      object[key] = value;
//    }
//    //进行签名校验
//    Map cr = new Map();
//    cr['token'] = token;
//    cr['time'] = time.toString();
//    cr['reqData'] = json.encode(paramsObj);
//    var array = [];
//    cr.forEach((key,value) => (array.add(key)));
//    array.sort();
//    var str = '';
//    for (var i = 0; i < array.length; i++) {
//      var key = array[i];
//      var value = cr[key];
//      str += key + value;
//    }
//    print(str);
//    reqData["time"] = time;
//    reqData["token"] = token;
//    reqData['reqData'] = params;
//    reqData['sign'] = generateMd5(str);
//    return reqData;
//  }
//
//  get(url, {data, options, cancelToken}) async {
//    print('get请求启动! url：$url ,body: $data');
//    Response response;
//    try {
//      response = await dio.get(
//        url,
//        data: signData,
//        cancelToken: cancelToken,
//      );
//      print('get请求成功!response.data：${response.data}');
//    } on DioError catch (e) {
//      if (CancelToken.isCancel(e)) {
//        print('get请求取消! ' + e.message);
//      }
//      print('get请求发生错误：$e');
//    }
//    return response.data;
//  }
//
//  post(url, {data, options, cancelToken}) async {
//    print('post请求启动! url：$url ,body: $data');
//    Response response;
//    Map arr= signData(data);
////    print(a);
//    try {
//      response = await dio.post(
//        url,
//        data: arr,
//        cancelToken: cancelToken,
//      );
//      print('post请求成功!response.data：${response.data}');
//    } on DioError catch (e) {
//      if (CancelToken.isCancel(e)) {
//        print('post请求取消! ' + e.message);
//      }
//      print('post请求发生错误：$e');
//    }
//    return response.data;
//  }
//}
//
//
//
