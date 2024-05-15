import 'package:flutter/material.dart';
import 'package:tqk_lens/presentation/change_password_screen/change_password_screen.dart';
import 'package:tqk_lens/presentation/favorite_screen/favorite_screen.dart';
import 'package:tqk_lens/presentation/profile_screen/profile_screen.dart';
import 'package:tqk_lens/presentation/terms_of_service_screen/terms_of_service_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_screen/app_screen.dart';
import '../presentation/detailfood_screen/detailfood_screen.dart';
import '../presentation/forgot_pwd_screen/forgot_pwd_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/phonenew_screen/phonenew_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/accountsetup_screen/accountsetup_screen.dart';
import '../presentation/appinformation_screen/appinformation_screen.dart';
import '../presentation/helpcenter_screen/helpcenter_screen.dart';
import '../presentation/settings_screen/settings_screen.dart';
import '../presentation/detailingredient_screen/detailingredient_screen.dart';
import '../presentation/socialmediaaccountnew_screen/socialmediaaccountnew_screen.dart';
import '../presentation/usernamenew_screen/usernamenew_screen.dart';
import '../presentation/checkphone_screen/checkphone_screen.dart';

class AppRoutes {
  static const String appScreen = '/app_screen';

  static const String homeScreen = '/home_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String forgotPwdScreen = '/forgot_pwd_screen';

  static const String profileScreen = '/profile_screen';

  static const String favoriteScreen = '/favorite_screen';

  static const String accountsetupScreen = '/accountsetup_screen';

  static const String helpcenterScreen = '/helpcenter_screen';

  static const String settingsScreen = '/settings_screen';

  static const String appinformationScreen = '/appinformation_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String detailingredientScreen = '/detailingredient_screen';

  static const String detailfoodScreen = '/detailfood_screen';

    static const String usernamenewScreen = '/usernamenew_screen';

  static const String phonenewScreen = '/phonenew_screen';

  static const String socialmediaaccountnewScreen =
      '/socialmediaaccountnew_screen';

  static const String checkphoneScreen = '/checkphone_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String termOfServicesScreen = '/terms_of_service_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        appScreen: AppScreen.builder,
        homeScreen: HomeScreen.builder,
        loginScreen: LoginScreen.builder,
        signupScreen: SignupScreen.builder,
        forgotPwdScreen: ForgotPwdScreen.builder,
        profileScreen: ProfileScreen.builder,
        favoriteScreen: FavoriteScreen.builder,
        accountsetupScreen: AccountsetupScreen.builder,
        helpcenterScreen: HelpcenterScreen.builder,
        settingsScreen: SettingsScreen.builder,
        appinformationScreen: AppinformationScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        detailingredientScreen: DetailingredientScreen.builder,
        detailfoodScreen: DetailfoodScreen.builder,
        usernamenewScreen: UsernamenewScreen.builder,
        phonenewScreen: PhonenewScreen.builder,
        socialmediaaccountnewScreen: SocialmediaaccountnewScreen.builder,
        checkphoneScreen: CheckphoneScreen.builder,
        changePasswordScreen: ChangePasswordScreen.builder,
        termOfServicesScreen: TermsOfServiceScreen.builder,
        initialRoute: AppScreen.builder
      };
}
