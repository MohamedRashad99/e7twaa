import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class TestController {

  void doSomething()async{
    var appDirectory = await getApplicationDocumentsDirectory();
    Hive..init(appDirectory.path);
    var box = await Hive.openBox('test');
    await box.put('key', 'value');
    print(box.get('key'));
    var box2 = await Hive.openBox('test2');
    box2.put('key', 'value2');
    print(box2.get('key'));
  }

}