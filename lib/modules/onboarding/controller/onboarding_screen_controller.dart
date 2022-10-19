import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController{
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
}