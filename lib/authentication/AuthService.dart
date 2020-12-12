import 'package:firebase_auth/firebase_auth.dart';
import 'package:kablosuzbeyin/models/UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcı Objesi Oluşturma
  UserModel _userFromFirebase(User user) {
    return user == null ? null : UserModel(uid: user.uid);
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
}
