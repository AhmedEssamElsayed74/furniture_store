// import 'package:shop_app/modules/login/login_screen.dart';
// import 'package:shop_app/network/local/cach_helper.dart';
// import 'package:shop_app/shared/component/component.dart';

// void SignOut (context)
// {
// CachHelper.removeData(key:'token').then((value){
// if (value){
// navigateAndFinish(context, LogingScreen(),);
// }
// });
// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


String? token ;