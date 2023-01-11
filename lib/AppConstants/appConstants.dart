import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

////Service constants
const apiKey='d7t7wka07RygrXttTKEjXwDtJPwGCm4koE3RxK5RMjU';
const baseUrl = "https://api.unsplash.com/";
const photosUrl="${baseUrl}photos/?";

Map<String, String> getHeader() {
  return {
    'Content-Type': 'application/json',
    'Authorization': 'Client-ID $apiKey'
  };
}

////Colors
const primaryColor = Color(0xffee8749);
const blackColor = Color(0xff353535);
const whiteColor = Colors.white;

////Loader
Widget loader() {
  return Center(
    child: Container(
      width: 150,
      height: 105,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Lottie.asset(
          'assets/loader1.json',
          width: 150,
          height: 105,
          alignment: Alignment.center,
        ),
      ),
    ),
  );
}