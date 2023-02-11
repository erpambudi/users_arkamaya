import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_arkamaya/common/constants/app_images.dart';
import 'package:users_arkamaya/common/constants/app_values.dart';
import 'package:users_arkamaya/common/styles/app_colors.dart';
import 'package:users_arkamaya/common/styles/app_text_styles.dart';
import 'package:users_arkamaya/presentation/bloc/user_detail_bloc.dart';
import 'package:users_arkamaya/presentation/bloc/users_bloc.dart';
import 'package:users_arkamaya/presentation/widgets/app_image_network.dart';
import 'package:users_arkamaya/presentation/widgets/app_shimmer.dart';
import 'package:users_arkamaya/presentation/widgets/result_state_view.dart';

import 'user_detail_page.dart';

class UsersPage extends StatelessWidget {
  static const routeName = "/users";

  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor.withOpacity(0.48),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "List Users",
          style: AppTextStyle.appBarTitle,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UsersBloc>().add(GetUsersEvent());
        },
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersHasData) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(UserDetailPage.routeName,
                          arguments: user.id);

                      context
                          .read<UserDetailBloc>()
                          .add(GetUserDetailEvent(user.id));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppValues.padding),
                      margin: EdgeInsets.only(
                        top: user == state.users.first
                            ? AppValues.margin
                            : AppValues.marginZero,
                        left: AppValues.margin,
                        right: AppValues.margin,
                        bottom: user == state.users.last
                            ? AppValues.margin_32
                            : AppValues.margin_10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppValues.radius_12),
                            ),
                            child: AppImageNetwork(
                              user.avatar,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: AppValues.margin_18,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user.firstName} ${user.lastName}",
                                  style: AppTextStyle.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: AppValues.margin_4,
                                ),
                                Text(
                                  user.email,
                                  style: AppTextStyle.subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            if (state is UsersError) {
              return ResultStateView(AppImages.errorData, state.message);
            }

            return const UsersShimmer();
          },
        ),
      ),
    );
  }
}
