import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitar/core/assets/app_images.dart';
import 'package:habitar/core/res/data_state.dart';
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
    return SuperBuilder(
        builder: (context) => Container(
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
                      image: DecorationImage(
                          image: AssetImage(AppImages.habitWoman1)),
                    ),
                  ),
                  // const SizedBox(height: 11),
                  getProfileViewModel.editingProfile.state
                      ? _UsernameTextField()
                      : _UsernameText(userEntity.username),
                  const SizedBox(height: 8),
                  getProfileViewModel.editingProfile.state
                      // ? _EmailTextField()
                      ? _EmailText(userEntity.email)
                      : _EmailText(userEntity.email),
                  TextButton(
                      onPressed: () async {
                        if (getProfileViewModel.editingProfile.state) {
                          var result = await getProfileViewModel.updateProfile();
                          if (result is DataFailed){
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Error : ${(result).errorMessage}"),
                              ));
                            }
                          }

                          if (result is DataSuccess){
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Updated"),
                              ));
                            }
                          }
                        } else {
                          getProfileViewModel.toggleEditingProfile();
                        }
                      },
                      child: Text(getProfileViewModel.editingProfile.state
                          ? "Done"
                          : "Edit")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total habit${(int.parse(userEntity.habitsCompleted) > 1) ? "s" : ""} ${userEntity.habitsCompleted} ",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SvgPicture.asset(AppVectors.appLogo,
                          height: 15, width: 15),
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
            ));
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 90),
      child: IntrinsicWidth(
        child: TextField(
          decoration: const InputDecoration(
              labelText: "Username", border: UnderlineInputBorder()),
          controller: getProfileViewModel.getUserNameController(),
          maxLines: 1,
          keyboardType: TextInputType.name,
        ),
      ),
    );
  }
}

class _UsernameText extends StatelessWidget {
  const _UsernameText(this.userName);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        userName,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 30),
      child: IntrinsicWidth(
        child: TextField(
          decoration: const InputDecoration(
              labelText: "Email", border: UnderlineInputBorder()),
          controller: getProfileViewModel.getEmailController(),
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}

class _EmailText extends StatelessWidget {
  const _EmailText(this.email);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        email,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
