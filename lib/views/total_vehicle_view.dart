import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/api/vehicle_controller.dart';
import 'vehicle_details.dart';

class TotalVehicleView extends StatelessWidget {
  TotalVehicleView({super.key});
  final VehicleController vehicleController = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 247, 247),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Total Vehicle'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              // final vehicle = controller.vehicles[index];
              // print(object);
              return VehicleCard(
                  size: size,
                  onTap: () {
                    vehicleController.fetchVehicleDetails(index + 1);
                    print('object');
                    Get.to(() => VehicleDetails());
                  },
                  price: 'price',
                  image: 'image',
                  year: 'year',
                  fuel: 'fuel');
            },
          ),
        ));
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.size,
    required this.onTap,
    required this.price,
    required this.image,
    required this.year,
    required this.fuel,
  });

  final Size size;
  final String price;
  final String image;
  final String year;
  final String fuel;

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: const Color.fromARGB(200, 118, 71, 71)),
                BoxShadow(color: Colors.black12),
                BoxShadow(color: const Color.fromARGB(31, 74, 50, 50)),
                BoxShadow(color: const Color.fromARGB(31, 40, 30, 30)),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/icons/car_image.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Volkswagen Polo'),
                    Text('₹ 10,00,000'),
                    Divider(
                      color: const Color.fromARGB(255, 240, 234, 234),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_outlined)),
                        Text("2005"),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.motion_photos_on_sharp)),
                        Text("10000"),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delivery_dining)),
                        Text("Diesel"),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
