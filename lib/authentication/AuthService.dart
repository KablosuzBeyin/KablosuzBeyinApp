import 'package:firebase_auth/firebase_auth.dart';
import 'package:kablosuzbeyin/models/UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcı Objesi Oluşturma
  UserModel _userFromFirebase(User user) {
    return user == null ? null : UserModel(uid: user.uid);
  }

  // Kullanıcı Stream'ı
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // Kayıt olmadan giriş

  Future anonymousSignIn() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Çıkış

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Eposta ve şifreyle kayıt

  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // E posta ve Şifreyle giriş

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
