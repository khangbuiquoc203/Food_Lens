import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';
import 'package:permission_handler/permission_handler.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Requesting permissions
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.microphone,
    Permission.audio,
    Permission.photos,
    Permission.videos,
    Permission.manageExternalStorage,
    // Permission.location,
    Permission.accessMediaLocation
  ].request();

  bool cameraGranted = statuses[Permission.camera]?.isGranted ?? false;
  bool microphoneGranted = statuses[Permission.microphone]?.isGranted ?? false;
  bool manageExternalStorage =
      statuses[Permission.manageExternalStorage]?.isGranted ?? false;
  bool audio = statuses[Permission.audio]?.isGranted ?? false;
  bool photos = statuses[Permission.photos]?.isGranted ?? false;
  bool videos = statuses[Permission.videos]?.isGranted ?? false;
  if (cameraGranted &&
      microphoneGranted &&
      videos &&
      photos &&
      audio &&
      manageExternalStorage) {
    print("Camera and microphone and all permissions granted");
  } else {
    print("Permissions not granted");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: PrefUtils().getThemeData(),
            ),
          ),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: theme,
                title: 'tqk_lens',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  )
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
