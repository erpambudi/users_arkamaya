import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_arkamaya/common/constants/app_images.dart';
import 'package:users_arkamaya/common/constants/app_values.dart';
import 'package:users_arkamaya/common/styles/app_colors.dart';
import 'package:users_arkamaya/common/styles/app_text_styles.dart';
import 'package:users_arkamaya/presentation/bloc/user_detail_bloc.dart';
import 'package:users_arkamaya/presentation/widgets/app_image_network.dart';
import 'package:users_arkamaya/presentation/widgets/app_shimmer.dart';
import 'package:users_arkamaya/presentation/widgets/result_state_view.dart';

class UserDetailPage extends StatelessWidget {
  static const routeName = "/detail-user";

  final int idUser;

  const UserDetailPage(this.idUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail User",
          style: AppTextStyle.appBarTitle,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserDetailBloc>().add(GetUserDetailEvent(idUser));
        },
        child: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            if (state is UserDetailHasData) {
              final user = state.userDetail;

              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.largePadding,
                  vertical: AppValues.extraLargePadding,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      AppValues.padding,
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
                            user.data.avatar,
                            height: 80,
                            width: 80,
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
                                "${user.data.firstName} ${user.data.lastName}",
                                style:
                                    AppTextStyle.title.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: AppValues.margin_4,
                              ),
                              Text(
                                user.data.email,
                                style: AppTextStyle.subtitle
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppValues.margin_18,
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      AppValues.padding,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Support",
                          style: AppTextStyle.title,
                        ),
                        const SizedBox(
                          height: AppValues.margin_4,
                        ),
                        Text(
                          "${user.support}",
                          style: AppTextStyle.subtitle,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            if (state is UserDetailError) {
              return ResultStateView(AppImages.errorData, state.message);
            }

            return const UserDetailShimmer();
          },
        ),
      ),
    );
  }
}
