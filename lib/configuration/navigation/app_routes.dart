typedef RouteInfo = ({String name, String path});

abstract class AppRoutes {
  static const RouteInfo root = (name: 'root', path: '/root');
  static const RouteInfo profile = (name: 'profile', path: '/profile');
}
