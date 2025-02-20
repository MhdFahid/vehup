import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final TextEditingController controller;
  final String titleName;
  final String labelText;

  const CustomDropdown({
    super.key,
    required this.controller,
    required this.labelText,
    required this.titleName,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // String selectedValue = 'Select Brand';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.titleName,
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
        Container(
          color: Colors.white,
          child: Center(
            child: DropdownButtonFormField<String>(
              value: widget.labelText,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              items: [widget.labelText, 'Two', 'Three']
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  // selectedValue = value!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
