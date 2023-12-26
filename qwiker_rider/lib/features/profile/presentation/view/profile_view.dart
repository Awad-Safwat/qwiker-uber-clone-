import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/widgets/custom_toast.dart';
import 'package:qwiker_rider/features/profile/data/user_repo_imple.dart';
import 'package:qwiker_rider/features/profile/presentation/manager/user_data/user_data_cubit.dart';
import 'package:qwiker_rider/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(getIt<UserRepoImple>()),
      child: Scaffold(
        body: BlocListener<UserDataCubit, UserDataState>(
          listener: (context, state) {
            if (state is UserDataLoading) {
              showProgressIndicator(context);
            }
            if (state is UserDataAddedSuccess) {
              Navigator.pop(context);
              customToast(message: 'Task Done successfully').show(context);
            }
            if (state is UserDataFalure) {
              Navigator.pop(context);
              print(state.errorMessage);
              customToast(message: state.errorMessage).show(context);
            }
          },
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
