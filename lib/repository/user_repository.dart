import 'package:dio/dio.dart';
import '../models/user.dart';

class UserRepository {
  final Dio dio = Dio();

  Future<List<User>> fetchUsers() async {
    try {
      print('Fetching users from API...');
      final response = await dio.get('https://dummyjson.com/users');
      print('Response received: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['users'];
        return data.map((user) => User.fromJson(user)).toList();
      } else {
        print('Failed to load users, status code: ${response.statusCode}');
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load users: $e');
    }
  }
}
