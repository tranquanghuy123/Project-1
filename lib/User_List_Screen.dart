import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'UserModel.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  DbHelper? dbHelper;
  List<UserModel>? users;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    initData();
  }

  void initData() async {
    users = await dbHelper?.getAllUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: users != null
          ? ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) {
                final user = users![index];

                return ListTile(
                  title: Text(user.user_name ?? ''),
                  subtitle: Text(user.phone_number ?? ''),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
