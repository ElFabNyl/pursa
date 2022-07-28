import 'dart:convert';

import 'package:get/get.dart';
import 'package:pursa/services/app_url_constants_service.dart';
import 'package:http/http.dart' as http;

class AuthentificationApiService {
  /**this function checks if the email exist in the database.
   * @param: email
   */

  static verifyEmailAddress(String email) async {
    var url = Uri.parse(AppUrl.baseUrl + AppUrl.checkEmailExistance);
    var body = jsonEncode({
      'email': email,
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    if (jsonDecode(response.body)["status"]) {
      return jsonDecode(response.body)["data"];
    } else {
      return jsonDecode(response.body)["status"];
    }
  }

  /**this code check the validity of the otp entered by the user
   * @param : OTP
   */

  static EmailOTPVerification(String otp) async {
    var url = Uri.parse(AppUrl.baseUrl + AppUrl.codeVerification);
    var body = jsonEncode({
      'code': otp,
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    return jsonDecode(response.body);
  }
}
