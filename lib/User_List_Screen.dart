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
    users = await dbHelper?.getUserAccountFromDatabase();
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
                  leading: const Icon(Icons.person),
                  title: Text(user.user_id ?? '', style: const TextStyle(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700
                  ),),
                  //subtitle: Text(user.phone_number ?? ''),
                  isThreeLine: true,
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.user_name ?? ''),
                      Text(user.id_number ?? ''),
                      Text(user.phone_number ?? ''),


                    ],
                  )
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
