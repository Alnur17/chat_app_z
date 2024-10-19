import 'package:chat_app_z/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _userIdTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Login Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 58,
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('User Id'),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _userIdTEController,
                  //keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    //suffixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your user Id...';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                const Text('Name'),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                //suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your nane...';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            GestureDetector(
                onTap: () {}, child: const Text('Forgot password?')),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                ZIMKit().connectUser(
                    id: _userIdTEController.text, name: _nameTEController.text);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.orange,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
