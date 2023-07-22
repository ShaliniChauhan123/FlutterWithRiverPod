import 'dart:convert';

import 'package:flutter_application_1/graphql/mutations/user.dart';
import 'package:flutter_application_1/models/api_response.dart';
import 'package:flutter_application_1/services/graphql_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final GraphQLService _graphQLService;

  AuthRepository() : _graphQLService = GraphQLService();

  Future<ResponseModel> SignIn(String phoneNumber, String password) async {
    try {
      final variables = {'phoneNumber': phoneNumber, 'password': password};
      final response = await _graphQLService.call(
        query: SignInMutation,
        variables: variables,
        //withToken: true,
      );

      final jsonBody = json.decode(response.body);

      if (jsonBody.containsKey('errors')) {
        throw jsonBody;
      }

      final data = jsonBody['data'];
      // ignore: avoid_print
      print('12$data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = data['signin']['accessToken']['token'];
      prefs.setString('access_token', token);
      print('prefs$prefs');
//leave this data here by simply calling the mutation
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('access_token', data. );
      return ResponseModel(
        success: true,
        body: data,
      );
    } catch (error) {
      return ResponseModel(
        success: false,
        error: error,
      );
    }
  }
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());
