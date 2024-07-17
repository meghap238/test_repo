

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_test/config/app_color.dart';
import 'package:new_test/config/app_string.dart';

abstract class AllWidgets {
  // static TextStyle textStyle = TextStyle(
  //   height:10
  //     );
  static Widget textWidget({required String data ,Color? color, double? size ,FontWeight? fontWeight,
  String? fontFamily}){
    return Text(
data,style: TextStyle(color: color ??  AppColor.blackClr,
    fontSize: size?? 13,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontFamily: fontFamily ??'lato'

    ),
    );
  }


  static Widget customTextField({required String hintText ,required TextEditingController? controller, String? Error}){
    return TextFormField(
      controller:controller ,
      validator: (value) {
       if(value!.isEmpty){
     return Error;
     }else if(value!.length<=10){
         return 'enter at least 10 charactor';
       }
       return null;
      },
      decoration: InputDecoration(
          hintText: AppString.enterName,
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ) ,
    );
  }
  static Widget customButton({required void Function()? onPressed,})=> ElevatedButton(
    onPressed: onPressed,
    child: textWidget(data: AppString.submitBtn,fontWeight: FontWeight.bold,color: AppColor.whiteClr,size: 15),
      style: ButtonStyle(
          backgroundColor:  WidgetStatePropertyAll(AppColor.btnBgClr),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius:  BorderRadius.circular(10))),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20))
      ),
    );
static Widget  verticalSpace({double? height}){
  return SizedBox(
    height: height ?? 20,
  );

}
}