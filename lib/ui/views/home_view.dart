import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

import '../../core/models/post.dart';
import '../../core/models/user.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import '../widgets/postlist_item.dart';

class HomeView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) {
          model.getPosts(Provider.of<User>(context).id);
        },
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: model.state == ViewState.Idle
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        UIHelper.verticalSpaceLarge(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Welcome ${Provider.of<User>(context).name}',
                            style: headerStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Here are all your posts',
                              style: subHeaderStyle),
                        ),
                        UIHelper.verticalSpaceSmall(),
                        Expanded(child: getPostsUi(model.posts)),
                      ])
                : Center(child: CircularProgressIndicator())));
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
            post: posts[index],
            onTap: () {
              Navigator.pushNamed(context, 'post', arguments: posts[index]);
            },
          ));
}
