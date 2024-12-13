import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../widgets/screens_header.dart';
import '../widgets/snackbar_toast.dart';

class CustomerProfileUpdate extends StatefulWidget {
  const CustomerProfileUpdate({super.key});

  @override
  State<CustomerProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<CustomerProfileUpdate> {
  File? _imageFile; // To store the selected image
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _adharController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  bool _isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    // Get user data from UserProvider
    // userProvider = Provider.of<UserProvider>(context, listen: false);
    // _nameController.text =
    //     userProvider.user.name; // Assuming userName is a field in UserProvider
    // _dobController.text =
    //     userProvider.user.dob; // Assuming userDob is a field in UserProvider
    // _emailController.text = userProvider
    //     .user.email; // Assuming userEmail is a field in UserProvider
    // _mobileController.text =
    //     userProvider.user.mob; // Assuming userMobile is a field in UserProvider
    // _adharController.text = userProvider.user.aadhar;
    //
    // _panController.text =
    //     userProvider.user.pan; // Assuming userAdhar is a field in UserProvider
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  bool isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void _validateInput() {
    if (_emailController.text.isEmpty) {
      toast("Please Enter Email", context);
    } else if (!isValidEmail(_emailController.text)) {
      toast("Please Enter Valid Email", context);
    } else if (_nameController.text.isEmpty) {
      toast("Please Enter Name", context);
    } else if (_dobController.text.isEmpty) {
      toast("Please Enter DOB", context);
    } else if (_adharController.text.length < 12) {
      toast("Please Enter Valid Aadhar", context);
    } else if (_panController.text.length < 10) {
      toast("Please Enter Valid Pan", context);
    } else {
      // Valid input, proceed to update
      _updateProfile();
    }
  }

  String _convertToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64String = base64Encode(imageBytes);
    setState(() {});
    return base64String;
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulate a network request (replace with your actual update logic)
    // Map<String, dynamic> response;
    // if (_imageFile == null) {
    //   response = await ApiService.userupdate(
    //       await getstring(USER_TOKEN),
    //       _nameController.text,
    //       _dobController.text,
    //       _emailController.text,
    //       "",
    //       _adharController.text,
    //       _panController.text);
    // } else {
    //   String ff = _convertToBase64(_imageFile!);
    //   response = await ApiService.userupdate(
    //       await getstring(USER_TOKEN),
    //       _nameController.text,
    //       _dobController.text,
    //       _emailController.text,
    //       ff,
    //       _adharController.text,
    //       _panController.text);
    // }

    // print(response);
    // if (response["success"]) {
    //   userProvider.updateUserName(response["name"]);
    //   userProvider.updateUserDOB(response["dob"]);
    //   userProvider.updateUserEmail(response["email"]);
    //   userProvider.updateUserProfile(response["profile"]);
    //   userProvider.updateUserAdhar(response["aadhar"]);
    //   userProvider.updateUserPAN(response["pan"]);
    //   toast(response["message"], context);
    // } else {
    //   toast("Something Went Wrong", context);
    // }

    // After the update logic
    setState(() {
      _isLoading = false; // Stop loading
    });

    // Navigate back or show success message
    Navigator.pop(context);
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    // final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // Use Stack to overlay the progress indicator
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ScreensHeader(
                  title: 'Profile',
                ),
                // Top section (Header)

                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              // Display the image
                              SizedBox(
                                width: 140,
                                height: 140,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child:
                                      Image.asset("assets/icons/profile.png"),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: _pickImage,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.camera_alt,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Enter Your Name',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                focusColor: Colors.orange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email),
                                labelText: 'Enter Email Address',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                focusColor: Colors.orange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _dobController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Mobile Number',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                prefixIcon: Icon(Icons.phone),
                                focusColor: Colors.orange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _adharController,
                              maxLength: 12,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                counterText: "",
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _panController,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                counterText: "",
                                labelText: 'Home Address',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _panController,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.house_outlined),
                                counterText: "",
                                labelText: 'Office Address',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _panController,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.warehouse_outlined),
                                counterText: "",
                                labelText: 'Organisation Name',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: _panController,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.roundabout_left),
                                counterText: "",
                                labelText: 'Role',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Update Button
                InkWell(
                  onTap: () {
                    _validateInput();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    width: screen.width,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text("Update Changes",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Circular Progress Indicator
          if (_isLoading) // Show loading indicator if loading
            ModalBarrier(
              dismissible: false,
              color: Colors.black.withOpacity(0.5), // Background color
            ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(), // Circular progress indicator
            ),
        ],
      ),
    );
  }
}
