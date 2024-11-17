import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/core/assets/app_images.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/constants/constants.dart';
import '../../../auth/presentation/widgets/next_button.dart';
import '../state/profile_viewmodel.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperBuilder(
      builder: (context) => Container(
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 93,
              width: 93,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImages.habitMan),
                ),
              ),
            ),
            const SizedBox(height: 11),
            Text(
              getHomeViewModel.user.state.email,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            Text(
              getHomeViewModel.user.state.username,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            Text(
              "Completed ${getHomeViewModel.user.state.habitsCompleted} habit${(int.parse(getHomeViewModel.user.state.habitsCompleted) > 1) ? "s" : ""}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _DeleteAccountButton(),
                  const SizedBox(width: 15),
                  _LogOutButton(),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _DeleteAccountButton extends StatelessWidget {
  const _DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: Constants.skipButtonHeroTag,
        child: OutlinedButton(
          onPressed: () {
            getProfileViewModel.deleteAccount();
          },
          style: OutlinedButton.styleFrom(
            elevation: 5,
          ),
          child: Text(
            "Delete account",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

class _LogOutButton extends StatelessWidget {
  const _LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NextButton(
        title: "Log out",
        onClick: () async {
          getProfileViewModel.logOut();
        },
      ),
    );
  }
}
