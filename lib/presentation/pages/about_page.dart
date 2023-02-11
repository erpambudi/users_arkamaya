import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:users_arkamaya/common/constants/app_icons.dart';
import 'package:users_arkamaya/common/constants/app_images.dart';
import 'package:users_arkamaya/common/constants/app_values.dart';
import 'package:users_arkamaya/common/styles/app_colors.dart';
import 'package:users_arkamaya/common/styles/app_text_styles.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SliverLayoutBuilder(
        builder: (context, constraints) {
          return SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            centerTitle: true,
            pinned: true,
            expandedHeight: 300,
            title: Text(
              "About",
              style: AppTextStyle.appBarTitle.copyWith(
                color: AppColors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      AppImages.natureBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SizedBox(
                              height: 130,
                              width: 130,
                              child: CircleAvatar(
                                backgroundColor: AppColors.grey,
                                backgroundImage: AssetImage(
                                  AppImages.rizki,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppValues.margin_12,
                        ),
                        Text(
                          "Rizki Pambudi",
                          style: AppTextStyle.titleWhite.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Mobile Developer",
                          style: AppTextStyle.subtitleWhite,
                        ),
                        const SizedBox(
                          height: AppValues.padding,
                        )
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

    Widget accountDescItem(String iconPath, String title, {String? subtitle}) {
      return Container(
        margin: const EdgeInsets.only(bottom: AppValues.margin),
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.buttonVerticalPadding,
          vertical: AppValues.halfPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppValues.radius_12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 29,
              width: 29,
            ),
            const SizedBox(
              width: AppValues.margin_12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.subtitle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  subtitle != null
                      ? Container(
                          margin: const EdgeInsets.only(
                            top: AppValues.margin_4,
                          ),
                          child: Text(
                            subtitle,
                            style: AppTextStyle.subtitle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget accountDetail() {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(
              AppValues.extraLargePadding,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF3F6).withOpacity(0.48),
            ),
            child: Column(
              children: [
                accountDescItem(AppIcons.idCard, "Rizki Pambudi"),
                accountDescItem(AppIcons.email, "erpambudi0@gmail.com"),
                accountDescItem(AppIcons.phone, "+628994636544"),
                accountDescItem(AppIcons.location, 'Cilacap - Jawa Tengah',
                    subtitle: 'Kapten Sukardan Street no.87'),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          header(),
          accountDetail(),
        ],
      ),
    );
  }
}
