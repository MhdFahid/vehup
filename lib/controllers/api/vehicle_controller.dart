import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vehup/models/vehicle_model.dart';
import 'dart:convert';

class VehicleController extends GetxController {
  var isLoading = true.obs;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTY2NjZlMDE0Y2JiODIwZTlhM2RjN2NhZjA1YjdjODFkMzQzOWIwOTg0MDJlZTIyMDEwN2JkZjdhZmMxZjcxZTMxMjkxZTg3N2ZiNmUwNGMiLCJpYXQiOjE3NDAwMDE0NTcuNTgwOTM4LCJuYmYiOjE3NDAwMDE0NTcuNTgwOTQsImV4cCI6MTc3MTUzNzQ1Ny41NzM4MDksInN1YiI6IjgiLCJzY29wZXMiOltdfQ.l5-1SkkU_AdbZjuOhlKLx4L_IRR9zFYXvqpqlMfiYN5H-RIaZadr77PE_-G9QQoCqJen7vMZSACcI4nQSBxQ1gRhQs_zzmBeNuXclefnCvYN_eoxhsj50IZnUaeXHZId4NsiyQR8UsXS0KwwAP1_q57nhHO92J-73TZJk5BUdWZR2hDnD2-xQlaVe9QKoEJmTh9sutPYcVlVDk3DQu3luQc7TRpX7Du0GUCP8aCJ2QMgEN2_Xn4UEpsl_avz2wdJVJN0VUnbQUEDgNGIgveVNOOkWfPHgspeeDSk1a74HNc1j4vi6xu-GUjgXj18urV6UKDXeaRshUyqRpW1g8NaxKmv9nstBqdnBVr-bgoNIek9XTbT9iuzF9zIaLWulJAXVCbHwi9y3i9ctkGfBQPtJKyQH4iL6JmARwGjakqRLVjGA4UpifEeMQoQHxqStHWv6E984vR485CnF8YB9ZRa16Pdnji8jXXFisNXBCa3y4v62mJB_kM2Z396udccTbrwii-Y_X8GnpMqESe4WHtHbqmP3z2CD0-Ak1VzZLi2AQthU0ZPA7BsRJOEEOr3DpGwqwhw-pYGcpxiiFWPaxdEIGtWj_U4AkSI80qEQTB9zHDEbYh2TYUcflwmTLu9D3FBmk0py28OqFvAjrUAvGKtKU2HLc269Q4L-CKVWrhF4aU';

  var vehicle = Vehicle(
      status: 'false',
      data: VehicleData(
        id: 0,
        price: "",
        images: [],
      )).obs;

  Future<void> fetchVehicleDetails(int vehicleId) async {
    try {
      isLoading(true);
      var url = Uri.parse(
          "https://test.vehup.com/api/vendor/get-vehicle-details/$vehicleId");
      var response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        vehicle.value = Vehicle.fromJson(jsonData);
        print(response.statusCode);
      } else {
        Get.snackbar("Error", "Failed to load vehicle details");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
