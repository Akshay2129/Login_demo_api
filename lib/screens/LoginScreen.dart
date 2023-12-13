import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_api/cubit/cubit/user_login_cubit.dart';
import 'package:login_demo_api/cubit/cubit/user_login_state.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocProvider(
              create: (BuildContext context) => UserLoginCubit(),
              child: BlocConsumer<UserLoginCubit, UserLoginState>(
                listener: (context, state) {
                  print(state);
                },
                builder: (context, state) {
                  if (state is UserLoginLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserLoginLoaded) {
                    return Text(state.loginModel.token.toString());
                  } else if (state is UserLoginError) {
                    return Text("Something went wrong");
                  }

                  return ElevatedButton(
                    onPressed: () {
                      WidgetsBinding.instance!
                          .addPostFrameCallback((timeStamp) {
                        context.read<UserLoginCubit>().userLogin(
                            _emailController.text.toString(),
                            _passwordController.text.toString());
                      });
                    },
                    child: state is UserLoginLoading
                        ? const CircularProgressIndicator()
                        : const Text("Continue"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
