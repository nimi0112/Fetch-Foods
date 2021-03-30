import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quovantis_assignment/customviews/route_animations.dart';
import 'package:quovantis_assignment/provider/menu_repo_provider.dart';
import 'package:quovantis_assignment/resources/app_colors.dart';
import 'package:quovantis_assignment/resources/images_paths.dart';
import 'package:quovantis_assignment/resources/strings.dart';
import 'package:quovantis_assignment/utils.dart';
import 'package:quovantis_assignment/views/common/primary_button.dart';
import 'package:quovantis_assignment/views/splash/splash_page_bloc.dart';

import '../../food_menu_app.dart';

//Created by Nimish Nandwana on 28/03/2021.
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Utils.hideKeyBoard();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashPageBloc, SplashPageState>(builder: (context, state) {
      return SplashPageUi(
        onButtonClick: () {
          onContinueClicked(context);
        },
      );
    });
  }

  void onContinueClicked(BuildContext context) {
    Navigator.push(
        context,
        RouteAnimationSlideFromBottom(
            widget: FoodMenuApp(
          repository: MenuRepoProvider.getInstance(),
        )));
  }
}

class SplashPageUi extends StatelessWidget {
  const SplashPageUi({
    this.onButtonClick,
    Key key,
  }) : super(key: key);

  final VoidCallback onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: AppColors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.appBlack,
      ),
      child: Stack(
        children: [
          Image.asset(
            splashBackgroundImage,
            fit: BoxFit.fill,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Image.asset(
              imgStarWars,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                  buttonText: getFitter,
                  includeHorizontalPadding: true,
                  onButtonPressed: onButtonClick))
        ],
      ),
    ));
  }
}
