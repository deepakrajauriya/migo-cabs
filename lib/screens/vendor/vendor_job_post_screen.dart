import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migo_cabs/const/app_sizes.dart';
import 'package:migo_cabs/screens/vendor/widgets/my_text_form_field.dart';

import '../widgets/screens_header.dart';

class VendorJobPostScreen extends StatefulWidget {
  @override
  _PostRideScreenState createState() => _PostRideScreenState();
}

class _PostRideScreenState extends State<VendorJobPostScreen> {
  String? selectedTripType;
  String? selectedCabType;

  String? selectedNightCharge;
  String? selectedDriverAllowance;
  String? selectedparking;
  String? selectedkm;
  String? selectedtax;
  String? selectedtolltax;

  final List<String> tripTypes = ["One Way", "Round Trip", "Local"];

  final List<String> commontype = ["Include", "Exclude"];
  final List<String> kmselect = ["100+", "200+", "500+", "800+"];
  final List<String> cabTypes = ["Sedan", "SUV", "Hatchback"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreensHeader(title: 'Post Ride'),

            const SizedBox(height: 20),
            // Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: 'alex',
                          filledColor: Colors.white,
                          label: "Customer Name",
                          keyBoard: TextInputType.text,
                          maxLength: 100,
                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: '1234567890',
                          filledColor: Colors.white,
                          label: "Customer no.",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: '5',
                          filledColor: Colors.white,
                          label: "Passengers",
                          keyBoard: TextInputType.phone,
                          maxLength: 2,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: 'remark',
                          filledColor: Colors.white,
                          label: "Remark (optional)",
                          keyBoard: TextInputType.phone,
                          maxLength: 100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MyTextformField(
                    borderColor: Colors.orange,
                    hintText: 'xyz , delhi -110092',
                    filledColor: Colors.white,
                    label: "Pick Up Location",
                    keyBoard: TextInputType.text,
                    maxLength: 100,
                  ),
                  const SizedBox(height: 20),
                  MyTextformField(
                    borderColor: Colors.orange,
                    hintText: 'xyz , delhi -110092',
                    filledColor: Colors.white,
                    label: "Drop Location",
                    keyBoard: TextInputType.text,
                    maxLength: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: '5000',
                          filledColor: Colors.white,
                          label: "Total Fare",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: '245',
                          filledColor: Colors.white,
                          label: "Commission",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: '22 Mar 2025',
                          filledColor: Colors.white,
                          label: "Pick Up Date",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                          isreadable: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: MyTextformField(
                          isreadable: true,
                          borderColor: Colors.orange,
                          hintText: '9:30AM',
                          filledColor: Colors.white,
                          label: "Pick Up Time",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          "Trip Type",
                          tripTypes,
                          selectedTripType,
                          (value) {
                            setState(() {
                              selectedTripType = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown(
                          "Cab Type",
                          cabTypes,
                          selectedCabType,
                          (value) {
                            setState(() {
                              selectedCabType = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextformField(
                          borderColor: Colors.orange,
                          hintText: '22 June 2025',
                          filledColor: Colors.white,
                          label: "Drop Date",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                          isreadable: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: MyTextformField(
                          isreadable: true,
                          borderColor: Colors.orange,
                          hintText: '9:30AM',
                          filledColor: Colors.white,
                          label: "Drop Time",
                          keyBoard: TextInputType.phone,
                          maxLength: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          "Driver Allowance",
                          commontype,
                          selectedDriverAllowance,
                          (value) {
                            setState(() {
                              selectedDriverAllowance = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown(
                          "Night Charge",
                          commontype,
                          selectedNightCharge,
                          (value) {
                            setState(() {
                              selectedNightCharge = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          "Parking",
                          commontype,
                          selectedparking,
                          (value) {
                            setState(() {
                              selectedparking = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown(
                          "KM",
                          kmselect,
                          selectedkm,
                          (value) {
                            setState(() {
                              selectedkm = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          "Tax",
                          commontype,
                          selectedtax,
                          (value) {
                            setState(() {
                              selectedtax = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown(
                          "Toll Tax",
                          commontype,
                          selectedtax,
                          (value) {
                            setState(() {
                              selectedtax = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    width: AppSizes.screenwidth,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Post Ride",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                  // const SizedBox(height: 10),
                  // _buildToggleRow("Driver Allowance", "Night Charge"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? selectedItem,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        isExpanded: true,
        underline: SizedBox(),
        hint: Text(label),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildToggleRow(String label1, String label2) {
    return Row(
      children: [
        Expanded(child: _buildToggleButton(label1)),
        const SizedBox(width: 10),
        Expanded(child: _buildToggleButton(label2)),
      ],
    );
  }

  Widget _buildToggleButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Toggle functionality
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label),
    );
  }
}
