import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectiveService extends GetxService {
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  List<ConnectivityResult>? _result;

  Future<ConnectiveService> init() async {
    _result = await Connectivity().checkConnectivity();
    _subscription = Connectivity().onConnectivityChanged.listen((result) => _result = result);
    return this;
  }

  bool get hasConnection =>
      _result?.contains(ConnectivityResult.mobile) == true ||
      _result?.contains(ConnectivityResult.wifi) == true ||
      _result?.contains(ConnectivityResult.ethernet) == true;

  @override
  void onClose() async {
    await _subscription?.cancel();
    super.onClose();
  }
}
