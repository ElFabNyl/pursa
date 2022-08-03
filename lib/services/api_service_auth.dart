import 'dart:convert';

import 'package:get/get.dart';
import 'package:pursa/services/app_url_constants_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/authentification/sign up with email/sign_up_ctrl.dart';

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
    //we should store these infos locally
    SharedPreferences preferences = await SharedPreferences.getInstance();
    SignUpController controller = Get.find();
    preferences.remove("user_email");
    preferences.setString("user_email", controller.user_email.value);
    preferences.setBool(
        "checked_phone", controller.user_phone_was_checked.value);

    var url = Uri.parse(AppUrl.baseUrl + AppUrl.login);
    var body = jsonEncode({'email': email, 'password': password});
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    return jsonDecode(response.body);
  }

  /**this function is to register the user in the database
   * @params: code, first_name, last_name, password, phone, code_tel, country_code 
   */

  static register(
      String code,
      String first_name,
      String last_name,
      String password,
      String phone,
      String code_tel,
      String country_code) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    SignUpController controller = Get.find();

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
    //i first store these infos in the local storage for some next check
    preferences.remove("user_name");
    preferences.setString("user_name", controller.user_name.value);
    preferences.remove("user_email");
    preferences.setString("user_email", controller.user_email.value);
    preferences.remove("user_phone_number");
    preferences.setString(
        "user_phone_number", controller.user_phone_number.value);
    preferences.remove("user_code_tel");
    preferences.setString("user_code_tel", controller.user_code_tel.value);
    preferences.remove("user_come_from_web");
    preferences.setBool(
        "user_come_from_web", controller.user_come_from_web.value);

    //  i contact the API for distance database storage
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);
    preferences.remove("user_is_connected");
    preferences.setBool("user_is_connected", true);
    return jsonDecode(response.body);
  }

  /**this function is to update the phone number of the  user in the database
   * @params: code, code_tel
   */

  static Update(
    String phone,
    String code_tel,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = Uri.parse(AppUrl.baseUrl + AppUrl.update);
    var body = jsonEncode({
      'email': preferences.getString("user_email"),
      'lastname': preferences.getString("user_name"),
      'phone': phone,
      'code_tel': code_tel
    });

    //  i contact the API for distance database storage
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    return jsonDecode(response.body);
  }
}
