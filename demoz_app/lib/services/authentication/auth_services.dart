import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoz_app/core/login_manager.dart';
import 'package:demoz_app/models/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signupWithEmailAndPassword(
      String email,
      String password,
      String companyName,
      String address,
      String phoneNumber,
      String tinNumber,
      int numberOfEmployees,
      String companyBank,
      String bankAccount) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;

    if (user != null) {
      CompanyModel companyModel = CompanyModel(
          id: user.uid,
          email: email,
          companyName: companyName,
          address: address,
          phoneNumber: phoneNumber,
          tinNumber: tinNumber,
          numberOfEmployees: numberOfEmployees,
          companyBank: companyBank,
          bankAccountNumber: bankAccount);

      // Add the user to Firestore
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(companyModel.toJson());
      await LoginManager.saveUser(user.uid);
      return user;
    } else {
      return null;
    }
  }

  Future<User?> signinWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return user;
  }

  Future<User?> signinWithGoogle(
      String companyName,
      String address,
      String phoneNumber,
      String tinNumber,
      int numberOfEmployees,
      String companyBank,
      String bankAccount) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (userCredential.additionalUserInfo!.isNewUser) {
        // Adding new user to Firestore
        CompanyModel newUser = CompanyModel(
            id: user!.uid,
            email: user.email!,
            photo: user.photoURL,
            companyName: companyName,
            address: address,
            phoneNumber: phoneNumber,
            tinNumber: tinNumber,
            numberOfEmployees: numberOfEmployees,
            companyBank: companyBank,
            bankAccountNumber: bankAccount);
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(newUser.toJson());
      }
      await LoginManager.saveUser(user!.uid);
      return user;
    }
    return null;
  }

  Future<User?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;

      await LoginManager.saveUser(user!.uid);
      return user;
    }
    return null;
  }

  Future<CompanyModel?> getUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>>? doc =
        await _firestore.collection('users').doc(id).get();
    CompanyModel companyModel = CompanyModel.fromJson(doc.data()!);
    return companyModel;
  }

  Future<CompanyModel?> updateUser(CompanyModel user) async {
    await _firestore.collection('users').doc(user.id).update(user.toJson());
    CompanyModel? companyModel = await getUser(user.id);
    return companyModel;
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await LoginManager.deleteUser();
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }
}
