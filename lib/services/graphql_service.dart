import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:glue_app_mobile_flutter/utils/app_enums.dart';
// import 'package:glue_app_mobile_flutter/utils/custom_exceptions.dart';

enum NetworkRequestFailureStatus { failure, noInternet, illegalOperation }

class CustomNoNetworkException implements Exception {
  String message;
  CustomNoNetworkException(this.message);
}

class GraphQLService {
  // final String? _baseUrl;

  // GraphQLService() : _baseUrl = dotenv.env['BASE_URL'];

  Future<http.Response> call({
    required Object query,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
    String? imagesVarName,
    String? imagePath,
    bool withToken = true,
  }) async {
    // The API should not be called
    // Throw error if internet not connected
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   print('graphqs');
    //   throw CustomNoNetworkException(
    //     NetworkRequestFailureStatus.noInternet.toString(),
    //   );
    // }

    var apiHeaders = {
      'Content-Type': 'application/json',
    };

    if (withToken) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      if (token != null && token != '') {
        final jwt = JWT.decode(token);
        final exp = jwt.payload['exp'] * 1000;
        final isExpired = exp < DateTime.now().millisecondsSinceEpoch;

        if (isExpired) {
          await prefs.remove('access_token');
          // TODO: Logout from here
        }

        final authHeader = {
          'Authorization': 'Bearer $token',
        };

        apiHeaders = {
          ...apiHeaders,
          ...authHeader,
        };
      } else {
        // TODO: Logout from here
      }
    }

    if (headers != null && headers.isNotEmpty) {
      apiHeaders = {
        ...apiHeaders,
        ...headers,
      };
    }

    Uri uri = Uri.parse('https://api.qa.fifo.im/graphql');

    if (imagePath == null && imagePath == null) {
      var request = http.post(
        uri,
        headers: apiHeaders,
        body: json.encode({
          "query": query,
          "variables": variables ?? {},
        }),
      );

      http.Response response = await request;
      print('token${response.body}');
      return response;
      // ignore: unnecessary_null_comparison
    } else if (imagePath != null && imagePath != null) {
      var request = http.MultipartRequest('POST', uri);

      // TODO: Support for multiple images upload
      request.fields.addAll(({
        'operations': json.encode(
          {
            "query": query,
            "variables": variables,
          },
        ),
        'map': json.encode(
          {
            "0": ["variables.$imagesVarName"]
          },
        ),
      }));

      request.files.add(
        await http.MultipartFile.fromPath('0', imagePath),
      );

      request.headers.addAll(apiHeaders);

      http.StreamedResponse response = await request.send();
      return http.Response.fromStream(response);
    } else {
      throw CustomNoNetworkException(
        NetworkRequestFailureStatus.illegalOperation.toString(),
      );
    }
  }
}
