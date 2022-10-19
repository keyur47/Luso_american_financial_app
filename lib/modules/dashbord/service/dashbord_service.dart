import 'dart:convert';
import 'dart:developer';

import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/model/banner_media_model.dart';
import 'package:luso_american_financial/utils/appconfig.dart';

class BannerMediaService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<BannerMediaModal> bannerMedia() async {
    try {
      final result = await _networkAPICall.get(AppConfig.bannerMedia);
      return BannerMediaModal.fromJson(result);
    } catch (e) {
      return BannerMediaModal();
    }
  }
}
