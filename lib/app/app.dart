import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../di.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/locale/app_locale.dart';
import 'core/utils/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthBloc>()),
        BlocProvider(create: (_) => locator<ProfileBloc>()),
      ],
      child: RefreshConfiguration(
        headerBuilder: () => const ClassicHeader(
          idleText: '',
          failedText: '',
          releaseText: '',
          completeText: '',
          refreshingText: '',
          canTwoLevelText: '',
        ),
        enableScrollWhenRefreshCompleted: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          themeMode: AppTheme.themeMode,
          locale: AppLocale.locale,
          supportedLocales: AppLocale.supportLocales,
          localizationsDelegates: AppLocale.localizationDelegates,
          initialRoute: AppRoute.init,
          onGenerateRoute: AppRoute.onGenerateRoute,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
