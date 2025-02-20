import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehup/models/vehicle_model.dart';

import '../controllers/api/vehicle_controller.dart';

class VehicleDetails extends StatelessWidget {
  VehicleDetails({super.key});
  final VehicleController vehicleController = Get.put(VehicleController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Map<String, String>> details = [
      {'title': 'Price', 'value': ''},
      {'title': 'Year', 'value': '2020'},
      {'title': 'Kilometer', 'value': '10,000'},
      {'title': 'Fuel Type', 'value': 'Petrol'},
      {'title': 'Transmission', 'value': 'Automatic'},
      {'title': 'Vehicle Available At', 'value': 'Calicut'},
      {'title': 'Color', 'value': 'Black'},
      {'title': 'Fuel Economy', 'value': 'Not Available'},
      {'title': 'No. of Owner(s)', 'value': '1'},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 247, 247),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/icons/car_image.png'),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        const Spacer(),
                        const Icon(Icons.share, color: Colors.white),
                        const SizedBox(width: 20),
                        const Icon(Icons.auto_fix_high_outlined,
                            color: Colors.white),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const Spacer(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          8,
                          (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 80,
                              height: 80,
                              color: const Color.fromARGB(255, 253, 247, 247),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 249, 249, 249),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rolls Royce Ghost Standard (2020)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '₹ 1,50,00,000',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 205, 201, 201),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconInfoCard(
                                    title: 'AUTOMATIC',
                                    image: 'trans',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  IconInfoCard(
                                    title: '10,000',
                                    image: 'speed_meter',
                                  ),
                                ],
                              ),
                              IconInfoCard(
                                title: 'BLACK',
                                image: 'color',
                              ),
                              IconInfoCard(
                                title: 'PERTROL',
                                image: 'fuel',
                              ),
                              IconInfoCard(
                                title: 'SEDAN',
                                image: 'car_type',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Vehicle Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: details.length,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    details[index]['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    details[index]['value']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 1,
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconInfoCard extends StatelessWidget {
  const IconInfoCard({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                'assets/icons/$image.png',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
