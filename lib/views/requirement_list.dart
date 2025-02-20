import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import 'create_requirement.dart';

class RequirementList extends StatelessWidget {
  RequirementList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 247, 247),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Requirement  List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RequirementCard(size: size);
                },
              ),
            ),
            CustomButton(
              onTap: () {
                Get.to(() => CreateRequirement());
              },
              size: size,
              title: '+ Create A Requirement',
            ),
          ],
        ),
      ),
    );
  }
}

class RequirementCard extends StatelessWidget {
  const RequirementCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Rolls Roys Ghost Standard (2020)',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Transmission'),
                  Spacer(),
                  Text('Automatic'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Fuel'),
                  Spacer(),
                  Text('Diesel'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Color'),
                  Spacer(),
                  Text('Black'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Active',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Switch(
                    activeTrackColor: Color.fromARGB(255, 99, 10, 10),
                    activeColor: const Color.fromARGB(255, 255, 255, 255),
                    value: true,
                    onChanged: (v) {},
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
