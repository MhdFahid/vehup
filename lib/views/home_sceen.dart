import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehup/views/message_view.dart';
import 'package:vehup/views/requirement_list.dart';
import 'package:vehup/views/total_vehicle_view.dart';

import 'create_requirement.dart';
import 'profile_view.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.all(16.0),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            DashboardCard(
              size: size,
              title: 'Total Vehicle',
              onTap: () {
                Get.to(() => TotalVehicleView());
              },
              image: 'total_vehicle',
              count: '100',
            ),
            DashboardCard(
              size: size,
              title: 'Total Bookings',
              onTap: () {},
              image: 'total_bookings',
              count: '50',
            ),
            DashboardCard(
              size: size,
              title: 'C2B Concept',
              onTap: () {},
              image: 'c2b',
              count: '25',
            ),
            DashboardCard(
              size: size,
              title: 'Vehicle for Sale',
              onTap: () {},
              image: 'for_sale',
              count: "35",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        currentIndex: 0,
        onTap: (v) {
          if (v == 1) {
            Get.to(() => HomeSceen());
          } else if (v == 1) {}
        },
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 40, child: Image.asset("assets/icons/home.png")),
              label: "Home"),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(() => MessageView());
                },
                child: SizedBox(
                    height: 40, child: Image.asset("assets/icons/message.png")),
              ),
              label: "message"),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(() => CreateRequirement());
                },
                child: SizedBox(
                    height: 40,
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 97, 3, 39),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/icons/dollar.png"),
                        ))),
              ),
              label: "sell"),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(() => RequirementList());
                },
                child: SizedBox(
                    height: 40,
                    child: Image.asset("assets/icons/requirement.png")),
              ),
              label: "requirement"),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(() => ProfileView());
                },
                child: SizedBox(
                    height: 40, child: Image.asset("assets/icons/profile.png")),
              ),
              label: "profile"),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.size,
    required this.title,
    required this.onTap,
    required this.image,
    required this.count,
  });

  final Size size;
  final String title;
  final String count;
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
                count,
                style: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
