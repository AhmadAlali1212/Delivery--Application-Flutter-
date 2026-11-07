import 'dart:io';

CheckInternet() async {
  try {
    var checkInternet = await InternetAddress.lookup("google.com");

    if (checkInternet.isNotEmpty && checkInternet[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  } catch (e) {
    return false;
  }
}
