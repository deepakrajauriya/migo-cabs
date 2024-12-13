import 'package:flutter/material.dart';
import 'package:migo_cabs/screens/widgets/screens_header.dart';

class OneWayScreen extends StatefulWidget {
  OneWayScreen({super.key});

  @override
  State<OneWayScreen> createState() => _OneWayScreenState();
}

class _OneWayScreenState extends State<OneWayScreen> {
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _timecontroller = TextEditingController();
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreensHeader(title: "One Way"),
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
                        controller: _datecontroller,
                        label: 'Pickup Date',
                        icon: Icons.calendar_today,
                        isenable: false,
                        callback: () async {
                          final DateTime? selectedDate =
                              await pickFutureDate(context);
                          if (selectedDate != null) {
                            _datecontroller.text = "${selectedDate.toLocal()}"
                                .split(' ')[0]; // Format date
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                          controller: _timecontroller,
                          label: 'Pickup Time',
                          icon: Icons.access_time,
                          isenable: false,
                          callback: () async {
                            final TimeOfDay? selectedTime =
                                await pickTime(context);
                            if (selectedTime != null) {
                              _timecontroller.text =
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
