

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'constants/assets.dart';
import 'constants/colors.dart';




HW hw = HW();

class HW {
  var height = Get.height;
  var width = Get.width;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

commonWidget allWidgets = commonWidget();

class commonWidget {




  TextField textField({
    keyBoardType,
    controller,
    hintText,
    labelText,
    suffixIcon,
    obscureText,
    maxLines,
    readonly = false,
  }) {
    return TextField(
      style: TextStyle(fontSize: 14.0),
      controller: controller,
      maxLines: maxLines ?? 1,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      readOnly: readonly,
      decoration: InputDecoration(
        hintMaxLines: 3,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colors.black5,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: colors.black,
          fontSize: 14,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: colors.black4),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: colors.black4)),
        suffixIcon: suffixIcon,
      ),
    );
  }

  TextField searchTextField(
      {controller,
      keyBoardType,
      hintText,
      onTap,
      onChanged,
      readonly = false,
      focus = false,
      focusnode}) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readonly,
      focusNode: focusnode,
      autofocus: focus,
      controller: controller,
      keyboardType: keyBoardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: colors.textFieldColor,
        hintMaxLines: 3,
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        prefixIcon: Image.asset(
          AssetUrl.search,
          height: 20,
          width: 20,
          scale: 3,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colors.black6,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: colors.transparent),
        ),
      ),
    );
  }

  TextField searchTextField2(
      {controller, keyBoardType, hintText, onTap, onChanged, iconOnPressed}) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyBoardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: iconOnPressed,
          icon: InkWell(
            onTap: iconOnPressed,
            child: Image.asset(
              AssetUrl.link,
              scale: 3.5,
            ),
          ),
        ),
        filled: true,
        fillColor: colors.textFieldColor,
        hintMaxLines: 3,
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colors.black6,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: colors.transparent),
        ),
      ),
    );
  }

  Text gradientText({
    text,
    fontSize,
  }) {
    final Shader linearGradient = LinearGradient(
      colors: [
        colors.gradient1,
        colors.gradient2,
      ],
    ).createShader(
      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    );
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        foreground: Paint()..shader = linearGradient,
      ),
    );
  }

  gradientText2(
    text, {
    gradient,
    style,
  }) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }

  Text boldGradientText({
    text,
    fontSize,
  }) {
    final Shader linearGradient = LinearGradient(
      colors: [
        colors.gradient1,
        colors.gradient2,
      ],
    ).createShader(
      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    );
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        foreground: Paint()..shader = linearGradient,
      ),
    );
  }

  Text lightText({text, fontSize, color}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? color.black,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: "Inter",
      ),
    );
  }

  Text regularText(
      {text,
      fontSize,
      color,
      fontWeight,
      maxLine,
      overflow = TextOverflow.ellipsis}) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine ?? 1,
      style: TextStyle(
        color: color ?? colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: "Inter",
        overflow: overflow,
      ),
    );
  }

  Text boldText({text, fontSize, color, fontWeight, maxLine}) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
        color: color ?? colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: "Inter",
      ),
    );
  }

  AppBar appBarStatusBar(
      {statusBarColor, backgroundColor, statusBarIconBrightness}) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
      ),
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
    );
  }




  Container commonButton(
      {height, width, text, onPressed, fontSize, fontWeight, isLoading}) {
    return Container(
      height: height,
      width: width ?? hw.width * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.gradient1, colors.gradient2],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: onPressed,
        child: Center(
          child: isLoading == true
              ? customIndicatorWhite
              : Text(
                  text,
                  style: TextStyle(
                    color: colors.white,
                    fontSize: fontSize ?? 14.0,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600 ,
                  ),
                ),
        ),
      ),
    );
  }

  Widget connectCommonButton(
      {text, onPressed, fontWeight, font, fontSize, color}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: height,
        // width: width ?? hw.width * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colors.gradient1, colors.gradient2],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: hw.width * 0.042, vertical: hw.height * 0.013),
          child: Center(
            child: font ??
                boldText(
                    text: text,
                    fontSize: fontSize,
                    color: color ?? colors.white),
          ),
        ),
      ),
    );
  }

  Container simpleButton(
      {height, width, text, onPressed, fontWeight, font, fontSize}) {
    return Container(
      height: height,
      width: width ?? hw.width * 0.8,
      decoration: BoxDecoration(
        color: colors.buttonColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: onPressed,
        child: Center(
          child: Center(
            child: font ?? boldText(text: text, fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  Container socialLogin(
      {height, width, text, onPressed, fontWeight, font, fontSize, image}) {
    return Container(
      height: height,
      width: width ?? hw.width * 0.8,
      decoration: BoxDecoration(
        color: colors.buttonColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                scale: 4,
              ),
              SizedBox(
                width: 10,
              ),
              font ?? boldText(text: text, fontSize: fontSize),
            ],
          ),
        ),
      ),
    );
  }

  Container loadingButton({height, width, text, onPressed, loading}) {
    return Container(
      height: height,
      width: width ?? hw.width * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.gradient1, colors.gradient2],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: onPressed,
        child: Center(
          child: loading == true
              ? customIndicatorWhite
              : Text(
                  text,
                  style: TextStyle(
                    color: colors.white,
                    fontSize: 14.0,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  Container roundGradientContainer({height, width, child}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [colors.gradient1, colors.gradient2]),
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }

  Container container(
      {height, width, radiusFlag, color, child, shadowFlag, borderColor}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: shadowFlag == 1 ? colors.white : color,
        boxShadow: [
          shadowFlag == 1
              ? BoxShadow(color: colors.grey, blurRadius: 0.8)
              : BoxShadow(color: colors.transparent)
        ],
        border: Border.all(color: borderColor ?? colors.transparent),
        borderRadius: radiusFlag == 0
            ? BorderRadius.circular(5)
            : radiusFlag == 1
                ? BorderRadius.circular(12)
                : BorderRadius.circular(61),
      ),
      child: child,
    );
  }

  Container gradientContainer(
      {height, width, radiusFlag, color, gradientFlag, circleFlag, child}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        gradient: LinearGradient(colors: [colors.gradient1, colors.gradient2]),
        // shape: circleFlag == 1 ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: radiusFlag == 0
            ? BorderRadius.circular(5)
            : radiusFlag == 1
                ? BorderRadius.circular(12)
                : BorderRadius.circular(61),
      ),
      child: child,
    );
  }


  pickImageBottomModelSheet(
      {context, pickimage, icon1, icon2, text1, text2, source1, source2}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              allWidgets.container(
                radiusFlag: 0,
                shadowFlag: 0,
                color: colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("fdskjhfskjdf");
                              pickimage(source1);
                            },
                            child: Row(
                              children: [
                                allWidgets.roundGradientContainer(
                                    height: hw.height * 0.04,
                                    width: hw.width * 0.08,
                                    child: Icon(
                                      icon1,
                                      color: colors.white,
                                      size: 16,
                                    )),
                                SizedBox(width: 20),
                                Container(
                                  width: Get.width * 0.63,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 10,
                                    ),
                                    child: allWidgets.regularText(
                                      text: text1,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              print("fdskjhfskjdf");
                              pickimage(source2);
                            },
                            child: Row(
                              children: [
                                allWidgets.roundGradientContainer(
                                    height: hw.height * 0.04,
                                    width: hw.width * 0.08,
                                    child: Icon(
                                      icon2,
                                      color: colors.white,
                                      size: 16,
                                    )),
                                SizedBox(width: 20),
                                Container(
                                  width: Get.width * 0.63,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 10,
                                    ),
                                    child: allWidgets.regularText(
                                      text: text2,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: hw.height * 0.01),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: allWidgets.container(
                  shadowFlag: 0,
                  radiusFlag: 0,
                  color: colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: hw.height * 0.0195),
                        allWidgets.regularText(
                          text: 'Cancel',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: hw.height * 0.0195),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: hw.height * 0.035),
            ],
          ),
        );
      },
    );
  }







}



noInternetConnectionPopUp() {
  return Container(
    height: hw.height,
    width: hw.width,
    decoration: BoxDecoration(
      color: colors.black5,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: hw.height * 0.20,
          width: hw.width * 0.70,
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: allWidgets.regularText(
              text: 'No Internet Connection',
              color: colors.black,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    ),
  );
}

customButtonLoader({center}) {
  return GestureDetector(child: center);
}

class Toasty {
  static showtoast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
    );
  }
}
