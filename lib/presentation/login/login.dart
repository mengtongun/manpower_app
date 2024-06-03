import 'package:another_flushbar/flushbar_helper.dart';
import 'package:app/constants/assets.dart';
import 'package:app/constants/strings.dart';
import 'package:app/core/stores/form/form_store.dart';
import 'package:app/core/widgets/app_icon_widget.dart';
import 'package:app/core/widgets/empty_app_bar_widget.dart';
import 'package:app/core/widgets/progress_indicator_widget.dart';
import 'package:app/core/widgets/textfield_widget.dart';
import 'package:app/data/sharedpref/constants/preferences.dart';
import 'package:app/presentation/home/store/theme/theme_store.dart';
import 'package:app/presentation/login/store/user/user_store.dart';
import 'package:app/utils/device/device_utils.dart';
import 'package:app/utils/locale/app_localization.dart';
import 'package:app/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/service_locator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;
  late FocusNode _LoginBtnFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _LoginBtnFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
          Observer(
            builder: (context) {
              return _userStore.loginSuccess
                  ? navigate(context)
                  : _showErrorMessage(_userStore.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            Text(
              Strings.appName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context).translate("login_tv_subtitle"),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 24.0),
            _buildUsernameField(),
            _buildPasswordField(),
            _buildSignInButton(),
            _buildNoAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: AppLocalizations.of(context).translate('login_et_username'),
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUsername(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _formStore.formErrorStore.username,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: AppLocalizations.of(context).translate('login_et_password'),
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _formStore.formErrorStore.password,
          onChanged: (value) {
            _formStore.setPassword(_passwordController.text);
          },
          onFieldSubmitted: (value) =>
              {FocusScope.of(context).requestFocus(_LoginBtnFocusNode)},
        );
      },
    );
  }

  Widget _buildNoAccountButton() {
    return Align(
      alignment: FractionalOffset.center,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Text(
          AppLocalizations.of(context).translate('login_btn_no_account'),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        onPressed: () {
          Future.delayed(Duration(milliseconds: 0), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.register, (Route<dynamic> route) => false);
          });
        },
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FilledButton(
        child: Text(
          AppLocalizations.of(context).translate('login_btn_sign_in'),
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        onPressed: () async {
          if (_formStore.canLogin) {
            DeviceUtils.hideKeyboard(context);
            _userStore.login(
                _userEmailController.text, _passwordController.text);
          } else {
            _showErrorMessage('Please fill in all fields');
          }
        },
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((pref) {
      pref.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _LoginBtnFocusNode.dispose();
    super.dispose();
  }
}
