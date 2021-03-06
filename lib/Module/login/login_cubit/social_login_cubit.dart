import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twasol/Module/login/login_cubit/social_login_states.dart';
import 'package:twasol/shared/components/constants.dart';
import 'package:twasol/shared/network/local/cache_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingStates());
    print('in userLogin');

    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print('==========================');
      CacheHelper.saveData(key: 'email', value: value.user!.email);
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      uId = value.user!.uid;
      print(value.user!.uid);
      emit(SocialLoginSuccessStates(value.user!.uid));
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    emit(SocialSignInWithGoogleSuccessStates());
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
