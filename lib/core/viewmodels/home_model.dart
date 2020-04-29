import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';
import '../models/post.dart';
import '../services/api.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
