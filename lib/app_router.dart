import 'package:fixit_admin/injector.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:fixit_admin/views/screens/error_screen.dart';
import 'package:fixit_admin/views/screens/form_screen.dart';

class RouteUri {
  static const String home = '/';
  static const String error404 = '/404';
  static const String login = '/login';
  static const String register = '/register/jfxUtK08tJgUobUVKOyOnoxJt1l2';
  static const String dashboard = '/dashboard';
  static const String myProfile = '/my-profile';
  static const String logout = '/logout';
  static const String technician = '/technician';
  static const String technicianDetail = '/technician/detail';
  static const String unverifiedTechnician = '/unverified-technician';
  static const String unverifiedTechnicianDetail =
      '/unverified-technician/detail';
  static const String client = '/client';
  static const String clientDetail = '/client/detail';
  static const String order = '/order';
  static const String orderDetail = '/order/detail';
  static const String electronic = '/electronic';
  static const String electronicDetail = '/electronic/detail';
  static const String addElectronic = '/electronic/add';
  static const String banner = '/banner';
  static const String bannerDetail = '/banner/detail';
  static const String addBanner = '/banner/add';
  static const String form = '/form';
  static const String generalUi = '/general-ui';
  static const String colors = '/colors';
  static const String text = '/text';
  static const String buttons = '/buttons';
  static const String dialogs = '/dialogs';
  static const String crud = '/crud';
  static const String crudDetail = '/crud-detail';
  static const String iframe = '/iframe';
}

const List<String> unrestrictedRoutes = [
  RouteUri.error404,
  RouteUri.logout,
  // RouteUri.login, // Remove this line for actual authentication flow.
  // RouteUri.register, // Remove this line for actual authentication flow.
];

const List<String> publicRoutes = [
  RouteUri.login, // Enable this line for actual authentication flow.
  RouteUri.register, // Enable this line for actual authentication flow.
];

GoRouter appRouter() {
  return GoRouter(
    initialLocation: RouteUri.home,
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    routes: [
      GoRoute(
        path: RouteUri.home,
        redirect: (context, state) => RouteUri.dashboard,
      ),
      GoRoute(
        path: RouteUri.dashboard,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<GeneralCubit>()..openPage(),
            child: const DashboardScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.myProfile,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<ProfileCubit>(),
            child: const MyProfileScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.login,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.register,
        pageBuilder: (context, state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: const RegisterScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteUri.logout,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const LogoutScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.technician,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<TechnicianCubit>()..openPage(),
            child: const TechnicianScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.technicianDetail,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<TechnicianDetailCubit>()
              ..getTechnician(state.uri.queryParameters['id'] ?? ''),
            child: TechnicianDetailScreen(
                id: state.uri.queryParameters['id'] ?? ''),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.unverifiedTechnician,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<UnverifiedTechnicianCubit>()..openPage(),
            child: const UnverifiedTechnicianScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.unverifiedTechnicianDetail,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<UnverifiedTechnicianDetailCubit>()
              ..getTechnician(state.uri.queryParameters['id'] ?? ''),
            child: UnverifiedTechnicianDetailScreen(
                id: state.uri.queryParameters['id'] ?? ''),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.client,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<ClientCubit>()..openPage(),
            child: const ClientScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.clientDetail,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<ClientCubit>()
              ..getClient(state.uri.queryParameters['id'] ?? ''),
            child:
                ClientDetailScreen(id: state.uri.queryParameters['id'] ?? ''),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.order,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<OrderCubit>()..getAllOrder(),
            child: const OrderScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.orderDetail,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<OrderCubit>()
              ..getOrder(state.uri.queryParameters['id'] ?? ''),
            child: OrderDetailScreen(id: state.uri.queryParameters['id'] ?? ''),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.electronic,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<ElectronicCubit>()..getAllElectronic(),
            child: const ElectronicScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.addElectronic,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<AddElectronicCubit>(),
            child: const AddElectronicScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.electronicDetail,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<ElectronicDetailCubit>()
              ..getElectronic(state.uri.queryParameters['id'] ?? ''),
            child: ElectronicDetailScreen(
                id: state.uri.queryParameters['id'] ?? ''),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.banner,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<BannerCubit>()..getAllBanner(),
            child: const BannerScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.addBanner,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<AddBannerCubit>(),
            child: const AddBannerScreen(),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.bannerDetail,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<BannerDetailCubit>()
              ..getBanner(state.uri.queryParameters['id'] ?? ''),
            child:
                BannerDetailScreen(id: state.uri.queryParameters['id'] ?? ''),
          ),
        ),
      ),
      GoRoute(
        path: RouteUri.form,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const FormScreen(),
        ),
      ),
    ],
    redirect: (context, state) {
      if (unrestrictedRoutes.contains(state.matchedLocation)) {
        return null;
      } else if (publicRoutes.contains(state.matchedLocation)) {
        // Is public route.
        if (SharedPref.getIsLogin() ?? false) {
          // User is logged in, redirect to home page.
          return RouteUri.home;
        }
      } else {
        // Not public route.
        if (!(SharedPref.getIsLogin() ?? false)) {
          // User is not logged in, redirect to login page.
          return RouteUri.login;
        }
      }

      return null;
    },
  );
}
