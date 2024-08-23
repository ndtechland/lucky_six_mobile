import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../1_models/game_type_model.dart';
import '../1_models/get_bank_model.dart';
import '../1_models/get_wallet_model.dart';
import '../1_models/price_list_model.dart';
import '../1_models/profile_model.dart';
import '../1_models/profiles.dart';
import '../constantt/fixed_texes.dart';

var prefs = GetStorage();
final box = GetStorage();

class ApiProvider {
  /// static var baseUrl = 'http://test.pswellness.in/';
  /// "https://api.hirejobindia.com/api/";

  static var baseUrl = FixedText.apiurl;

  //'https://api.hirejobindia.com/api/';

  //http://pswellness.in/
  //static var baseUrl1 = 'https://api.gyros.farm/';
  //'http://pswellness.in/';
  static String token = '';
  static String Id = '';
  static String userid = ''.toString();

  //static String Token = '';

  //static String catid = '';
  //static String productid = '';
  //static String orderid = '';
  ///static String Id = '';
  static String MedicineId = ''.toString();
  static String adminId = ''.toString();

  //static String userid = ''.toString();
  static String userId = ''.toString();
  static String employeeId = ''.toString();

  final box = GetStorage();

  ///TODO: here we have to add different api in this page...........
  /// TODO: from here user 1 section...........
  ///
  ///todo: payment api...

  // String _handleResponse(http.Response response) {
  //   if (response.statusCode == 200) {
  //     if (response.body.isEmpty) {
  //       throw EmptyResponseException('Response body is empty');
  //     }
  //     try {
  //       final responseBody = json.decode(response.body);
  //       if (responseBody.containsKey('payurl')) {
  //         return responseBody['payurl'];
  //       } else {
  //         throw KeyNotFoundException('Key "payurl" not found in response');
  //       }
  //     } catch (e) {
  //       throw JsonParsingException('Failed to parse response: $e');
  //     }
  //   } else {
  //     if (response.body.isEmpty) {
  //       throw EmptyResponseException('Error response body is empty');
  //     }
  //     try {
  //       final responseBody = json.decode(response.body);
  //       final errorMessage =
  //           responseBody['error_message'] ?? 'Failed to create payment request';
  //       throw PaymentRequestException(errorMessage);
  //     } catch (e) {
  //       throw JsonParsingException('Failed to create payment request: $e');
  //     }
  //   }
  // }

