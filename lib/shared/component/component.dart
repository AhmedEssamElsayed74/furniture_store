import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_store/shared/style/color.dart';

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
      style: const TextStyle(
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
      style: const TextStyle(
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
      style: const TextStyle(
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


  Widget BuildNoInternetWidget()
  {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(9.0),
              child: Text(
                  "No internet connection, please check your connection and try again",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Image.asset("image/no_internet.png"),
          ],
        ),
      ),
    );
  }

Widget buildListProductItem2({
    context,
   productsList,
   buttonName,
   buttonFunction,
   iconName,
   iconFunction,

}) =>
    Center(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        height: 170,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: Card(
          margin: const EdgeInsetsDirectional.all(5),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //______ الصوره ______
              Container(
                height: 190,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://target.scene7.com/is/image/Target/GUEST_b0aa50c3-ce9c-4fea-93bf-e6dffb91818b?wid=325&hei=325&qlt=80&fmt=pjpeg",
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                width: 10.0,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    //_______ productName _________
                    const Text(
                      "Century Club Chair",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    //______ size _______
                    const Text(
                      "15x10x30 Cm",
                      style: TextStyle(
                        color: defaultcolor,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    //______ price _____

                    Container(
                      //______ لو في خصم ____
                        child: "200" ==
                            'NoDiscount'
                            ? const Text(
                          "12000 EGP",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                        //____ لو مفيش خصم هيكون السعر العادي بس ___
                            : Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "1200 EGP",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Text(
                                "50000 EGP",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  decoration:
                                  TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        )),

                    const SizedBox(
                      height: 15.0,
                    ),

                    //_________ add to cart and favourite
                    // Row(
                    //   children: [
                    //     MaterialButton(
                    //       onPressed: (){},
                    //
                    //       child:  Text(
                    //         buttonName,
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       padding: EdgeInsets.zero,
                    //       color: HexColor('#087083'),
                    //       highlightColor: Colors.teal,
                    //     ),
                    //     const Spacer(),
                    //     IconButton(
                    //       onPressed: (){},
                    //       icon: iconName,
                    //
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

