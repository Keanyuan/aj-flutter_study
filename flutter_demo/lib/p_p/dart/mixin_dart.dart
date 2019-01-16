
///工程师类目，有软件工程师和建筑工程师师等，他们共同点都是工程师
///教师类目有美术教师，IT教师等，他们共同点都是教师
///而以上的工程师、教师都是社会的工作者。
/// 工作者     --->      教师        --->      美术教师(手绘、 书法)、IT教师(修电脑)
///  工作者    --->      工程师      --->   软件工程师(软件设计、修电脑)、建筑工程师(手绘)

/// 工作者
abstract class Worker{
  void doWork();//工作者需要工作
}

//修电脑
abstract class CanFixComputer {
  factory CanFixComputer._(){
    return null;
  }
  void fixComputer(){
    print('修电脑');
  }
}

//手绘
abstract class CanDesignSoftware {
  factory CanDesignSoftware._(){
    return null;
  }
  void designSoftware(){
    print('设计软件');
  }
}

class Engineer extends Worker {
  @override
  void doWork() {
    print('工程师在工作');
  }
}

class Teacher extends Worker {
  @override
  void doWork() {
    print('教师在教学');
  }
}


///软件工程师
//class SoftwareEnginner extends Engineer implements CanFixComputer, CanDesignSoftware {
//  @override
//  void designSoftware() {
//    print('设计软件');
//  }
//
//  @override
//  void fixComputer() {
//    print('修电脑');
//  }
//
//}
class SoftwareEnginner extends Engineer with CanFixComputer, CanDesignSoftware {
}

//IT教师
//class ITTeacher extends Teacher implements CanFixComputer {
//  @override
//  void fixComputer() {
//    print('修电脑');
//  }
//}

class ITTeacher extends Teacher with CanFixComputer {
}


///建筑工程师
class BuildingEngineer extends Engineer {

}

//美术教师
class ArtTeacher extends Teacher {

}


c(){
  ITTeacher itTeacher = new ITTeacher();
  itTeacher.doWork();
  itTeacher.fixComputer();

  SoftwareEnginner softwareEnginner = new SoftwareEnginner();
  softwareEnginner.doWork();
  softwareEnginner.fixComputer();
  softwareEnginner.designSoftware();
}



