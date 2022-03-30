import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

Widget myDivider( ) => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);



Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  Function? onSubmit ,
  required FormFieldValidator validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
   Function? suffixPressed,
  Function()? onTap,
  ValueChanged<String>? onChange,


})=> TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: (value) {
    onSubmit;
  },
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    border: const OutlineInputBorder(),
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null
        ? IconButton(onPressed: () => suffixPressed!(dynamic), icon: Icon(suffix))
        : null,
  ),
);


Widget defaultTextButton({
   required Function()? function,
  required String text,
}) => TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );




Widget defaultButton({
  double width = 150,
  double height = 50,
  Color background = const Color.fromRGBO(19, 184, 214, 1),
  double radius = 8.0,
  bool isUppercase = true,
  required Function()? function,
  required String text,
}) => Container(
  width: width,
  height: height,
  child: MaterialButton(onPressed: function,
    child: Text(
      isUppercase ?text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);




Widget defaultButton3({
  required double width ,
  Color background = const Color.fromRGBO(8, 112, 131, 1),
  double radius = 8.0,
  bool isUppercase = true,
  required Function()? function,
  required String text,
}) => Container(
  width: width,
  child: MaterialButton(onPressed: function,
    child: Text(
      isUppercase ?text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);


void navigateto(context , widget)=>Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),

);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );

void showToast ({
  required String text,
  required ToastState state,
})=>

  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastcolor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );

  enum ToastState {SUCCESS , ERROR , WARNING}

Color chooseToastcolor(ToastState state)
{
  Color color;

  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;

}










Widget defaultButton2({
  required double width ,
  required double height ,
  required Color background ,
  required double radius ,
  bool isUppercase = false,
  required Function()? function,
  required String text,
}) => Container(
  width: width,
  height: height,
  child: MaterialButton(onPressed: function,
    child: Text(
      isUppercase ?text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);





