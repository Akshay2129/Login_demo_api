// user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_api/cubit/cubit/user_details_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the API call when the screen is loaded
    context.read<UserDetailsCubit>().getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
        centerTitle: true,
      ),
      body: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listener: (context, state) {
          // Handle state changes if needed
        },
        builder: (context, state) {
          if (state is UserDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserDetailsError) {
            final String error = state.errorMessage;
            return Center(
              child: Text(error),
            );
          } else if (state is UserDetailsLoaded) {
            return ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final userDetailsModel = state.userDetailsModel;
                return ListTile(
                  title: Text(userDetailsModel.users.toString()),
                );
              },
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
