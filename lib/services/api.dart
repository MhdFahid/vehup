// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// // import 'models/api_response.dart';

// class ApiService {
//   // A general method to handle POST requests with callbacks for success and error
//   void postRequestWithBody<T>(
//     String url,
//     dynamic body, {
//     Map<String, String>? headers,
//     Duration timeout = const Duration(seconds: 20),
//     required Function(T) onSuccess,
//     required Function(String) onError,
//     required T Function(Map<String, dynamic>) fromJson,
//   }) async {
//     try {
//       // Sending the POST request to the server
//       print("printing my data 111} $body");
//       final headers = {
//         "Content-Type": "application/json",
//       };

//       var response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: json.encode(body),
//       );

//       print("statuscodeti ${{response.statusCode}}");

//       // Handling the response from the server
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print("coming here00-------");
//         // Parse and return successful response
//         final data = json.decode(response.body);
//         print("coming here00-------2 $data");

//         final parsedData = fromJson(data); // Convert to model using fromJson
//         print("coming here00-------3");

//         onSuccess(parsedData);
//       } else {
//         // Handle non-200 responses (failure)
//         onError('Error: ${response.statusCode}, ${response.body}');
//       }
//     } on http.ClientException catch (e) {
//       // Handle network-related errors
//       onError('Network Error: $e');
//     } on TimeoutException catch (_) {
//       // Handle timeout errors
//       onError('Timeout Error: Request took too long.');
//     } catch (e) {
//       // Handle unexpected errors
//       onError('Unexpected Error: $e');
//     }
//   }

//   // A method to handle GET requests with callbacks for success and error
//   void getRequest<T>(
//     String url, // Full URL passed from the UI
//     {
//     required Map<String, String> headers,
//     Duration timeout = const Duration(seconds: 20),
//     required Function(T) onSuccess, // Success callback
//     required Function(String) onError, // Error callback
//     required T Function(Map<String, dynamic>)
//         fromJson, // Model parsing callback
//   }) async {
//     try {
//       // Send GET request to the server
//       Response response =
//           await http.get(Uri.parse(url), headers: headers).timeout(timeout);

//       // Handle response status
//       if (response.statusCode == 200) {
//         // log("message1###### ${response.statusCode}");
//         // If the response is successful, parse the data
//         final data = json.decode(response.body);

//         // log("message2######  $data");
//         final parsedData =
//             fromJson(data['data']); // Convert to model using fromJson
//         onSuccess(parsedData);

//         // log("message ###### $data");
//       } else {
//         // If the response is not 200 OK, handle the error
//         onError('Error: ${response.statusCode}, ${response.body}');
//         log("message  ${response.statusCode}, ${response.body}");
//       }
//     } on http.ClientException catch (e) {
//       // Handle network errors
//       log("message $e");
//       onError('Network Error: $e');
//     } on TimeoutException catch (_) {
//       // Handle timeout errors
//       onError('Timeout Error: Request took too long.');
//     } catch (e) {
//       // Handle unexpected errors
//       log("message $e");
//       onError('Unexpected Error: $e');
//     }

//     // A method to handle DELETE requests with callbacks for success and error
//   }

//   // void deleteRequest<T>(
//   //   String url, // Full URL passed from the UI
//   //   dynamic body, {
//   //   Map<String, String>? headers,
//   //   Duration timeout = const Duration(seconds: 20),
//   //   required Function(T) onSuccess, // Success callback
//   //   required Function(String) onError, // Error callback
//   //   required T Function(Map<String, dynamic>)
//   //       fromJson, // Model parsing callback
//   // }) async {
//   //   log("message1######2  com");
//   //   try {
//   //     log("message1######2  com");
//   //     // Send DELETE request to the server
//   //     Response response = await http
//   //         .delete(Uri.parse(url), headers: headers, body: body)
//   //         .timeout(timeout);

//   //     log("message1######2 ${response.statusCode}");
//   //     // Handle response status
//   //     if (response.statusCode == 200) {
//   //       log("message1######2 ${response.statusCode}");
//   //       // If the response is successful, parse the data
//   //       final data = json.decode(response.body);

//   //       log("message2######2  $data");
//   //       final parsedData = fromJson(data); // Convert to model using fromJson
//   //       onSuccess(parsedData);

//   //       log("message ######2 $data");
//   //     } else {
//   //       // If the response is not 200 OK, handle the error
//   //       onError('Error: ${response.statusCode}, ${response.body}');
//   //       log("message  ${response.statusCode}, ${response.body}");
//   //     }
//   //   } on http.ClientException catch (e) {
//   //     // Handle network errors
//   //     log("message $e");
//   //     onError('Network Error: $e');
//   //   } on TimeoutException catch (_) {
//   //     // Handle timeout errors
//   //     onError('Timeout Error: Request took too long.');
//   //   } catch (e) {
//   //     // Handle unexpected errors
//   //     log("message $e");
//   //     onError('Unexpected Error: $e');
//   //   }
//   // }

//   void deleteRequest<T>(
//     String url, // Full URL passed from the UI
//     dynamic body, {
//     // No need for body anymore
//     Map<String, String>? headers,
//     Duration timeout = const Duration(seconds: 20),
//     required Function(T) onSuccess, // Success callback
//     required Function(String) onError, // Error callback
//     required T Function(Map<String, dynamic>)
//         fromJson, // Model parsing callback
//   }) async {
//     log("message1######2  com");

//     try {
//       // Send DELETE request to the server (no body)
//       Response response = await http
//           .delete(Uri.parse(url), headers: headers) // Remove body here
//           .timeout(timeout);

//       log("message1######2 ${response.statusCode}");

//       // Handle response status
//       if (response.statusCode == 200) {
//         log("message1######2 ${response.statusCode}");

//         // If the response is successful, parse the data
//         final data = json.decode(response.body);

//         log("message2######2  $data");

//         final parsedData = fromJson(data); // Convert to model using fromJson
//         onSuccess(parsedData);

//         log("message ######2 $data");
//       } else {
//         // If the response is not 200 OK, handle the error
//         onError('Error: ${response.statusCode}, ${response.body}');
//         log("message  ${response.statusCode}, ${response.body}");
//       }
//     } on http.ClientException catch (e) {
//       // Handle network errors
//       log("message $e");
//       onError('Network Error: $e');
//     } on TimeoutException catch (_) {
//       // Handle timeout errors
//       onError('Timeout Error: Request took too long.');
//     } catch (e) {
//       // Handle unexpected errors
//       log("message $e");
//       onError('Unexpected Error: $e');
//     }
//   }
// }
