typedef RouteInfo = ({String name, String path});

abstract class AppRoutes {
  static const RouteInfo root = (name: 'root', path: '/root');
  static const RouteInfo profile = (name: 'profile', path: '/profile');
  static const RouteInfo search = (name: 'search', path: '/search');
  static const RouteInfo searchResult = (name: 'searchResult', path: 'result');
  static const RouteInfo searchExtraResult = (name: 'searchExtraResult', path: 'extra-result');
  static const RouteInfo profileInfo = (name: 'profileInfo', path: ':id');
}
