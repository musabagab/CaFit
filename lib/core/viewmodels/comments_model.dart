import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';
import '../models/comment.dart';
import '../services/api.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
