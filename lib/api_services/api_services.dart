import 'package:http/http.dart' as http;
import '../models/users_details.dart';

class ApiServices {
  // Method to fetch user details
  static Future<UsersDetailsModel> getDetails() async {
    // Corrected Uri parsing and URL string
    var response = await http.get(Uri.parse('https://dummyjson.com/users'));

    // You may want to handle the response, for example:
    if (response.statusCode == 200) {
      // Parse the JSON and return the data
      return UsersDetailsModel.fromJson(response.body as Map<String, dynamic>);
    } else {
      // Handle the error
      throw Exception('Failed to load user details');
    }
  }
}
