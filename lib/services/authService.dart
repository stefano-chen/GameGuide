import 'package:firebase_auth/firebase_auth.dart';
import 'package:gameguide/services/saveManager.dart';

class AuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user{
    return _auth.onAuthStateChanged;
  }

  Future resetPassword(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      return e.toString().length;
    }
  }

  Future loginWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(result.user.isEmailVerified){
        return result.user;
      }
      else{
        await _auth.signOut();
        return 'Email is not Verified';
      }
    }catch(e){
      return 'Email or Password is Incorrect';
    }
  }

  Future registrationWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await result.user.sendEmailVerification();
      await _auth.signOut();
      return result.user;
    }catch(e){
      return e.toString().length;
    }
  }

  Future deleteAccount() async{
    try{
      FirebaseUser user = await _auth.currentUser();
      user.delete();
      await SaveManager.removeAllFavorites();
    }catch(e){
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      return null;
    }
  }
}