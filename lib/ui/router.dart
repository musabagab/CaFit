import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/onboarding_view.dart';

import '../core/models/post.dart';
import 'views/home_view.dart';
import 'views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'onboarding':
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
