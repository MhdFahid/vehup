import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'vehicle_requirment.dart';

class CreateRequirement extends StatelessWidget {
  const CreateRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 247, 247),
      appBar: AppBar(
        centerTitle: true,
        title: Text('What would you prefer to have?'),
      ),
      body: GridView(
        padding: EdgeInsets.all(16.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          CreateRequirementCard(
            size: size,
            title: 'Total Vehicle',
            onTap: () {
              Get.to(() => VehicleRequirment());
            },
            image: 'for_car',
          ),
          CreateRequirementCard(
            size: size,
            title: 'Total Bookings',
            onTap: () {},
            image: 'for_bike',
          ),
        ],
      ),
    );
  }
}

class CreateRequirementCard extends StatelessWidget {
  const CreateRequirementCard({
    super.key,
    required this.size,
    required this.title,
    required this.onTap,
    required this.image,
  });

  final Size size;
  final String title;
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: size.width * 0.2,
          height: size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
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
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: const Color.fromARGB(255, 93, 20, 20),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
