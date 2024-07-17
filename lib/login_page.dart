import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/api_integration.dart';
import 'package:new_test/bloc/employ_bloc.dart';
import 'package:new_test/bloc/employe_event.dart';
import 'package:new_test/config/app_string.dart';
import 'package:new_test/repository_one.dart';
import 'package:new_test/show_user_screen.dart';
import 'package:new_test/wigdet.dart';

import 'bloc/employe_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  EmployBloc empBloc = EmployBloc(ApiIntegrationProvider());
  TextEditingController nameCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  void initState() {
    empBloc = EmployBloc(ApiIntegrationProvider());
    super.initState();
  }

  @override
  void dispose() {
    empBloc.close();
    nameCon.dispose();
    passCon.dispose();
    ageCon.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   // empBloc.add();
  //   //ApiIntegration().getApiData();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('loginpage'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 130),
        child: BlocConsumer<EmployBloc,EmployeState>(
          bloc: empBloc,
          listener: (context, state) {
 if (state is CreateEmployeeSuccess) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
    return ShowUserScreen( create: state.response,);
  }));
}
          },
        builder: (context, state) {
          print("state $state");
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
              child: Text('Error: ${state.msg}'),
            );
          }
          return Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AllWidgets.customTextField(
                  hintText: AppString.enterName,
                  controller: nameCon,
                  Error: 'Please enter name',
                ),
                AllWidgets.verticalSpace(),
                AllWidgets.customTextField(
                  hintText: 'Salary',
                  controller: passCon,
                  Error: 'Please enter salary',
                ),
                AllWidgets.verticalSpace(),
                AllWidgets.customTextField(
                  hintText: 'Age',
                  controller: ageCon,
                  Error: 'Please enter age',
                ),
                AllWidgets.verticalSpace(),
                AllWidgets.customButton(
                  onPressed: () {
                    final FormState? form = formkey.currentState;

                      empBloc.add(CreateEmployeeButtonPressed(
                        name: nameCon.text,
                        salary: passCon.text,
                        age: ageCon.text,
                      ));

                  },
                ),
              ],
            ),
          );
        },


        ),
      )
    );
  }
}
