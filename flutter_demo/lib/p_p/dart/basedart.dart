
dartBasis(){



  var tag = "666";

  ///命名参数
  sayHello(String name){
    print("hello, my name is $name");
  }
  sayHello1(String name){
    print("hello, my name is $name");
  }

  sayHello('zhangsan'); // 打印 hello, my name is zhangsan
  sayHello1('lisi'); // 打印 hello, my name is lisi

  //位置参数的默认值
  int sum(int a, int b, [int c = 3]){
    return a + b + c;
  }

  //匿名函数
  testFunc(Function callback){
    callback("hello");
  }
  testFunc((param){
    print(param); //打印 hello
  });




  //is 和c#一样， is运算符用于判断一个变量是不是某个类型的数据
  // is!则是判断变量不是某个类型的数据
  var s = "hello";  print(s is String); // true
  var num = 6;  print(num is! String); // true

  //??= 和 ?.运算符
  //??=运算符 如果 ??= 运算符前面的变量为null，则赋值，否则不赋值
  var param1 = "hello", param2 = null;
  param1 ??= "world";  param2 ??= "world";
  print("param1 = $param1"); // param1 = hello
  print("param2 = $param2"); // param2 = world
  //?.运算符
  var str1 = "hello world";
  var str2 = null;
  print(str1?.length); // 11
  print(str2?.length); // null
  print(str2.length); // 报错



  //..运算符（级联操作）
  /// 依次打印
  /// I am eating...
  /// I am sleeping...
  /// I am studying...
  new Person()..eat()
    ..sleep()
    ..study();


  //不一样的try/catch
  // try catch语句
  try {
    print(1 ~/ 0);
  } catch (e) {    // IntegerDivisionByZeroException
    print(e);
  }  try {    1 ~/ 0;
  } on IntegerDivisionByZeroException { // 捕获指定类型的异常
    print("error"); // 打印出error
  } finally {
    print("over"); // 打印出over
  }

  //类

  // mixins
  // mixins是一个前端很火的概念，是一个重复使用类中代码的方式。
  // 使用with关键字，表示类C是由类A和类B混合而构成class C = A with B;
  // Dart中的Mixin的继承机制，当我们的继承父类不是同一个的，
  // 同时子类里面需要实现同样的功能时，Mixin显得尤为重要。
  C c = new C()..a()..b();



  //异步
  //Dart提供了类似ES7中的async await等异步操作，
  // 这种异步操作在Flutter开发中会经常遇到，
  // 比如网络或其他IO操作，文件选择等都需要用到异步的知识。
  // async和await往往是成对出现的，如果一个方法中有耗时的操作，
  // 你需要将这个方法设置成async，并给其中的耗时操作加上await关键字，
  // 如果这个方法有返回值，你需要将返回值塞到Future中并返回，如下代码所示：
  Future checkVersion() async {
    var version = await lookUpVersion();  // Do something with version
    return version;
  }

  //调用
  checkVersion().then((value){
    print(value);
  });








}

lookUpVersion(){}

class Person {
  eat() {
    print("I am eating...");
  }

  sleep() {
    print("I am sleeping...");
  }

  study() {
    print("I am studying...");
  }
}

/// 类（Class）
/// 不需要用private, protected, public等修饰成员变量或成员函数
/// 构造函数可以不用方法体，自动对应
class Person1 {
  String name;
  int age;
  String gender;
  Person1(this.name, this.age, this.gender);
  sayHello() {
    print("hello, this is $name, I am $age years old, I am a $gender");
  }
}

class A {
  a() {
    print("A's a()");
  }
}
class B {
  b() {
    print("B's b()");
  }
}

class C  with A,B {
}






abstract class CanFixComputer {
  void fixComputer();
}

abstract class CanDesignSoftware {
  void designSoftware();
}

//工作者
abstract class Worker {
  void doWork();//工作者需要工作
}

//工程师
class Engineer extends Worker {
  void doWork() {
    print('工程师在工作');
  }
}

//教师
class Teacher extends Worker {
  void doWork() {
    print('教师在教学');
  }
}

//软件工程师
class SoftwareEngineer extends Engineer implements CanFixComputer, CanDesignSoftware {
  void fixComputer() {
    print('修电脑');
  }

  void designSoftware() {
    print('设计软件');
  }
}

//IT教师
class ITTeacher extends Teacher implements CanFixComputer {
  void fixComputer() {
    print('修电脑');
  }
}

//软件工程师
class SoftwareEngineer1 extends Engineer
    with CanFixComputer, CanDesignSoftware {
  @override
  void designSoftware() {
    print('设计软件');
  }

  @override
  void fixComputer() {
    print('修电脑');
  }
}

//IT教师
class ITTeacher1 extends Teacher with CanFixComputer {
  @override
  void fixComputer() {
    print('修电脑');
  }
}



class First {
  void doPrint() {
    print('First');
  }
}

class Second {
  void doPrint() {
    print('Second');
  }
}

class Father {
  void doPrint() {
    print('Father');
  }
}

class Son1 extends Father with First,Second {
  void doPrint() {
    print('Son1');
  }
}

class Son2 extends Father with First implements Second {
  void doPrint() {
    print('Son2');
  }
}