import 'package:chat_app/features/Auth/presentation/view/auth.dart';
import 'package:chat_app/features/Auth/presentation/view/sign_in_google.dart';
import 'package:chat_app/features/Auth/presentation/view/sign_up.dart';
import 'package:chat_app/features/Home/presentation/view/home_view.dart';
import 'package:chat_app/features/Splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kAuthView = "/AuthView";
  static const kHomeView = "/HomeView";
  static const kUserInfoView = "/UserInfoView";
  static const kSearchView = "/SearchView";
  static const kSignInGoogleView = "/SignInGoogleView";
  static const kSignUpView = "/SignUpView";
  static const kProfileView = "/ProfileView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: kSignInGoogleView,
        builder: (context, state) => const SignInGoogleView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      // GoRoute(
      //   path: kProfileView,
      //   builder: (context, state) => const ProfileView(),
      // ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      /*GoRoute(
        path: kUserInfoView,
        builder: (context, state) => const UserInfoView(userName: ,),
      ),*/
      /*GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      )*/
    ],
  );
}
