import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitar/core/assets/app_images.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../../domain/entities/user.dart';
import '../state/profile_viewmodel.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.habitWoman1)),
            ),
          ),
          // const SizedBox(height: 11),
          Flexible(
            child: Text(
              userEntity.username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            userEntity.email,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total habit${(int.parse(userEntity.habitsCompleted) > 1) ? "s" : ""} ${userEntity.habitsCompleted} ",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(AppVectors.appLogo, height: 15, width: 15),
            ],
          ),
          const SizedBox(height: 18),
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _DeleteAccountButton extends StatelessWidget {
  const _DeleteAccountButton();

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
  const _LogOutButton();

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
