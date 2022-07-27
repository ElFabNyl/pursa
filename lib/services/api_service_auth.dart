import 'dart:convert';

import 'package:pursa/services/app_url_constants_service.dart';
import 'package:http/http.dart' as http;

class AuthentificationApiService {
  /**cette fonction verifie l'existance d'une addresse email en BD.
   * @param: email
   */

  static verifyEmailAddress(String email) async {
    var url = Uri.parse(AppUrl.baseUrl + AppUrl.checkEmailExistance);
    var body = jsonEncode({
      'email': email,
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    return jsonDecode(response.body)["status"];
  }
}
