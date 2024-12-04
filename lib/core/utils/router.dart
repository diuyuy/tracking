import 'package:go_router/go_router.dart';
import 'package:mini_project_2_with_android_studio/tracking/presentation/pages/edit_screen.dart';
import '../../tracking/presentation/pages/pages_export.dart';
import 'const_router_name.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ConstRouterName.HOME_SCREEN,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/activity',
      name: ConstRouterName.ACTIVITY_SCREEN,
      builder: (context, state) {
        final String currentDate = state.extra as String;
        return ActivityScreen(selectedDate: currentDate);
      },
    ),
    GoRoute(
      path: '/add_activity',
      name: ConstRouterName.ADD_ACTIVITY_SCREEN,
      builder: (context, state) => const AddActivityScreen(),
    ),
    GoRoute(
      path: '/tracking',
      name: ConstRouterName.TRACKING_SCREEN,
      builder: (context, state) {
        final argument = state.extra as RouterArgument;
        return TrackingScreen(index: argument.index,selectedDate: argument.selectedDate,);
      },
    ),
    GoRoute(
      path: '/edit',
      name: ConstRouterName.EDIT_SCREEN,
      builder: (context, state) {
        final argument = state.extra as RouterArgument;
        return EditScreen(index: argument.index,selectedDate: argument.selectedDate,);
      },
    ),
  ],
);

class RouterArgument{
  final int index;
  final String selectedDate;

  RouterArgument({required this.index,required this.selectedDate});
}