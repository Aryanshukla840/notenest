import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final mobileController = TextEditingController();
    final passwordController = TextEditingController();
    final gender = "Male".obs;
    final AuthController authController = Get.find();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF008080), Color(0xFF20B2AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_add_alt_1_rounded,
                      size: 90, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon:
                            const Icon(Icons.person, color: Colors.teal),
                            labelText: 'Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon:
                            const Icon(Icons.email, color: Colors.teal),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: mobileController,
                          decoration: InputDecoration(
                            prefixIcon:
                            const Icon(Icons.phone, color: Colors.teal),
                            labelText: 'Mobile',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon:
                            const Icon(Icons.lock, color: Colors.teal),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text("Gender:",
                                style: TextStyle(color: Colors.teal)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Obx(() => DropdownButtonFormField<String>(
                                value: gender.value,
                                items: const [
                                  DropdownMenuItem(
                                      value: "Male", child: Text("Male")),
                                  DropdownMenuItem(
                                      value: "Female",
                                      child: Text("Female")),
                                  DropdownMenuItem(
                                      value: "Other",
                                      child: Text("Other")),
                                ],
                                onChanged: (val) => gender.value = val!,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(14)),
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 12),
                                ),
                              )),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => authController.register(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              mobileController.text.trim(),
                              passwordController.text.trim(),
                              gender.value,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade600,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              padding:
                              const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Register',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
