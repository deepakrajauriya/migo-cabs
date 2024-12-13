import 'package:flutter/material.dart';
import 'package:migo_cabs/screens/widgets/screens_header.dart';

class RoundTripScreen extends StatefulWidget {
  const RoundTripScreen({super.key});

  @override
  State<RoundTripScreen> createState() => _RoundTripScreenState();
}

class _RoundTripScreenState extends State<RoundTripScreen> {
  TextEditingController _dropdatecontroller = TextEditingController();
  TextEditingController _droptimecontroller = TextEditingController();
  TextEditingController _pickupdatecontroller = TextEditingController();
  TextEditingController _pickuptimecontroller = TextEditingController();
  TextEditingController _pickupcontroller = TextEditingController();
  TextEditingController _dropcontroller = TextEditingController();

  Future<DateTime?> pickFutureDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today, // Set the current date as the initial date
      firstDate: today, // Only allow selecting dates from today onwards
      lastDate: DateTime(today.year + 5), // Allow up to 5 years in the future
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return pickedDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    final TimeOfDay now = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: now, // Set the current time as the initial time
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return pickedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ScreensHeader(title: "Round Trip"),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Create New Booking",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: _pickupcontroller,
                    label: 'Pickup Address',
                    icon: Icons.location_on,
                    callback: () {}),
                SizedBox(height: 16),
                _buildTextField(
                    controller: _dropcontroller,
                    label: 'Drop Address',
                    icon: Icons.location_on_outlined,
                    callback: () {}),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _pickupdatecontroller,
                        label: 'Pickup Date',
                        icon: Icons.calendar_today,
                        isenable: false,
                        callback: () async {
                          final DateTime? selectedDate =
                              await pickFutureDate(context);
                          if (selectedDate != null) {
                            _pickupdatecontroller.text =
                                "${selectedDate.toLocal()}"
                                    .split(' ')[0]; // Format date
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                          controller: _pickuptimecontroller,
                          label: 'Pickup Time',
                          icon: Icons.access_time,
                          isenable: false,
                          callback: () async {
                            final TimeOfDay? selectedTime =
                                await pickTime(context);
                            if (selectedTime != null) {
                              _pickuptimecontroller.text =
                                  selectedTime.format(context);
                              setState(() {});
                              // Update your text field or state with the selected time
                            }
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _dropdatecontroller,
                        label: 'Drop Date',
                        icon: Icons.calendar_today,
                        isenable: false,
                        callback: () async {
                          final DateTime? selectedDate =
                              await pickFutureDate(context);
                          if (selectedDate != null) {
                            _dropdatecontroller.text =
                                "${selectedDate.toLocal()}"
                                    .split(' ')[0]; // Format date
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                          controller: _droptimecontroller,
                          label: 'Drop Time',
                          icon: Icons.access_time,
                          isenable: false,
                          callback: () async {
                            final TimeOfDay? selectedTime =
                                await pickTime(context);
                            if (selectedTime != null) {
                              _droptimecontroller.text =
                                  selectedTime.format(context);
                              setState(() {});
                              // Update your text field or state with the selected time
                            }
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Handle Explore Cabs action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'EXPLORE CABS',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildTextField(
      {required String label,
      required IconData icon,
      required VoidCallback callback,
      required TextEditingController controller,
      bool isenable = true}) {
    return TextField(
      onTap: callback,
      controller: controller,
      readOnly: !isenable,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(icon, color: Colors.orange),
        floatingLabelStyle: TextStyle(color: Colors.orange),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
