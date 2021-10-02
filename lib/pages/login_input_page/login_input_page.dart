import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mecar/bloc/login_input_page_bloc.dart';
import 'package:mecar/pages/home_page/home_page.dart';
import 'package:mecar/util/shared_preference_util.dart';
import 'package:mecar/util/words_util.dart';

import '../../util/assets_path_util.dart';
import '../../util/base_components.dart';
import '../../util/colors_util.dart';
import '../../util/size_util.dart';

class LoginInputPage extends StatefulWidget {
  @override
  _LoginInputPageState createState() => _LoginInputPageState();
}

class _LoginInputPageState extends State<LoginInputPage> with BaseComponents {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  LoginInputPageBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = new LoginInputPageBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(SizeUtil.padding16),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: SvgPicture.asset(
                          AssetPathUtil.iconBack,
                          color: ColorsUtil.blackColorBtn,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                  Expanded(
                      flex: 2,
                      child: buildTitlePage(title: WordsUtil.login)),
                  Expanded(
                    flex: 15,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          textFromFieldUtil(
                              controller: usernameController,
                              textInputAction: TextInputAction.next,
                              hintText: '${WordsUtil.validateInputUsername}',
                              labelText: '${WordsUtil.username}',
                              validate: (value) {
                                if (value != '') {
                                  return null;
                                } else {
                                  return '${WordsUtil.validateInputUsername}';
                                }
                              }),
                          StreamBuilder<bool>(
                              stream: bloc.getIsShowPassword,
                              builder: (context, isShowPassword) {
                                return textFromFieldUtil(
                                    controller: passwordController,
                                    isObscureText: isShowPassword.data != null
                                        ? isShowPassword.data
                                        : true,
                                    textInputAction: TextInputAction.done,
                                    hintText: '${WordsUtil.validateInputPassword}',
                                    labelText: '${WordsUtil.password}',
                                    iconButtonSuffixIcon: IconButton(
                                        icon: isShowPassword.data == true
                                            ? Icon(
                                                Icons.remove_red_eye_outlined)
                                            : Icon(Icons.remove_red_eye),
                                        onPressed: () {
                                          bloc.setIsShowPassword(
                                              !isShowPassword.data);
                                        }),
                                    validate: (value) {
                                      if (value != '') {
                                        return null;
                                      } else {
                                        return '${WordsUtil.validateInputPassword}';
                                      }
                                    });
                              }),
                          SizedBox(
                            height: SizeUtil.padding8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: buttonUtil(
                                      title: '${WordsUtil.login}',
                                      handleOnPress: () {
                                        if (_formKey.currentState.validate()) {
                                          SharedPreferenceUtil().setStringSharePreference(key: WordsUtil.token, value: WordsUtil.token);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomePage()),
                                          );
                                        }
                                      })),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    bloc.disposeBlocBase();
    super.dispose();
  }
}