  ///todo: UserSignUpApi....game...1
  static Future<http.Response> UserSignUpApi(
    String name,
    String phonenumber,
    String email,
    String password,
    String confirmPassword,
  ) async {
    var url = "${baseUrl}Account/Registration";

    // Encode the body as JSON
    var body = jsonEncode({
      "name": name,
      "phonenumber": phonenumber,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    });

    print("Request Body: $body");
    print("Request URL: $url");

    // Send the HTTP POST request with JSON body and appropriate headers
    http.Response r = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json", // Set content-type to JSON
      },
      body: body,
    );

    if (r.statusCode == 200) {
      print("Success Response: ${r.body}");
      print("Successfullll: $body");

      Get.snackbar(
        "Message",
        r.body,
        duration: Duration(seconds: 2),
      );
    } else if (r.statusCode == 401) {
      Fluttertoast.showToast(
        msg: 'Registration Failed',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
      );
      Get.snackbar(
        "Message",
        r.body,
        duration: Duration(seconds: 2),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Registration Failed',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
      );
      print("Error Response: ${r.body}");
      Get.snackbar(
        "Error",
        r.body,
        duration: Duration(seconds: 2),
      );
    }

    // Ensure a response is always returned
    return r;
  }

  ///todo: login api.....game...2
  static Future<http.Response> UserLoginApi(
      String username, String password) async {
    var url = "${baseUrl}Account/Login";

    // Encode the body as JSON
    var body = jsonEncode({
      "username": username,
      "password": password,
    });

    print("Request Body: $body");
    print("Request URL: $url");

    // Send the HTTP POST request with JSON body and appropriate headers
    http.Response r = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json", // Set content-type to JSON
      },
      body: body,
    );

    if (r.statusCode == 200) {
      print("Success Response: ${r.body}");

      var responseBody = jsonDecode(r.body);

      // Save the id and token for future use
      var prefs = GetStorage();
      prefs.write("Id", responseBody['model']['id']);
      prefs.write("Token", responseBody['token']);

      // Save the id and token using SharedPreferences
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString("Id", responseBody['model']['id']);
      await sharedPrefs.setString("Token", responseBody['token']);

      ///check
      void checkStorage() {
        var prefs = GetStorage();
        print('Saved User ID: ${prefs.read("Id")}');
        print('Saved Token: ${prefs.read("Token")}');
      }

      var userId = prefs.read("Id").toString();
      var token = prefs.read("Token").toString();
      print('User ID: $userId');
      print('Token: $token');

      Fluttertoast.showToast(
          msg: "Login Successful ",
          // "${r.body}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white);
      //
      // print("Saved User ID: ${prefs.read('Id')}");
      // print("Saved Token: ${prefs.read('Token')}");
      ///todo: use in other screen ....
      //var userId = GetStorage().read("Id");
      // var token = GetStorage().read("Token");

      // Get.snackbar(
      //   "Success",
      //   "Login Successful",
      //   duration: Duration(seconds: 2),
      // );
    } else if (r.statusCode == 401) {
      Get.snackbar(
        "Unauthorized",
        "Incorrect username or password",
        duration: Duration(seconds: 2),
      );
    } else {
      print("Error Response: ${r.body}");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        duration: Duration(seconds: 2),
      );
    }

    // Ensure a response is always returned
    return r;
  }

  ///todo: get profile api....game ..3
  static PriofileApi() async {
    var prefs = GetStorage();

    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID2: $userId');
    print('Token2: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID2: $userId2');
    print('Token2: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }

    var url = '${baseUrl}Account/GetProfileDetail/$userId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      if (r.statusCode == 200) {
        print("Request URL: $url");
        print("Response Body: ${r.body}");

        // Parse the response body
        ProfileModel? geetprofilemodel = profileModelFromJson(r.body);
        print("Profile Email ID: ${geetprofilemodel.profile?.id}");
        return geetprofilemodel;
      } else {
        print("Failed to fetch profile. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching profile details: $error');
    }
    return null;
  }

  ///todo: update Profile lucky six.....3.0...SS..
  Future<http.Response?> updateProfile({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? address,
    String? pinCode,
    String? dob,
    String? profileImagePath,
    File? profileImage,
  }) async {
    try {
      var uri = Uri.parse('https://api.luckysix.in/api/Account/UpdateProfile');

      var request = http.MultipartRequest('POST', uri);

      var prefs = GetStorage();

      // Retrieve the saved user ID and token
      var userId = prefs.read("Id").toString();
      var token = prefs.read("Token").toString();
      print('User ID2: $userId');
      print('Token2: $token');

      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      // Retrieve the saved user ID and token
      var userId2 = sharedPrefs.getString("Id");
      var token2 = sharedPrefs.getString("Token");
      print('User ID2: $userId2');
      print('Token2: $token2');

      if (userId == null || token == null) {
        print('User ID or Token is null');
        return null;
      }

      request.fields['Id'] = userId!;
      request.fields['FullName'] = fullName!;
      request.fields['Phonenumber'] = phoneNumber!;
      request.fields['Email'] = email!;
      request.fields['Address'] = address!;
      request.fields['PinCode'] = pinCode!;
      request.fields['DOB'] = dob!;
      request.fields['ProfileImagePath'] = profileImagePath!;

      if (profileImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'ProfileImage',
          profileImage.path,
        ));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // Print the raw response to the console
      print('Raw response body: ${response.body}');
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating profile: $e');
    }
  }

  ///todo: get game type api....game ..3.01
  static GameTypeApi() async {
    var prefs = GetStorage();

    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID2: $userId');
    print('Token2: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID2: $userId2');
    print('Token2: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }

    var url = '${baseUrl}Home/GameTypeList';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      if (r.statusCode == 200) {
        print("Request URLxaa: $url");
        print("Response Bodyaxax: ${r.body}");

        // Parse the response body
        GameTypeModel? getgametypemodel = gameTypeModelFromJson(r.body);
        print("Game  ID: ${getgametypemodel.getGames?[0].id}");
        return getgametypemodel;
      } else {
        print("Failed to fetch Game. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching Game details: $error');
    }
    return null;
  }

  ///todo: get game price list api....game ..3.1....
  static GamePriceListApi(String? gameTypeId) async {
    var prefs = GetStorage();
    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID3: $userId');
    print('Token3: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID3: $userId2');
    print('Token3: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }
    //https://api.luckysix.in/api/Home/GamePriceByGameId?GameId=1

    var url = '${baseUrl}Home/GamePriceByGameId?GameId=$gameTypeId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      print("Request URLpricelist: $url");

      if (r.statusCode == 200) {
        print("Request URLpricelist: $url");
        print("Response URLpricebody: ${r.body}");

        // Parse the response body
        GamePriceListModel? getgameListmodel =
            gamePriceListModelFromJson(r.body);
        print("Game List ID: ${getgameListmodel.getGameAmount?[0].id}");
        return getgameListmodel;
      } else {
        print("Failed to fetch Game. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching Game details: $error');
    }
    return null;
  }

  ///todo: get game price list api....game ..3.1....
  static GamePriceListDoubleApi(String? gameTypeId) async {
    var prefs = GetStorage();
    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID3: $userId');
    print('Token3: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID3: $userId2');
    print('Token3: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }
    //https://api.luckysix.in/api/Home/GamePriceByGameId?GameId=1

    var url = '${baseUrl}Home/GamePriceByGameId?GameId=$gameTypeId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      print("Request URLpricelist: $url");

      if (r.statusCode == 200) {
        print("Request URLpricelist: $url");
        print("Response URLpricebody: ${r.body}");

        // Parse the response body
        GamePriceListModel? getgameListmodel =
            gamePriceListModelFromJson(r.body);
        print("Game List ID: ${getgameListmodel.getGameAmount?[0].id}");
        return getgameListmodel;
      } else {
        print("Failed to fetch Game. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching Game details: $error');
    }
    return null;
  }

  ///todo: get game price list api....game ..3.2....
  static GamePriceListSelfApi(String? gameTypeId) async {
    var prefs = GetStorage();
    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID3: $userId');
    print('Token3: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID3: $userId2');
    print('Token3: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }
    //https://api.luckysix.in/api/Home/GamePriceByGameId?GameId=1

    var url = '${baseUrl}Home/GamePriceByGameId?GameId=$gameTypeId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      print("Request URLpricelist: $url");

      if (r.statusCode == 200) {
        print("Request URLpricelist: $url");
        print("Response URLpricebody: ${r.body}");

        // Parse the response body
        GamePriceListModel? getgameListmodel =
            gamePriceListModelFromJson(r.body);
        print("Game List ID: ${getgameListmodel.getGameAmount?[0].id}");
        return getgameListmodel;
      } else {
        print("Failed to fetch Game. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching Game details: $error');
    }
    return null;
  }

  ///todo: forget password api.....game...4
  static Future<http.Response> ForgetPasswordApi(String username) async {
    var url = "${baseUrl}Account/Login";

    // Encode the body as JSON
    var body = jsonEncode({
      "username": username,
    });

    print("Request Body: $body");
    print("Request URL: $url");

    // Send the HTTP POST request with JSON body and appropriate headers
    http.Response r = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json", // Set content-type to JSON
      },
      body: body,
    );

    if (r.statusCode == 200) {
      print("Success Response: ${r.body}");

      var responseBody = jsonDecode(r.body);

      // Save the id and token for future use
      var prefs = GetStorage();
      prefs.write("Id", responseBody['model']['id']);
      prefs.write("Token", responseBody['token']);

      var userId = prefs.read("Id").toString();
      var token = prefs.read("Token").toString();
      print('User ID: $userId');
      print('Token: $token');
      //
      // print("Saved User ID: ${prefs.read('Id')}");
      // print("Saved Token: ${prefs.read('Token')}");
      ///todo: use in other screen ....
      //var userId = GetStorage().read("Id");
      // var token = GetStorage().read("Token");

      Get.snackbar(
        "Success",
        "Login Successful",
        duration: Duration(seconds: 2),
      );
    } else if (r.statusCode == 401) {
      Get.snackbar(
        "Unauthorized",
        "Incorrect username or password",
        duration: Duration(seconds: 2),
      );
    } else {
      print("Error Response: ${r.body}");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        duration: Duration(seconds: 2),
      );
    }

    // Ensure a response is always returned
    return r;
  }

  ///todo: get wallet api....game ..5
  static GetWalletApi() async {
    var prefs = GetStorage();
    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID55: $userId');
    print('Token55: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID5: $userId2');
    print('Token5: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }

    var url = '${baseUrl}Wallet/GetWalletAmount?UserId=$userId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      if (r.statusCode == 200) {
        print("Request URL: $url");
        print("Response Body: ${r.body}");

        // Parse the response body
        GetWallettModel? geetprofilemodel = getWallettModelFromJson(r.body);
        print("Profile Email ID: ${geetprofilemodel.getWallet?.id}");
        return geetprofilemodel;
      } else {
        print("Failed to fetch profile. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching profile details: $error');
    }
    return null;
  }

  ///todo: get wallet api....game ..5
  static GetBankDetailsApi() async {
    var prefs = GetStorage();
    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    var token = prefs.read("Token").toString();
    print('User ID66: $userId');
    print('Token66: $token');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Retrieve the saved user ID and token
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID6: $userId2');
    print('Token6: $token2');

    if (userId == null || token == null) {
      print('User ID or Token is null');
      return null;
    }

    var url = '${baseUrl}Home/GetBankDetail?UserId=$userId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          // "Authorization":
          //     "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      if (r.statusCode == 200) {
        print("Request URL: $url");
        print("Response Body: ${r.body}");
//GetBankModel getBankModelFromJson
        // Parse the response body
        GetBankModel? geetbankmodel = getBankModelFromJson(r.body);
        print("Profile Email ID: ${geetbankmodel.bankDetail?.id}");
        return geetbankmodel;
      } else {
        print("Failed to fetch profile. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching profile details: $error');
    }
    return null;
  }

  ///wallet post api..........................................wallet......section.....
  // static WalletPostApi(var walletAmount) async {
  //   //var url = baseUrl1 + 'api/AdminApi/AddWalletMoney';
  //   var url = '${baseUrl}Wallet/AddWalletAmount';
  //   var prefs = GetStorage();
  //
  //   // Retrieve the saved user ID and token
  //   var userId = prefs.read("Id").toString();
  //   print('User ID55: $userId');
  //
  //   SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  //
  //   // Retrieve the saved user ID and token
  //   var userId2 = sharedPrefs.getString("Id");
  //   var token2 = sharedPrefs.getString("Token");
  //   print('User ID5: $userId2');
  //   print('Token5: $token2');
  //
  //   if (userId == null || token == null) {
  //     print('User ID or Token is null');
  //     return null;
  //   }
  //   //
  //   // token = prefs.read("token").toString();
  //   // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
  //
  //   var body = {
  //     // "UserId": UserId,
  //     "userId": userId,
  //     "walletAmount": walletAmount,
  //   };
  //   // final headers = {"Authorization": "Bearer $token"};
  //
  //   print(body);
  //   http.Response r = await http.post(Uri.parse(url),
  //       headers: {
  //         "Content-Type": "application/json", // Set content-type to JSON
  //       },
  //       body: body);
  //   print(url);
  //   print(r.body);
  //   print(r.statusCode);
  //
  //   if (r.statusCode == 200) {
  //     print("urlafter200${url}");
  //     print("urlafter200body${r.body}");
  //
  //     //print(r.body);
  //     print(r.statusCode);
  //     //  var prefs = GetStorage();
  //     // // saved id..........
  //     //  prefs.write("Id".toString(), json.decode(r.body)['Id']);
  //     //  Id = prefs.read("Id").toString();
  //     //  print('kjkjkljjkl:${Id}');
  //     // Get.snackbar('Sucess', 'Added cart Sucessfully');
  //     return r;
  //   } else if (r.statusCode == 200) {
  //     Get.snackbar('message', r.body);
  //   } else {
  //     Get.snackbar('Error', r.body);
  //     return r;
  //   }
  // }

  static Future<http.Response?> WalletPostApi(var walletAmount) async {
    var url = '${baseUrl}Wallet/AddWalletAmount';
    var prefs = GetStorage();

    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    print('User ID55: $userId');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID5: $userId2');
    print('Token5: $token2');

    if (userId == null || token2 == null) {
      print('User ID or Token is null');
      return null;
    }

    var body = {
      "userId": userId,
      "walletAmount": walletAmount,
    };

    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json", // Set content-type to JSON
        "Authorization":
            "Bearer $token2", // Include the token in the headers if required by the API
      },
      body: json.encode(body), // Encode body as JSON
    );

    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      print("urlafter200${url}");
      print("urlafter200body${r.body}");
      return r;
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: Update bank profile....game....app...

  // static String apiUrl11 = "${baseUrl}Home/UpdateBankDetail";

  static String apiUrl11 = "${baseUrl}Home/UpdateBankDetail";

  Future<bool> updateBankDetail({
    ///required String userId,
    String? accountNo,
    String? accountHolderName,
    String? phone,
    String? email,
    String? bankName,
    String? ifsc,
    String? address,
    String? upiId,
  }) async {
    final url = Uri.parse(apiUrl11);

    var prefs = GetStorage();

    // Retrieve the saved user ID and token
    var userId = prefs.read("Id").toString();
    print('User ID55: $userId');

    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    var userId2 = sharedPrefs.getString("Id");
    var token2 = sharedPrefs.getString("Token");
    print('User ID5: $userId2');
    print('Token5: $token2');

    // Construct the request body with the required userId and optional fields
    final Map<String, dynamic> requestBody = {
      'userId': userId, // Required field
    };

    // Add optional fields if they are not null
    if (accountNo != null) requestBody['accountNo'] = accountNo;
    if (accountHolderName != null)
      requestBody['accountHolderName'] = accountHolderName;
    if (phone != null) requestBody['phone'] = phone;
    if (email != null) requestBody['email'] = email;
    if (bankName != null) requestBody['bankName'] = bankName;
    if (ifsc != null) requestBody['ifsc'] = ifsc;
    if (address != null) requestBody['address'] = address;
    if (upiId != null) requestBody['upiId'] = upiId;

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        // Add any necessary authorization headers here if needed
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      ///Get.offAll(Settingsss());

      // Handle success
      return true;
    } else {
      // Handle error
      return false;
    }
  }

  ///todo: end ....game ...api...
  ///

  ///user_ profile__update.........15 jun

  static String apiUrl7 = "${baseUrl}Account/UpdateProfile";

  static Future<http.Response> updateuserProfileApi(
    Map<String, String> formData,
    Uint8List profileImage,
    String profileImagePath,
  ) async {
    var uri = Uri.parse(apiUrl7);
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Add profile image as a file
    request.files.add(http.MultipartFile.fromBytes(
      'ProfileImage', // This should match the field name expected by your server
      profileImage,
      filename: profileImagePath, // Use the profileImagePath as the filename
      contentType:
          MediaType('image', 'jpeg'), // Use a MediaType based on the image type
    ));

    var response = await request.send();

    // Parse the response
    var httpResponse = await http.Response.fromStream(response);

    // Print the response data
    print('Response status: ${httpResponse.statusCode}');
    print('Response body: ${httpResponse.body}');

    if (httpResponse.statusCode == 200) {
      // Show success toast
      Fluttertoast.showToast(
        msg: "Profile Updated successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      // Show error toast
      Fluttertoast.showToast(
        msg:
            "Failed to Update Profile. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    return httpResponse;
  }

  ///change password api,,,,for user.......
  static Future<http.Response?> ChangePasswordApi(
      BuildContext context, // Added context parameter
      String CurrentPassword,
      String NewPassword,
      String ConfirmPassword) async {
    var prefs = GetStorage();

    // Read saved userId
    String userId = prefs.read("Id").toString();
    print('wwwuseridEE:$userId');

    var url = "${baseUrl}App/UserChangePassword";
    var body = jsonEncode({
      "currentPassword": CurrentPassword,
      "newPassword": NewPassword,
      "confirmPassword": ConfirmPassword,
      "userId": userId
    });

    print("loginnnn");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Password changed successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to change password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///

  // static Future<http.Response?> ChangePasswordApi(
  //     BuildContext context, // Added context parameter
  //     String CurrentPassword,
  //     String NewPassword,
  //     String ConfirmPassword) async {
  //   var prefs = GetStorage();
  //
  //   // Read saved userId
  //   String userId = prefs.read("Id").toString();
  //   print('wwwuseridEE:$userId');
  //
  //   var url = "${baseUrl}App/UserChangePassword";
  //   var body = jsonEncode({
  //     "CurrentPassword": CurrentPassword,
  //     "NewPassword": NewPassword,
  //     "ConfirmPassword": ConfirmPassword,
  //     "userId": userId
  //   });
  //
  //   print("loginnnn");
  //   print(body);
  //
  //   try {
  //     http.Response r = await http.post(
  //       Uri.parse(url),
  //       body: body,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     ).timeout(const Duration(seconds: 10));
  //
  //     print(r.body);
  //
  //     if (r.statusCode == 200) {
  //       var responseData = json.decode(r.body);
  //       var userId = responseData['loginProfile']['id'];
  //
  //       // Save user ID (assuming 'Id' is part of the response JSON)
  //       prefs.write("Id", userId);
  //       print('Saved userId: $userId');
  //
  //       // Show loading dialog
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (context) {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         },
  //       );
  //
  //       // Simulate a delay for async operations
  //       await Future.delayed(Duration(seconds: 1));
  //
  //       // Clear shared preferences
  //       SharedPreferences.getInstance().then((prefs) => prefs.clear());
  //
  //       // Hide loading dialog
  //       Get.back();
  //
  //       // Navigate to Login Page
  //       Get.offAll(() => Login());
  //
  //       // Show success toast
  //       Fluttertoast.showToast(
  //         msg: "Password changed successfully!",
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //       );
  //     } else if (r.statusCode == 401) {
  //       Fluttertoast.showToast(
  //         msg: "Unauthorized access. Status code: ${r.statusCode}",
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //       );
  //
  //       Get.snackbar('Error', r.body);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "Failed to change password. Status code: ${r.statusCode}",
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //       );
  //
  //       Get.snackbar('Error', r.body);
  //     }
  //
  //     return r;
  //   } on TimeoutException catch (_) {
  //     Fluttertoast.showToast(
  //       msg: "Network connection slow or disconnected",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //     );
  //
  //     return null;
  //   } on SocketException catch (_) {
  //     Fluttertoast.showToast(
  //       msg:
  //           "Network error: Unable to resolve host. Please check your internet connection.",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //     );
  //
  //     return null;
  //   } catch (error) {
  //     print('Network error: $error');
  //
  //     Fluttertoast.showToast(
  //       msg: "Network error: $error",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //     );
  //
  //     return null;
  //   }
  // }

  ///
  // static Future<http.Response> ChangePasswordApi(String CurrentPassword,
  //     String NewPassword, String ConfirmPassword) async {
  //   var prefs = GetStorage();
  //
  //   //saved userid..........
  //   //prefs.write("Id".toString(), json.decode(r.body)['Id']);
  //   userId = prefs.read("Id").toString();
  //   print('wwwuseridEE:${userId}');
  //   var url = "${baseUrl}App/UserChangePassword";
  //   //https://api.hirejobindia.com/api/App/UserChangePassword
  //   //App/UserChangePassword?userId=38
  //   var body = jsonEncode({
  //     "CurrentPassword": CurrentPassword,
  //     "NewPassword": NewPassword,
  //     "ConfirmPassword": ConfirmPassword,
  //     "userId": userId
  //   });
  //
  //   print("loginnnn");
  //   print(body);
  //   http.Response r = await http.post(
  //     Uri.parse(url),
  //     body: body,
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //   );
  //
  //   print(r.body);
  //
  //   if (r.statusCode == 200) {
  //     var responseData = json.decode(r.body);
  //     var userId = responseData['loginProfile']['id'];
  //
  //     // Save user ID (assuming 'Id' is part of the response JSON)
  //     prefs.write("Id", userId);
  //     print('Saved userId: $userId');
  //
  //     // Navigate to HomePage
  //     Get.to(() => Home());
  //
  //     Fluttertoast.showToast(
  //       msg: "Password Change successfully!",
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //     );
  //
  //     return r;
  //   } else if (r.statusCode == 401) {
  //     Get.snackbar('Message', r.body);
  //   } else {
  //     Get.snackbar('Error', r.body);
  //   }
  //
  //   return r;
  // }

  ///api 1.....all jobs....
  // static AllJobsApi() async {
  //   var url = "${baseUrl}Admin/GetCurrent_Opening";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var GetJobListModel = allJobsApiFromJson(r.body);
  //       return GetJobListModel;
  //     }
  //     print(url);
  //     print(r.body);
  //     print(r.statusCode);
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///api 2.....all cat....
  ///

  ///api 3.....all com....
  ///

  ///api 3.....all testimonial.........

  ///5.profile_api...
  static Future<GetProfileModel?> PriofileApi44() async {
    var prefs = GetStorage();

    // Retrieve the saved user ID and token
    String userId = prefs.read("Id") ?? "";
    String token = prefs.read("Token") ?? "";

    print('User ID: $userId');
    print('Token: $token');

    var url = '${baseUrl}App/GetProfile?userId=$userId';

    try {
      // Send the HTTP GET request with authorization header
      http.Response r = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization":
              "Bearer $token", // Include the token in the authorization header
          "Content-Type": "application/json",
        },
      );

      if (r.statusCode == 200) {
        print("Request URL: $url");
        print("Response Body: ${r.body}");

        // Parse the response body
        GetProfileModel? geetprofilemodel = getProfileModelFromJson(r.body);
        print("Profile Email ID: ${geetprofilemodel.profile!.email}");

        return geetprofilemodel;
      } else {
        print("Failed to fetch profile. Status code: ${r.statusCode}");
      }
    } catch (error) {
      print('Error fetching profile details: $error');
    }

    return null;
  }

  ///6.job apply successfully..........post...apis...
  static Future<http.Response> ApplyJobAPi(String JobId) async {
    userId = prefs.read("Id").toString();
    print('www:${userId}');
    var url = "${baseUrl}App/Applyjob";
    var body = jsonEncode({
      "JobId": JobId,
      "userID": userId,
    });

    print("jobapply");
    print(body);

    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('okapplyjob');
    print(r.body);

    if (r.statusCode == 200) {
      Get.snackbar(
        'Success',
        r.body,
        backgroundColor:
            Colors.green.shade300, // Set the background color to green
        snackPosition: SnackPosition.TOP, // Set the position of the snackbar
        duration: Duration(
            seconds: 2), // Set the duration of the snackbar to 2 seconds
      );
      // Navigate to HomePage
      //Get.to(() => Home());

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'Message',
        r.body,
        backgroundColor: Colors.red, // Set the background color to green
        snackPosition: SnackPosition.TOP, // Set the position of the snackbar
        duration: Duration(
            seconds: 2), // Set the duration of the snackbar to 2 seconds
      );
    } else {
      Get.snackbar(
        'Message',
        r.body,
        backgroundColor: Colors.grey, // Set the background color to green
        snackPosition: SnackPosition.TOP, // Set the position of the snackbar
        duration: Duration(
            seconds: 2), // Set the duration of the snackbar to 2 seconds
      );
    }
    return r;
  }

  ///6.job save successfully..........post...apis...
  static Future<http.Response> SaveJobAPi(String JobId) async {
    userId = prefs.read("Id").toString();
    print('www:${userId}');
    var url = "${baseUrl}App/AddBookmark";
    var body = jsonEncode({
      "JobId": JobId,
      "userID": userId,
    });

    print("jobsave");
    print(body);

    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('okapplyjob');
    print(r.body);

    if (r.statusCode == 200) {
      Get.snackbar(
        'Success',
        r.body,
        //"Job Saved Successfully",
        backgroundColor:
            Colors.green.shade300, // Set the background color to green
        snackPosition: SnackPosition.TOP, // Set the position of the snackbar
        duration: Duration(
            seconds: 2), // Set the duration of the snackbar to 2 seconds
      );
      // Navigate to HomePage
      /// Get.to(() => Home());

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'Message',
        r.body,
        backgroundColor: Colors.red, // Set the background color to green
        snackPosition: SnackPosition.TOP, // Set the position of the snackbar
        duration: Duration(
            seconds: 2), // Set the duration of the snackbar to 2 seconds
      );
    } else {
      Get.snackbar(
        'Message',
        r.body,
        backgroundColor: Colors.grey, // Set the background color to green
        snackPosition: SnackPosition.TOP, // Set the position of the snackbar
        duration: Duration(
            seconds: 2), // Set the duration of the snackbar to 2 seconds
      );
    }

    return r;
  }

  ///api 8....company_detail by com_id....

  ///todo: job on cat id........13 jun 2024...

  ///api 8.....all  saved jobs....
  // static AllAppliedJobsApi() async {
  //   userId = prefs.read("Id").toString();
  //   print('wwwsaved:${userId}');
  //   var url = "${baseUrl}App/GetJobapplyList?userId=$userId";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var GetJobAppliedListModel = allJobsAppliedApiFromJson(r.body);
  //       return GetJobAppliedListModel;
  //     }
  //     print(url);
  //     print(r.body);
  //     print(r.statusCode);
  //   } catch (error) {
  //     return;
  //   }
  // }
  //
  // ///api 9.....all  related  jobs....
  // static RelatedJobsbyJobIdApi(String? jobTitleid) async {
  //   // SharedPreferences preferences = await SharedPreferences.getInstance();
  //   // var JobTitleid1 = preferences.getString("JobTitleid1");
  //   // print("JobTitleid1: ${JobTitleid1}");
  //
  //   //JobTitleId
  //   //userId = prefs.read("Id").toString();
  //   //print('wwwsaved:${userId}');
  //   var url = "${baseUrl}App/RelatedJobList?jobtitleid=$jobTitleid";
  //
  //   print("relatedjobn");
  //
  //   print(url);
  //
  //   //  var url =
  //   //"http://api.hirejobindia.com/api/App/RelatedJobList?jobtitleid=$JobTitleId";
  //   //"${baseUrl}RelatedJobList?jobtitleid=11";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var RelatedJobByJobIdModel = relatedJobByJobIdModelFromJson(r.body);
  //       return RelatedJobByJobIdModel;
  //     }
  //     print(url);
  //     print(r.body);
  //     print(r.statusCode);
  //   } catch (error) {
  //     return;
  //   }
  // }
  //
  // ///api.9. delete  apis.....
  // static Future<bool> deleteJobApi(int bookmarkid) async {
  //   //https://api.hirejobindia.com/api/App/DeleteBookmarkjob/?id=5
  //   var url = "${baseUrl}App/DeleteBookmarkjob/?id=$bookmarkid";
  //
  //   final url2 = Uri.parse(url);
  //   final response = await http.delete(url2);
  //
  //   print("urldlt111");
  //   print(url);
  //
  //   if (response.statusCode == 200) {
  //     print("urldlt");
  //     print(url);
  //     Get.to(Bookmark());
  //
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  ///

  ///

  ///registration....
  // static Future<http.Response> createProfile(
  //     Map<String, dynamic> formData) async {
  //   const String apiUrl =
  //       'https://api.hirejobindia.com/api/Login/createProfile';
  //
  //   try {
  //     final http.Response response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: formData,
  //     );
  //     print("data${formData}");
  //
  //     return response;
  //   } catch (error) {
  //     throw Exception('Failed to create profile: $error');
  //   }
  // }

  ///

  static String apiUrl2 = "${baseUrl}Login/createProfile";

  //var url = "${baseUrl}App/DeleteBookmarkjob/?id=$jobId";
  //static const String apiUrl = 'https://api.hirejobindia.com/api/Login/createProfile';
  ///

  ///state api....
  ///state Api get...........................
  // static Future<List<StateModelss>> getSatesApi() async {
  //   var url = "${baseUrl}EmployeeApi/Getstate";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var statesData = stateModelFromJson(r.body);
  //       return statesData.data;
  //     } else {
  //       return [];
  //     }
  //   } catch (error) {
  //     return [];
  //   }
  // }

  ///todo: city by stste id...
  // static Future<List<CityModell>> getCitiesApi(String stateID) async {
  //   var url = "${baseUrl}EmployeeApi/getcity?stateid=$stateID";
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       var citiesData = cityModelFromJson(r.body);
  //       return citiesData.data;
  //     } else {
  //       return [];
  //     }
  //   } catch (error) {
  //     return [];
  //   }
  // }

  ///4.login_employeee..........post...apis...
  static Future<http.Response> EmployeeLoginApi(
      String employee_ID, String password) async {
    var url = "${baseUrl}Login/EmployeeLogin";
    var body = jsonEncode({
      "employee_ID": employee_ID,
      "password": password,
    });

    print("loginnnnemployee");
    print(body);

    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print(r.body);

    if (r.statusCode == 200) {
      var responseData = json.decode(r.body);
      var employeeId = responseData['loginemp']['id'];
      var token = responseData['token'];
      //token
      // Save employee ID and token
      final storage = GetStorage();
      storage.write("Id", employeeId);
      storage.write("token", token);

      print('Saved employeeId: $employeeId');
      print('Saved token: $token');

      // Save user ID (assuming 'Id' is part of the response JSON)
      prefs.write("Id", employeeId);
      print('Saved employeeId: $employeeId');

      ///token...
      prefs.write("token".toString(), json.decode(r.body)['token']);
      token = prefs.read("token").toString();
      print("tokennnn");
      print(token);
      // Navigate to HomePage
      //Get.to(() => Home());

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('Message', 'Unauthorized: ${r.body}');
    } else {
      Get.snackbar('Error', 'Error: ${r.body}');
    }

    return r;
  }

  ///profile personal_info_employee....5...

  // static PriofilePersonalEmployeeApi() async {
  //   var prefs = GetStorage();
  //
  //   // Read saved user id and token
  //   userId = prefs.read("Id").toString();
  //   print('wwwuseridEE: $userId');
  //
  //   token = prefs.read("token").toString();
  //   print('token: $token');
  //   var url = '${baseUrl}EmployeeApi/GetEmployeePresnolInfo';
  //   try {
  //     // Add the token to the headers
  //     Map<String, String> headers = {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json'
  //     };
  //
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     if (r.statusCode == 200) {
  //       print("url");
  //       print(url);
  //       //GetProfileEmployeePersonalModel? geetprofilepersonalmodel =
  //          // getProfileEmployeePersonalModelFromJson(r.body);
  //       print(
  //           "profileinfo: ${geetprofilepersonalmodel.data!.personalEmailAddress}");
  //       return geetprofilepersonalmodel;
  //     } else {
  //       print('Failed to load profile information');
  //     }
  //   } catch (error) {
  //     print('profileedetaileror: $error');
  //   }
  // }

  ///profile basic_info_employee....6...

  ///offer_employee_appointment_api...8

  ///dashbord...employee....
  // static getDashboardApi() async {
  //   var prefs = GetStorage();
  //
  //   // Read saved user id and token
  //   userId = prefs.read("Id").toString();
  //   print('wwwuseridEE: $userId');
  //
  //   token = prefs.read("token").toString();
  //   print('token: $token');
  //   var url = '${baseUrl}EmployeeApi/Dashboard';
  //   try {
  //     // Add the token to the headers
  //     Map<String, String> headers = {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json'
  //     };
  //
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     if (r.statusCode == 200) {
  //       print("url");
  //       print(url);
  //       DashbordModel? geetdashbord = dashbordModelFromJson(r.body);
  //       print("profileinfobnk: ${geetdashbord.data?.completionPercentage!}");
  //       return geetdashbord;
  //     } else {
  //       print('Failed to load dashboard');
  //     }
  //   } catch (error) {
  //     print('profileedetaileror: $error');
  //   }
  // }

  ///support comman for both.....

  ///static Future<List<StateModelss>> getSatesApi() async {
  //     var url = "${baseUrl}EmployeeApi/Getstate";
  //     try {
  //       http.Response r = await http.get(Uri.parse(url));
  //       print(r.body.toString());
  //       if (r.statusCode == 200) {
  //         var statesData = stateModelFromJson(r.body);
  //         return statesData.data;
  //       } else {
  //         return [];
  //       }
  //     } catch (error) {
  //       return [];
  //     }
  //   }

  ///todo: leave...apply..dropdown..type.employee

  //apply leave employee..............
  static String apiUrl4 = "${baseUrl}EmployeeApi/ApplyLeaveNew";
  static Future<http.Response> ApplyLeave(Map<String, String> formData) async {
    var uri = Uri.parse(apiUrl4);
    var request = http.MultipartRequest('POST', uri);

    // Print form data
    print('Form Data:');
    formData.forEach((key, value) {
      print('$key: $value');
      request.fields[key] = value;
    });

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    ///token
    String token = GetStorage().read("token").toString();

    // Add headers
    request.headers['Authorization'] = 'Bearer $token';

    // Send the request
    var response = await request.send();

    // Parse the response
    var httpResponse = await http.Response.fromStream(response);
    // Print the entire response body
    print('Response body: ${httpResponse.body}');

    if (httpResponse.statusCode == 200) {
      print('Response body200: ${httpResponse.body}');

      // Assuming the response body contains the user ID in JSON format
      //var jsonResponse = jsonDecode(httpResponse.body);
      //var userId = jsonResponse['loginProfile']['id'];

      // Extract the user ID from getData

      // Save the user ID using GetStorage
      //final storage = GetStorage();
      // storage.write('userId', userId);

      // Print the user ID
      ///print('Saved user ID: $userId');
      // Show success toast
      Fluttertoast.showToast(
        msg: "Apply Leave successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      print('Failed to apply Leave. Status code: ${httpResponse.statusCode}');

      Fluttertoast.showToast(
        msg: "Failed to apply Leave. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    return httpResponse;
  }

  ///update_personal_profile..wmployee.

  static String apiUrl5 = "${baseUrl}EmployeeApi/EmployeePresnolInfo";
  static Future<http.Response> updatePersonal(
    Map<String, String> formData,
    List<Uint8List> aadharFileContent,
    String Aadharbase64,
    Uint8List panFileContent,
    String Panbase64,
  ) async {
    var uri = Uri.parse(apiUrl5);
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
      print('Field: $key, Value: $value'); // Print each form field
    });

    // Add Aadharbase64 and Panbase64 fields to the form data
    request.fields['Aadharbase64'] = Aadharbase64;
    request.fields['Panbase64'] = Panbase64;

    // Helper function to determine the MediaType based on the file extension
    MediaType getMediaType(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          return MediaType('image', 'jpeg');
        case 'png':
          return MediaType('image', 'png');
        case 'pdf':
          return MediaType('application', 'pdf');
        default:
          throw Exception('Unsupported file type');
      }
    }

    MediaType getMediaType2(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          return MediaType('image', 'jpeg');
        case 'png':
          return MediaType('image', 'png');
        case 'pdf':
          return MediaType('application', 'pdf');
        default:
          throw Exception('Unsupported file type');
      }
    }

    // Add Aadhar image files
    for (int i = 0; i < aadharFileContent.length; i++) {
      request.files.add(http.MultipartFile.fromBytes(
          'Aadharbase64', // Use array notation if multiple files are allowed
          aadharFileContent[i],
          filename:
              Aadharbase64, // Use a generic filename with index for each Aadhar file
          contentType: getMediaType(Aadharbase64)));
    }

    // Add PAN image file
    request.files.add(http.MultipartFile.fromBytes('Panbase64', panFileContent,
        filename: Panbase64,
        // Use the file path as the filename for PAN
        contentType: getMediaType2(Panbase64)

        //contentType:
        //MediaType('application', 'pdf'), // Use MediaType from http_parser
        ));

    // Add headers
    String token = GetStorage().read("token").toString();
    request.headers['Authorization'] = 'Bearer $token';

    // Send the request
    var response = await request.send();

    // Handle the response
    var httpResponse = await http.Response.fromStream(response);
    print('Response body: ${httpResponse.body}');

    if (httpResponse.statusCode == 200) {
      // Success
      var jsonResponse = jsonDecode(httpResponse.body);
      //var userId = jsonResponse['loginProfile']['id'];

      // Show success toast
      Fluttertoast.showToast(
        msg: "Profile update successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      // Error
      print(
          'Failed to update profile. Status code: ${httpResponse.statusCode}');
      Fluttertoast.showToast(
        msg:
            "Failed to update profile. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return httpResponse;
  }

  ///update bank employee....
//user signup..............

  //  static String apiUrl5 = "${baseUrl}EmployeeApi/EmployeePresnolInfo";

  static String apiUrl6 = "${baseUrl}EmployeeApi/EmployeeBankDetail";
  static Future<http.Response> updateBankEmployeeApi(
    Map<String, String> formData,
    Uint8List cvFileContent,
    String Chequebase64,
  ) async {
    var uri = Uri.parse(apiUrl6);
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Helper function to determine the MediaType based on the file extension
    MediaType getMediaType(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          return MediaType('image', 'jpeg');
        case 'png':
          return MediaType('image', 'png');
        case 'pdf':
          return MediaType('application', 'pdf');
        default:
          throw Exception('Unsupported file type');
      }
    }

    // Add file field
    request.files.add(http.MultipartFile.fromBytes(
        'Chequebase64', // The name of the file field
        cvFileContent,
        filename: Chequebase64,
        // Use the file name from the parameter
        contentType: getMediaType(Chequebase64)

        //contentType:
        //MediaType('application', 'pdf'), // Use MediaType from http_parser
        ));

    // Get token from GetStorage
    final storage = GetStorage();
    var token = storage.read('token');

    // Set token in headers
    request.headers['Authorization'] = 'Bearer $token';

    // Send the request
    var response = await request.send();

    // Parse the response
    var httpResponse = await http.Response.fromStream(response);

    // Print the response data
    print('Response status: ${httpResponse.statusCode}');
    print('Response body: ${httpResponse.body}');

    if (httpResponse.statusCode == 200) {
      // Show success toast
      Fluttertoast.showToast(
        msg: "Bank Updated successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      // Show error toast
      Fluttertoast.showToast(
        msg: "Failed to Update Bank. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    return httpResponse;
  }

  ///todo: update profile picture....employee....

  static String apiUrl9 = "${baseUrl}EmployeeApi/EmpUpdateprofilepicture";
  //https://api.hirejobindia.com/api/EmployeeApi/EmpUpdateprofilepicture
  static Future<http.Response> updateProfileEmployeeApi(
    Uint8List cvFileContent3,
    String Empprofile,
  ) async {
    var uri = Uri.parse(apiUrl9);
    var request = http.MultipartRequest('POST', uri);

    // Helper function to determine the MediaType based on the file extension
    MediaType getMediaType(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          return MediaType('image', 'jpeg');
        case 'png':
          return MediaType('image', 'png');
        default:
          throw Exception('Unsupported file type');
      }
    }

    // Add file field
    request.files.add(http.MultipartFile.fromBytes(
      'Empprofile', // The name of the file field
      cvFileContent3,
      filename: Empprofile,
      contentType: getMediaType(Empprofile),
    ));

    // Get token from GetStorage
    final storage = GetStorage();
    var token = storage.read('token');

    // Set token in headers
    request.headers['Authorization'] = 'Bearer $token';

    // Send the request
    var response = await request.send();

    // Parse the response
    var httpResponse = await http.Response.fromStream(response);

    // Print the response data
    print('Response status: ${httpResponse.statusCode}');
    print('Response body: ${httpResponse.body}');

    // Show toast based on response
    if (httpResponse.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Profile updated successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      Fluttertoast.showToast(
        msg:
            "Failed to update profile. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    return httpResponse;
  }

  ///change password api,,,,for employee.......
  static Future<http.Response?> ChangePasswordEmployeeApi(
      BuildContext context, // Added context parameter
      String CurrentPassword,
      String NewPassword,
      String ConfirmPassword) async {
    var prefs = GetStorage();

    // Read saved userId
    String employeeId = prefs.read("Id").toString();
    print('wwwuseridEE:$employeeId');
    //employeeId

    var url = "${baseUrl}App/EmployeeChangePassword";
    var body = jsonEncode({
      "userId": employeeId,
      "currentPassword": CurrentPassword,
      "newPassword": NewPassword,
      "confirmPassword": ConfirmPassword,
    });

    print("loginnnn");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Password changed successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to change password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///payment get api......

  // static EmployeePaymentGetApi() async {
  //   var prefs = GetStorage();
  //   // Read saved user id and token
  //   userId = prefs.read("Id").toString();
  //   print('wwwuseridEE: $userId');
  //
  //   token = prefs.read("token").toString();
  //   print('token: $token');
  //   var url = '${baseUrl}EmployeeApi/GetJobamount';
  //   //https://api.hirejobindia.com/api/EmployeeApi/GetJobamount
  //   try {
  //     // Add the token to the headers
  //     Map<String, String> headers = {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json'
  //     };
  //
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     if (r.statusCode == 200) {
  //       print("url");
  //       print(url);
  //       GetPaymentModel? geetemployepaymentmodel =
  //           getPaymentModelFromJson(r.body);
  //       print("profilepaymentinfo: ${geetemployepaymentmodel.data!.toInt()}");
  //       return geetemployepaymentmodel;
  //     } else {
  //       print('Failed to load profile information');
  //     }
  //   } catch (error) {
  //     print('profileedetaileror: $error');
  //   }
  // }

  ///
//   static String apiUrl6 = "$baseUrl/EmployeeApi/EmployeeBankDetail";
//
//   static Future<http.Response> updateBankEmployeeApi(
//     Map<String, String> formData,
//     Uint8List cvFileContent,
//     String Chequebase64,
//   ) async {
//     var uri = Uri.parse(apiUrl6);
//     var request = http.MultipartRequest('POST', uri);
//
//     // Add form fields
//     formData.forEach((key, value) {
//       request.fields[key] = value;
//     });
//
//     // Add file field
//     request.files.add(http.MultipartFile.fromBytes(
//       'Chequebase64', // The name of the file field
//       cvFileContent,
//       filename: Chequebase64, // Use the file name from the parameter
//       contentType:
//           MediaType('application', 'pdf'), // Use MediaType from http_parser
//     ));
//
//     // Get token from GetStorage
//     final storage = GetStorage();
//     var token = storage.read('token');
//
//     // Set token in headers
//     request.headers['Authorization'] = 'Bearer $token';
//
//     // Send the request
//     var response = await request.send();
//
//     // Parse the response
//     var httpResponse = await http.Response.fromStream(response);
//     if (httpResponse.statusCode == 200) {
//       // Show success toast
//       Fluttertoast.showToast(
//         msg: "Profile created successfully!",
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//       );
//     } else {
//       // Show error toast
//       Fluttertoast.showToast(
//         msg: "Failed to Update Bank. Status code: ${httpResponse.statusCode}",
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//
//     return httpResponse;
//   }

  ///

// static String apiUrl5 = "${baseUrl}EmployeeApi/EmployeePresnolInfo";
//
// static Future<http.Response> updatePersonal(
//   Map<String, String> formData,
//   List<Uint8List> aadharFileContent1,
//   String Aadharbase64,
//   Uint8List panFileContent,
//   String Panbase64,
// ) async {
//   var uri = Uri.parse(apiUrl5);
//   var request = http.MultipartRequest('POST', uri);
//
//   // Add form fields
//   formData.forEach((key, value) {
//     request.fields[key] = value;
//     print('Field: $key, Value: $value'); // Print each form field
//   });
//
//   // Helper function to determine the MediaType based on the file extension
//   MediaType getMediaType(String filename) {
//     String ext = filename.split('.').last.toLowerCase();
//     switch (ext) {
//       case 'jpg':
//       case 'jpeg':
//         return MediaType('image', 'jpeg');
//       case 'png':
//         return MediaType('image', 'png');
//       case 'pdf':
//         return MediaType('application', 'pdf');
//       default:
//         throw Exception('Unsupported file type');
//     }
//   }
//
//   // Add Aadhar image files
//   for (int i = 0; i < aadharFileContent1.length; i++) {
//     request.files.add(http.MultipartFile.fromBytes(
//       'AadharFile[]', // Use array notation if multiple files are allowed
//       aadharFileContent1[i],
//       filename: Aadharbase64,
//       contentType: getMediaType(Aadharbase64),
//     ));
//   }
//
//   // Add PAN image file
//   request.files.add(http.MultipartFile.fromBytes(
//     'PanFile',
//     panFileContent,
//     filename: Panbase64,
//     contentType: getMediaType(Panbase64),
//   ));
//
//   // Add headers
//   String token = GetStorage().read("token").toString();
//   request.headers['Authorization'] = 'Bearer $token';
//
//   // Send the request
//   var response = await request.send();
//   var httpResponse = await http.Response.fromStream(response);
//
//   // Print the entire response body
//   print('Response body: ${httpResponse.body}');
//
//   if (httpResponse.statusCode == 200) {
//     var jsonResponse = jsonDecode(httpResponse.body);
//     var userId = jsonResponse['loginProfile']['id'];
//
//     // Save the user ID using GetStorage
//     final storage = GetStorage();
//     storage.write('userId', userId);
//
//     // Print the user ID
//     print('Saved user ID: $userId');
//
//     // Show success toast
//     Fluttertoast.showToast(
//       msg: "Profile created successfully!",
//       backgroundColor: Colors.green,
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.CENTER,
//     );
//   } else {
//     print(
//         'Failed to create profile. Status code: ${httpResponse.statusCode}');
//     Fluttertoast.showToast(
//       msg:
//           "Failed to create profile. Status code: ${httpResponse.statusCode}",
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//   return httpResponse;
// }

  ///
//   static Future<List<StateModelss>> getSatesApi() async {
//     var url = "${baseUrl}EmployeeApi/Getstate";
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       print(r.body.toString());
//       if (r.statusCode == 200) {
//         var statesData = stateModelFromJson(r.body);
//         return statesData.data;
//       } else {
//         return [];
//       }
//     } catch (error) {
//       return [];
//     }
//   }
  ///
}

///todo: device  user token for user........
//  //login with plus cart api gyros api 19.....................................
//
//   static cartplusApi(
//     var productId,
//   ) async {
//     var url = baseUrl + 'api/ProductApi/PlusAddToCart/$productId';
//     var prefs = GetStorage();
//     //saved id..........
//
//     final userId = prefs.read("Id").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&okoko:${userId}');
//
//     token = prefs.read("token").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
//     var body = {
//       "Id": userId,
//     };
//     final headers = {"Authorization": "Bearer $token"};
//
//     print(body);
//     http.Response r =
//         await http.post(Uri.parse(url), body: body, headers: headers);
//     print(r.body);
//     print(r.statusCode);
//
//     if (r.statusCode == 200) {
//       return r;
//     } else {
//       Get.snackbar('Error', 'not increase');
//       return r;
//     }
//   }
//
//   //login with decrease cart api gyros api 20..................................
//
//   static cartminusApi(
//     var productId,
//   ) async {
//     var url = baseUrl + 'api/ProductApi/DeleteAddToCart/$productId';
//
//     var prefs = GetStorage();
//     //saved id..........
//
//     final userId = prefs.read("Id").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&okoko:${userId}');
//
//     token = prefs.read("token").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
//     var body = {
//       "Id": userId,
//     };
//     final headers = {"Authorization": "Bearer $token"};
//
//     print(body);
//     http.Response r =
//         await http.post(Uri.parse(url), body: body, headers: headers);
//     print(r.body);
//     print(r.statusCode);
//
//     if (r.statusCode == 200) {
//       var data = jsonDecode(r.body.toString());
//       if (r.statusCode == 200) {
//         Get.snackbar('message', "success");
//       } else {
//         Get.snackbar('message', data["error"]);
//       }
//       return r;
//     } else {
//       // Get.snackbar('message', data["stat"]);
//       return r;
//     }
//   }
//
//   //sub_address_by_id  gyros api 21.....................................

///.....
//  //login with email api gyros api 2..................................
//
//   static LoginEmailApi(
//     var Email,
//     var PassWord,
//   ) async {
//     var url = baseUrl + 'api/AdminApi/LoginWithEmail';
//
//     var body = {
//       "Email": Email,
//       "PassWord": PassWord,
//     };
//     print(body);
//     http.Response r = await http.post(
//       Uri.parse(url), body: body,
//       //headers: headers
//     );
//     print(r.body);
//     if (r.statusCode == 200) {
//       var prefs = GetStorage();
//       //saved id..........
//       prefs.write("Id".toString(), json.decode(r.body)['Id']);
//       Id = prefs.read("Id").toString();
//       print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
//
//       //saved token.........
//       prefs.write("token".toString(), json.decode(r.body)['token']);
//       token = prefs.read("token").toString();
//       print(token);
//       return r;
//     } else if (r.statusCode == 401) {
//       Get.snackbar('message', r.body);
//     } else {
//       Get.snackbar('Error', r.body);
//       return r;
//     }
//   }

///todo: apdate profile info in image...123333....
//  ///update_personal_profile..wmployee.
//
//   static String apiUrl5 = "${baseUrl}EmployeeApi/EmployeePresnolInfo";
//   static Future<http.Response> updatePersonal(
//     Map<String, String> formData,
//     List<Uint8List> aadharFileContent,
//     String Aadharbase64,
//     Uint8List panFileContent,
//     String Panbase64,
//   ) async {
//     var uri = Uri.parse(apiUrl5);
//     var request = http.MultipartRequest('POST', uri);
//
//     // Add form fields
//     formData.forEach((key, value) {
//       request.fields[key] = value;
//       print('Field: $key, Value: $value'); // Print each form field
//     });
//
//     // Add Aadharbase64 and Panbase64 fields to the form data
//     request.fields['Aadharbase64'] = Aadharbase64;
//     request.fields['Panbase64'] = Panbase64;
//
//     // Helper function to determine the MediaType based on the file extension
//     MediaType getMediaType(String filename) {
//       String ext = filename.split('.').last.toLowerCase();
//       switch (ext) {
//         case 'jpg':
//         case 'jpeg':
//           return MediaType('image', 'jpeg');
//         case 'png':
//           return MediaType('image', 'png');
//         case 'pdf':
//           return MediaType('application', 'pdf');
//         default:
//           throw Exception('Unsupported file type');
//       }
//     }
//
//     // Add Aadhar image files
//     for (int i = 0; i < aadharFileContent.length; i++) {
//       request.files.add(http.MultipartFile.fromBytes(
//         'Aadharbase64', // Use array notation if multiple files are allowed
//         aadharFileContent[i],
//         filename:
//             Aadharbase64, // Use a generic filename with index for each Aadhar file
//         contentType:
//             MediaType('application', 'pdf'), // Use MediaType from http_parser
//       ));
//     }
//
//     // Add PAN image file
//     request.files.add(http.MultipartFile.fromBytes(
//       'Panbase64',
//       panFileContent,
//       filename: Panbase64, // Use the file path as the filename for PAN
//       contentType:
//           MediaType('application', 'pdf'), // Use MediaType from http_parser
//     ));
//
//     // Add headers
//     String token = GetStorage().read("token").toString();
//     request.headers['Authorization'] = 'Bearer $token';
//
//     // Send the request
//     var response = await request.send();
//
//     // Handle the response
//     var httpResponse = await http.Response.fromStream(response);
//     print('Response body: ${httpResponse.body}');
//
//     if (httpResponse.statusCode == 200) {
//       // Success
//       var jsonResponse = jsonDecode(httpResponse.body);
//       //var userId = jsonResponse['loginProfile']['id'];
//
//       // Show success toast
//       Fluttertoast.showToast(
//         msg: "Profile update successfully!",
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//       );
//     } else {
//       // Error
//       print(
//           'Failed to update profile. Status code: ${httpResponse.statusCode}');
//       Fluttertoast.showToast(
//         msg:
//             "Failed to update profile. Status code: ${httpResponse.statusCode}",
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//     return httpResponse;
//   }

class EmptyResponseException implements Exception {
  final String message;
  EmptyResponseException(this.message);
}

class KeyNotFoundException implements Exception {
  final String message;
  KeyNotFoundException(this.message);
}

class JsonParsingException implements Exception {
  final String message;
  JsonParsingException(this.message);
}

class PaymentRequestException implements Exception {
  final String message;
  PaymentRequestException(this.message);
}
