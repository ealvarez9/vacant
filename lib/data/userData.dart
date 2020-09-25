import 'package:http/http.dart' as http;

String _url = 'https://jsonplaceholder.typicode.com';

class UserData{

    //método que consulta el EndPoint de la API y retorna una lista de peliculas
    static Future getUsers() {
    var url = _url + "/users";
    return http.get(url);
  }
}