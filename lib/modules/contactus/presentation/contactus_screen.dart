import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luso_american_financial/modules/contactus/controller/contactus_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/utils/validation.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_button.dart';
import 'package:luso_american_financial/widgets/custom_text_field.dart';

class ContactUsScreen extends StatefulWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final ContactUsScreenController contactUsScreenController = Get.find();
  static const LatLng homeShowLocation = LatLng(53.350140, -6.266155);
  static const LatLng newBedfordShowLocation =
      LatLng(41.638409, -70.941208); //location to show in map
  final Set<Marker> HomeMarkers = new Set();
  final Set<Marker> NewBedfordMarkers = new Set();
  final Completer<GoogleMapController> _controller = Completer();

  // final CameraPosition _homeShowLocation = const CameraPosition(
  //   target: LatLng(53.350140, -6.266155),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );
  //
  // final CameraPosition _newBedfordShowLocation = const CameraPosition(
  //   target: LatLng(41.638409, -70.941208),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  // Set<Marker> getHomeMarkers() {
  //   setState(() {
  //     HomeMarkers.add(Marker(
  //       markerId: MarkerId(homeShowLocation.toString()),
  //       position: LatLng(53.350140, -6.266155), //position of marker
  //       infoWindow: InfoWindow(
  //         title: 'Home Office',
  //         snippet: '7080 Donlon Way, Suite 200, Dublin CA 94568',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //     ));
  //   });
  //   return HomeMarkers;
  // }
  //
  // Set<Marker> getOfficeMarkers() {
  //   setState(() {
  //     NewBedfordMarkers.add(Marker(
  //       markerId: MarkerId(newBedfordShowLocation.toString()),
  //       position: LatLng(41.638409, -70.941208), //position of marker
  //       infoWindow: InfoWindow(
  //         title: 'East Coast Office',
  //         snippet: '128 Union St., Suite 502 New Bedford MA 02740',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //     ));
  //   });
  //   return NewBedfordMarkers;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeUtils.verticalBlockSize * 22),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: contactUsScreenController.signUpFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.horizontalBlockSize * 10),
                    child: CustomTextField(
                      focusedColor: Colors.transparent,
                      enableColor: Colors.transparent,
                      disabledColor: Colors.transparent,
                      isPrefixIcon: true,
                      cursorColor: Colors.transparent,
                      controller:
                          contactUsScreenController.searchContactUsController,
                      fillColor: AppColors.white,
                      hintText: StringsUtils.search,
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(SizeUtils.horizontalBlockSize * 10),
                        topRight:
                            Radius.circular(SizeUtils.horizontalBlockSize * 10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeUtils.horizontalBlockSize * 8,
                          left: SizeUtils.horizontalBlockSize * 8,
                          right: SizeUtils.horizontalBlockSize * 8),
                      child: Column(
                        children: [
                          AppText(
                            text: "We Want to hear from you!",
                            color: AppColors.darkBlue,
                            fontSize: SizeUtils.fSize_15(),
                            fontWeight: FontWeight.w800,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.horizontalBlockSize * 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: SizeUtils.horizontalBlockSize * 2.5,
                                    bottom: SizeUtils.horizontalBlockSize * 4.5,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.darkBlue,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeUtils.horizontalBlockSize *
                                                  12,
                                          vertical:
                                              SizeUtils.horizontalBlockSize *
                                                  0.5),
                                      child: const AppText(
                                        text: "",
                                        fontSize: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 4),
                            child: AppText(
                              text: "Luso-American Financial",
                              fontWeight: FontWeight.w600,
                              fontSize: SizeUtils.fSize_13(),
                              color: AppColors.darkBlue,
                            ),
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 30,
                            child: AppText(
                              text:
                                  "Home Office 7080 Donlon Way, Suite 200,Dublin CA 94568 Office: (925) 828-4884 Fax: (925) 828-4554 Toll Free: (877) 525-5876 admin@luso-american.org",
                              height: 1.4,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeUtils.fSize_11(),
                              color: AppColors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 5),
                            child: SizedBox(
                              height: SizeUtils.horizontalBlockSize * 45,
                              // child: GoogleMap(
                              //   mapType: MapType.normal,
                              //   initialCameraPosition: _homeShowLocation,
                              //   onMapCreated: (GoogleMapController controller) {
                              //     _controller.complete(controller);
                              //   },
                              // ),
                              child: GoogleMap(
                                mapType: MapType.normal,
                                onMapCreated: (controller) {
                                  setState(() {
                                    contactUsScreenController.mapController =
                                        controller;
                                  });
                                },
                                initialCameraPosition: CameraPosition(
                                  target: homeShowLocation, //initial position
                                  zoom: 15.0, //initial zoom level
                                ),
                                markers: getHomeMarkers(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 4),
                            child: AppText(
                              text: "Luso-American Financial",
                              fontWeight: FontWeight.w600,
                              fontSize: SizeUtils.fSize_13(),
                              color: AppColors.darkBlue,
                            ),
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 30,
                            child: AppText(
                              text:
                                  "East Coast Office 128 Union St., Suite 502 New Bedford MA 02740 Toll Free: (800) 378-0566 Fax: (774) 202-1275",
                              height: 1.4,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeUtils.fSize_11(),
                              color: AppColors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 5),
                            child: SizedBox(
                              height: SizeUtils.horizontalBlockSize * 45,
                              // child: Image.asset(
                              //   AssetsPath.map,
                              //   fit: BoxFit.fill,
                              // ),
                              // child: GoogleMap(
                              //   mapType: MapType.normal,
                              //   initialCameraPosition: _newBedfordShowLocation,
                              //   onMapCreated: (GoogleMapController controller) {
                              //     _controller.complete(controller);
                              //   },
                              // ),

                              child: GoogleMap(
                                mapType: MapType.normal,
                                onMapCreated: (controller) {
                                  setState(() {
                                    contactUsScreenController.mapController =
                                        controller;
                                  });
                                },
                                initialCameraPosition: CameraPosition(
                                  target: newBedfordShowLocation,
                                  //initial position
                                  zoom: 15.0, //initial zoom level
                                ),
                                markers: getOfficeMarkers(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 6),
                            child: AppText(
                              text: "Contact Us",
                              color: AppColors.darkBlue,
                              fontSize: SizeUtils.fSize_15(),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          CustomTextField(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            cursorColor: Colors.transparent,
                            controller: contactUsScreenController
                                .fullNameContactUsController,
                            fillColor: AppColors.grey[70]!.withOpacity(0.1),
                            hintText: StringsUtils.fullName,
                            validator: AppValidator.isFirstNameValid,
                          ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 4),
                          CustomTextField(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            cursorColor: Colors.transparent,
                            controller: contactUsScreenController
                                .lastNameContactUsController,
                            fillColor: AppColors.grey[70]!.withOpacity(0.1),
                            hintText: StringsUtils.lastName,
                            validator: AppValidator.isLastNameValid,
                          ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 4),
                          CustomTextField(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            cursorColor: Colors.transparent,
                            controller: contactUsScreenController
                                .emailContactUsController,
                            fillColor: AppColors.grey[70]!.withOpacity(0.1),
                            hintText: StringsUtils.email,
                            validator: AppValidator.emailValidator,
                          ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 4),
                          CustomTextField(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            cursorColor: Colors.transparent,
                            controller: contactUsScreenController
                                .phoneNumberContactUsController,
                            fillColor: AppColors.grey[70]!.withOpacity(0.1),
                            hintText: StringsUtils.phone,
                            validator: AppValidator.isValidMobile,
                            inputFormatters: [
                              FilteringTextInputFormatter(
                                RegExp(r'[0-9]'),
                                allow: true,
                              )
                            ],
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 4),
                          CustomTextField(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            cursorColor: Colors.transparent,
                            controller: contactUsScreenController
                                .messagesContactUsController,
                            fillColor: AppColors.grey[70]!.withOpacity(0.1),
                            hintText: StringsUtils.messages,
                            maxLine: 6,
                            validator: AppValidator.isMsgValid,
                          ),
                          createButton(
                            vertical: SizeUtils.horizontalBlockSize * 5,
                            radius: SizeUtils.horizontalBlockSize * 2,
                            text: 'SUBMIT',
                            onTap: () {
                              if (contactUsScreenController
                                  .signUpFormKey.currentState!
                                  .validate()) {
                                contactUsScreenController.Contact_Us(
                                  email: contactUsScreenController
                                      .emailContactUsController.text,
                                  firstName: contactUsScreenController
                                      .fullNameContactUsController.text,
                                  lastName: contactUsScreenController
                                      .lastNameContactUsController.text,
                                  mobile: contactUsScreenController
                                      .phoneNumberContactUsController.text,
                                  msg: contactUsScreenController
                                      .messagesContactUsController.text,
                                );
                                contactUsScreenController
                                    .fullNameContactUsController
                                    .clear();
                                contactUsScreenController
                                    .messagesContactUsController
                                    .clear();
                                contactUsScreenController
                                    .phoneNumberContactUsController
                                    .clear();
                                contactUsScreenController
                                    .emailContactUsController
                                    .clear();
                                contactUsScreenController
                                    .lastNameContactUsController
                                    .clear();
                              }
                            },
                            buttonColor: AppColors.darkBlue,
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> getHomeMarkers() {
    setState(() {
      HomeMarkers.add(Marker(
        markerId: MarkerId(homeShowLocation.toString()),
        position: LatLng(53.350140, -6.266155), //position of marker
        infoWindow: InfoWindow(
          title: 'Home Office',
          snippet: '7080 Donlon Way, Suite 200, Dublin CA 94568',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return HomeMarkers;
  }

  Set<Marker> getOfficeMarkers() {
    setState(() {
      NewBedfordMarkers.add(Marker(
        markerId: MarkerId(newBedfordShowLocation.toString()),
        position: LatLng(41.638409, -70.941208), //position of marker
        infoWindow: InfoWindow(
          title: 'East Coast Office',
          snippet: '128 Union St., Suite 502 New Bedford MA 02740',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return NewBedfordMarkers;
  }
}
