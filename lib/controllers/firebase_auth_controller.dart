import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/info_snackbar.dart';

import 'package:shop_app/services/firebase_auth_service.dart';
import 'package:shop_app/models/user_data.dart';

class FirebaseAuthController extends GetxController {
  FireAuthService fireAuthService =
      FireAuthService(firebaseAuthInstanse: FirebaseAuth.instance);

  Rxn<User> user = Rxn(null);
  RxBool busy = false.obs;
  RxBool codeWaiting = false.obs;

  @override
  void onInit() {
    super.onInit();
    // fireAuthService.firebaseAuthInstanse.setSettings(appVerificationDisabledForTesting: true);

    fireAuthService.userStream.listen((User? newUser) async {
      user.value = newUser;
      print(newUser);
      /*if (newUser == null) {
        fireAuthService.signInAnonymously();
      }
      signInWithGoogle();
       fireAuthService.signOut();*/
    });
  }

  signOut() {
    fireAuthService.signOut();
  }

  Future signInByPhone({required String phone}) async {
    print('SignIn by phone > $phone');
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.verifyPhoneNumber(phone).timeout(
          Duration(seconds: 60),
          onTimeout: () => throw Exception('asd'));
      codeWaiting.value = true;
      busy.value = false;

      InfoSnackBar().infoSnackbar('Tip!', 'Code sended to $phone');
    } catch (e) {
      print('SignIn error');
      InfoSnackBar().errorSnackbar('Error!', e.toString());
      busy.value = false;
    }
  }

  signUp({required UserData userData, required String phone}) async {
    print('SignUp by phone > $phone');
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.verifyPhoneNumber(phone);
      codeWaiting.value = true;
      busy.value = false;
      InfoSnackBar().infoSnackbar('Tip!', 'Code sended to $phone');
    } catch (e) {
      print('SignUp error');
      busy.value = false;
      InfoSnackBar().errorSnackbar('Error!', 'SignUp error');
    }
  }

  verifyCode({required String code}) async {
    busy.value = true;
    try {
      await fireAuthService.signInWithSmsCode(code);
      busy.value = false;
      InfoSnackBar().succesSnackbar('Tip!', 'Sms code right');
      codeWaiting.value = false;
    } catch (e) {
      print('Code verification error');
      busy.value = false;
      InfoSnackBar().errorSnackbar('Error!', 'Code verification error');
    }
  }

  verifyNumber({required String number}) async {
    busy.value = true;
    try {
      await fireAuthService.verifyPhoneNumber(number);
      busy.value = false;
      InfoSnackBar().succesSnackbar('Tip!', 'Auth done');
      codeWaiting.value = false;
    } catch (e) {
      print('Code verification error');
      busy.value = false;
      InfoSnackBar().errorSnackbar('Error!', 'Code verification error');
    }
  }

  signInWithGoogle() async {
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.signInWithGoogle();
      busy.value = false;

      InfoSnackBar().succesSnackbar('Succes!', 'Signed with google');
    } catch (e) {
      print('SignIn error' + e.toString());
      busy.value = false;
      InfoSnackBar().errorSnackbar('Error!', 'SignIn error');
    }
  }

  signInByEmail({required String email, required String password}) async {
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.registrationByMail(
          email: email, password: password);
      busy.value = false;

      InfoSnackBar().succesSnackbar('Succes!', 'Signed with google');
    } catch (e) {
      print('SignUp error');
      busy.value = false;
      InfoSnackBar().errorSnackbar('Error!', 'SignUp error');
    }
  }
}
