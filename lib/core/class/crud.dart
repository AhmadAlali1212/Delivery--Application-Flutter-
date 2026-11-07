import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequset, Map>> postData(String linkuri, Map data) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(Uri.parse(linkuri), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return Left(StatusRequset.serviceFailure);
        }
      } else {
        return Left(StatusRequset.OfflineFailure);
      }
    } catch (_) {
      return Left(StatusRequset.exceptionFailure);
    }
  }
}
