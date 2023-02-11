import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_arkamaya/common/constants/app_values.dart';
import 'package:users_arkamaya/common/styles/app_colors.dart';
import 'package:users_arkamaya/common/styles/app_text_styles.dart';
import 'package:users_arkamaya/presentation/bloc/manage_user_bloc.dart';
import 'package:users_arkamaya/presentation/widgets/app_dialog.dart';

class AddUserPage extends StatefulWidget {
  static const routeName = "/add-user";

  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create",
          style: AppTextStyle.appBarTitle,
        ),
      ),
      body: BlocListener<ManageUserBloc, ManageUserState>(
        listener: (context, state) {
          if (state is ManageUserLoading) {
            AppDialog.showMainLoading(context);
          }

          if (state is ManageUserSuccess) {
            AppDialog.hideMainLoading(context);

            nameController.clear();
            jobController.clear();

            AppDialog.showMainSnackbar(
              context,
              "Data has been created :\nID : ${state.newUser.id}\ncreatedAt : ${state.newUser.createdAt}",
              isSuccess: true,
            );
          }

          if (state is ManageUserError) {
            AppDialog.hideMainLoading(context);

            AppDialog.showMainSnackbar(
              context,
              state.message,
              isError: true,
            );
          }
        },
        child: GestureDetector(
          onTap: () {
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.padding,
                vertical: AppValues.largePadding,
              ),
              children: [
                //Name
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    AppValues.margin_4,
                    AppValues.marginZero,
                    AppValues.margin_4,
                    AppValues.smallMargin,
                  ),
                  child: Text(
                    "Name",
                    style: AppTextStyle.title.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }

                    if (value.trim() == "") {
                      return "Enter the name correctly";
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Name User",
                  ),
                ),
                const SizedBox(
                  height: AppValues.margin_20,
                ),

                //Job
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    AppValues.margin_4,
                    AppValues.marginZero,
                    AppValues.margin_4,
                    AppValues.smallMargin,
                  ),
                  child: Text(
                    "Job",
                    style: AppTextStyle.title.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                TextFormField(
                  controller: jobController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Jobs cannot be empty";
                    }

                    if (value.trim() == "") {
                      return "Enter the job correctly";
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Job User",
                  ),
                ),
                const SizedBox(
                  height: AppValues.margin_40,
                ),

                //Button Submit
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String name = nameController.text;
                        String job = jobController.text;

                        await AppDialog.showAlertDialog(
                          context,
                          "Add User",
                          "Are you sure the data you entered is correct?",
                          positiveButtonText: "Yes",
                          negativeButtonText: "No",
                          positiveButtonCallback: () {
                            context
                                .read<ManageUserBloc>()
                                .add(AddUserEvent(name, job));
                          },
                        );

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppValues.margin_40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
