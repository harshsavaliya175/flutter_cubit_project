import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_project/cubit/user_data/user_data_cubit.dart';

class ShowUserData extends StatelessWidget {
  const ShowUserData({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    UserDataCubit userDataCubit = BlocProvider.of<UserDataCubit>(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Enter Name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  userDataCubit.showName();
                },
                child: const Text('Show Name'),
              ),
              BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  print('BlocBuilder name');
                  if (state is UserNameShow) {
                    return Text(nameController.text);
                  } else {
                    return const Text('No Data Found');
                  }
                },
                buildWhen: (previous, current) {
                  return previous != current && current is UserNameShow;
                },
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Enter Title'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  userDataCubit.showTitle();
                },
                child: const Text('Show Title'),
              ),
              BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  print('BlocBuilder title');
                  if (state is UserTitleShow) {
                    return Text(titleController.text);
                  } else {
                    return const Text('No Data Found');
                  }
                },
                buildWhen: (previous, current) {
                  return previous != current && current is UserTitleShow;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
