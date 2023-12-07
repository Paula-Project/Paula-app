import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  bool showConnectionStatus = true;

  late StreamSubscription<InternetConnectionStatus> _subscription;

  @override
  void onInit() {
    super.onInit();
  }

  void checkConnectionStatus() {
    showConnectionStatus = true;
    InternetConnectionChecker().onStatusChange.listen(_updateConnectCheck);
  }

  void clearConnectionStatus(){
    showConnectionStatus = false;
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
  }

  _updateConnectCheck(InternetConnectionStatus status) {
    
    if (status == InternetConnectionStatus.disconnected && showConnectionStatus)  {
      Get.rawSnackbar(
        messageText: const Text('Sem conexão com a internet',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        duration: const Duration(days: 1),
        isDismissible: false,
        backgroundColor: Colors.red[400]!,
        icon: const Icon(Icons.wifi_off, color: Colors.white),
        margin: EdgeInsets.zero,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
