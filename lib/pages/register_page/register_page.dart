import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mecar/bloc/register_page_bloc.dart';
import 'package:mecar/pages/home_page/home_page.dart';
import 'package:mecar/util/assets_path_util.dart';
import 'package:mecar/util/base_components.dart';
import 'package:mecar/util/colors_util.dart';
import 'package:mecar/util/size_util.dart';
import 'package:mecar/util/words_util.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>  with BaseComponents{
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RegisterPageBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = new RegisterPageBloc();
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
                      child: buildTitlePage(title: WordsUtil.register)),
                  Expanded(
                    flex: 15,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          textFromFieldUtil(
                              controller: usernameController,
                              textInputAction: TextInputAction.next,
                              hintText: '${WordsUtil.username}',
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
                                    hintText: '${WordsUtil.password}',
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
                                      if (value.isEmpty) {
                                        return "${WordsUtil.validateInputPassword}";
                                      } else if (value.length < 8) {
                                        return "${WordsUtil.validateInputLeast8Characters}";
                                      }else {
                                        return null;
                                      }
                                    });
                              }),
                          StreamBuilder<bool>(
                              stream: bloc.getIsShowConfirmPassword,
                              builder: (context, isShowConfirmPassword) {
                                return textFromFieldUtil(
                                    controller: confirmPasswordController,
                                    isObscureText: isShowConfirmPassword.data != null
                                        ? isShowConfirmPassword.data
                                        : true,
                                    textInputAction: TextInputAction.done,
                                    hintText: '${WordsUtil.validateInputPasswordAgain}',
                                    labelText: '${WordsUtil.passwordAgain}',
                                    iconButtonSuffixIcon: IconButton(
                                        icon: isShowConfirmPassword.data == true
                                            ? Icon(
                                            Icons.remove_red_eye_outlined)
                                            : Icon(Icons.remove_red_eye),
                                        onPressed: () {
                                          bloc.setIsShowConfirmPassword(
                                              !isShowConfirmPassword.data);
                                        }),
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "${WordsUtil.validateInputConfirmPassword}";
                                      } else if (value.length < 8) {
                                        return "${WordsUtil.validateInputLeast8Characters}";
                                      } else if (value != passwordController.text) {
                                        return "${WordsUtil.validateInputSame}";
                                      } else {
                                        return null;
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
                                      title: '${WordsUtil.register}',
                                      handleOnPress: () {
                                        if (_formKey.currentState.validate()) {
                                          Navigator.pushReplacement<void, void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>  HomePage(),
                                            ),
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
}
