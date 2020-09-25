import 'package:http/http.dart' as http;

String _url = 'https://jsonplaceholder.typicode.com';

class UserData{
    static Future getUsers() {
    var url = _url + "/users";
    return http.get(url);
  }
}