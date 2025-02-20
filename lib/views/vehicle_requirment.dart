import 'package:flutter/material.dart';
import 'package:vehup/widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';

class VehicleRequirment extends StatelessWidget {
  const VehicleRequirment({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: "a");
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 247, 247),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vehicle requirment"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdown(
                controller: emailController,
                labelText: 'Select Brand ',
                titleName: 'Brand',
              ),
              CustomDropdown(
                controller: emailController,
                labelText: 'Select Model',
                titleName: 'Model',
              ),
              CustomDropdown(
                controller: emailController,
                labelText: 'Select Variant',
                titleName: 'Variant',
              ),
              CustomDropdown(
                controller: emailController,
                labelText: 'Select Year',
                titleName: 'Year',
              ),
              Row(
                children: [
                  Text(
                    'Transmission ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' *',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 226, 27, 27),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.45 - 10,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xFF4A101D),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('Automatic')),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.45 - 10,
                    height: 70,
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Color(0xFF4A101D),
                        // ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('Manual')),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomDropdown(
                controller: emailController,
                labelText: 'Select fuel type',
                titleName: 'Fuel',
              ),
              CustomDropdown(
                controller: emailController,
                labelText: 'Select Color',
                titleName: 'Color',
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(size: size, onTap: () {}, title: 'Submit')
            ],
          ),
        ),
      ),
    );
  }
}
