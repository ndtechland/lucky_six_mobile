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

  String _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        throw EmptyResponseException('Response body is empty');
      }
      try {
        final responseBody = json.decode(response.body);
        if (responseBody.containsKey('payurl')) {
          return responseBody['payurl'];
        } else {
          throw KeyNotFoundException('Key "payurl" not found in response');
        }
      } catch (e) {
        throw JsonParsingException('Failed to parse response: $e');
      }
    } else {
      if (response.body.isEmpty) {
        throw EmptyResponseException('Error response body is empty');
      }
      try {
        final responseBody = json.decode(response.body);
        final errorMessage =
            responseBody['error_message'] ?? 'Failed to create payment request';
        throw PaymentRequestException(errorMessage);
      } catch (e) {
        throw JsonParsingException('Failed to create payment request: $e');
      }
    }
  }

  //user signup..............
  static String apiUrl = "${baseUrl}Login/createProfile";

  static Future<http.Response> createProfile(Map<String, String> formData,
      Uint8List cvFileContent, String cvFileName) async {
    var uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Add file field
    request.files.add(http.MultipartFile.fromBytes(
      'CVFileName', // The name of the file field
      cvFileContent,
      filename: cvFileName, // Use the file name from the parameter
      contentType:
          MediaType('application', 'pdf'), // Use MediaType from http_parser
    ));

    // Send the request
    var response = await request.send();

    // Parse the response
    var httpResponse = await http.Response.fromStream(response);
    if (httpResponse.statusCode == 200) {
      // Assuming the response body contains the user ID in JSON format
      var jsonResponse = jsonDecode(httpResponse.body);
      var userId = jsonResponse['loginProfile']
          ['id']; // Extract the user ID from getData

      // Save the user ID using GetStorage
      final storage = GetStorage();
      storage.write('userId', userId);

      // Print the user ID
      print('Saved user ID: $userId');
      // Show success toast
      Fluttertoast.showToast(
        msg: "Profile created successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      print(
          'Failed to create profile. Status code: ${httpResponse.statusCode}');

      Fluttertoast.showToast(
        msg:
            "Failed to create profile. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    return httpResponse;
  }

  ///4.login_email..........post...apis...
  static Future<http.Response> LoginApi(String emailId, String password) async {
    var url = "${baseUrl}Login/ProfileLogin";
    //App/UserChangePassword?userId=38
    var body = jsonEncode({
      "emailId": emailId,
      "password": password,
    });

    print("loginnnn");
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
      var userId = responseData['loginProfile']['id'];

      // Save user ID (assuming 'Id' is part of the response JSON)
      prefs.write("Id", userId);
      print('Saved userId: $userId');

      // Navigate to HomePage
      /// Get.to(() => Home());

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('Message', r.body);
    } else {
      Get.snackbar('Error', r.body);
    }

    return r;
  }

  ///user_ profile__update.........15 jun

  static String apiUrl7 = "${baseUrl}App/UpdateProfile";
  static Future<http.Response> updateuserProfileApi(
    Map<String, String> formData,
    //Uint8List cvFileContent,
    //String CVFileName,
    Uint8List cvFileContent2,
    // String ProfileImage,
  ) async {
    var uri = Uri.parse(apiUrl7);
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Helper function to determine the MediaType based on the file extension
    MediaType getMediaType(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        // case 'jpg':
        // case 'jpeg':
        //   return MediaType('image', 'jpeg');
        // case 'png':
        //   return MediaType('image', 'png');
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
        // case 'pdf':
        //   return MediaType('application', 'pdf');
        default:
          throw Exception('Unsupported file type');
      }
    }

    // Add file field

    request.files.add(http.MultipartFile.fromBytes(
      'ProfileImage', // The name of the file field
      cvFileContent2,
      //filename: ProfileImage,
      // Use the file name from the parameter
      //contentType: getMediaType2(ProfileImage)

      //contentType:
      //MediaType('application', 'pdf'), // Use MediaType from http_parser
    ));

    // Get token from GetStorage
    // final storage = GetStorage();
    // var token = storage.read('token');

    // Set token in headers
    //request.headers['Authorization'] = 'Bearer $token';

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
  static PriofileApi() async {
    var prefs = GetStorage();

    //saved userid..........
    //prefs.write("Id".toString(), json.decode(r.body)['Id']);
    userId = prefs.read("Id").toString();
    print('wwwuseridEE:${userId}');
    //https://api.hirejobindia.com/api/App/GetProfile?userId=2
    var url = '${baseUrl}App/GetProfile?userId=$userId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("url");
        print(url);
        GetProfileModel? geetprofilemodel = getProfileModelFromJson(r.body);
        print("profile: ${geetprofilemodel.response!.emailId}");
        return geetprofilemodel;
      }
    } catch (error) {
      print('profileedetaileror: $error');
    }
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