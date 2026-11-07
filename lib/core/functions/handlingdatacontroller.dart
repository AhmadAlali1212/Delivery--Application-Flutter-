import 'package:deliveryapplication/core/constant/status_requset.dart';

dynamic handdlingData(response) {
  if (response is StatusRequset) {
    return response;
  } else {
    return StatusRequset.success;
  }
}
