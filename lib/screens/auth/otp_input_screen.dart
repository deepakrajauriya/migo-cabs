import 'package:flutter/material.dart';
import 'package:migo_cabs/const/app_sizes.dart';
import 'package:migo_cabs/screens/auth/user_type_screen.dart';
import 'package:migo_cabs/screens/widgets/snackbar_toast.dart';

class OtpInputScreen extends StatefulWidget {
  @override
  _OTPInputScreenState createState() => _OTPInputScreenState();
}

class _OTPInputScreenState extends State<OtpInputScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode =
      FocusNode(); // FocusNode for the hidden TextField
  String otp = "";

  @override
  void initState() {
    super.initState();
    // Automatically request focus on the TextField when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose the FocusNode to avoid memory leaks
    _otpController.dispose();
    super.dispose();
  }

  void _onDashTapped() {
    // Request focus on the hidden TextField and ensure the keyboard opens
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onDashTapped, // Ensure keyboard opens on tapping anywhere
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              // Logo
              Image.asset(
                'assets/images/migosplash.jpg', // Replace with the correct asset path
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15),

              // Title
              Text(
                "Enter OTP",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // OTP Input Dashes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: _onDashTapped, // Open keyboard when tapping a dash
                    child: Container(
                      width: 50,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: otp.length > index
                                ? Colors.orange
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        otp.length > index ? otp[index] : "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 0),

              // Hidden Text Field with FocusNode
              TextField(
                controller: _otpController,
                focusNode: _focusNode, // Attach the FocusNode
                keyboardType: TextInputType.number,
                maxLength: 4,
                style: TextStyle(
                  color: Colors.transparent,
                  fontSize: 1, // Tiny text to keep it visually hidden
                ),
                cursorColor: Colors.transparent,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  if (otp.length == 4) {
                    // Add OTP submission logic here
                    print("OTP Submitted: $otp");
                    toast("Login Successfully", context, color: Colors.green);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserTypeScreen(),
                        ));
                  } else {
                    toast("Please Enter Valid OTP", context, color: Colors.red);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Consent Text
              Text(
                'Enter the OTP sent to your mobile number.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Help ",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  Icon(
                    Icons.support_agent,
                    color: Colors.orange,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
