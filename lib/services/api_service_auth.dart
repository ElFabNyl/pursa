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

  /**this function check the validity of the otp entered by the user
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

  /**this function is to login the user
   * @params :email, password
   */

  static login(String email, String password) async {
    var url = Uri.parse(AppUrl.baseUrl + AppUrl.login);
    var body = jsonEncode({'email': email, 'password': password});
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    return jsonDecode(response.body);
  }

  /**this function is to register the user in the database
   * 
   * @params: code, fn, sn, password, phone, code_tel 
   */

  static register(String code, String first_name,
      String last_name, String password, String phone, String code_tel, String country_code) async {
    var url = Uri.parse(AppUrl.baseUrl + AppUrl.register);
    var body = jsonEncode({
      'code': code,
      'firstname': first_name,
      'lastname': last_name,
      'password': password,
      'phone': phone,
      'code_tel': code_tel,
      'country_code': country_code
      
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    return jsonDecode(response.body);
  }
}
