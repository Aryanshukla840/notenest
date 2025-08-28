import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reactive user stream
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // Login
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/home');
      Get.snackbar("Login Successful ✅", "Welcome back!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Login Failed ⚠️", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Register
  Future<void> register(String name, String email, String mobile,
      String password, String gender) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCred.user!.uid).set({
        "name": name,
        "email": email,
        "mobile": mobile,
        "gender": gender,
        "createdAt": FieldValue.serverTimestamp(),
      });

      Get.offAllNamed('/home');
      Get.snackbar("Registration Successful ✅", "Welcome to NoteNest!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Registration Failed ⚠️", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
