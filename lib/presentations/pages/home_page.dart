import 'package:fetch_api/datas/model/user_model.dart';
import 'package:fetch_api/datas/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("fetch APi"),
      ),
      body: FutureBuilder(
        future: repository.getDataUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data[index].avatar),
                      ),
                      title: Text(
                          "IP name : ${snapshot.data[index].profile.firstName}"),
                      subtitle: Text(
                        "${snapshot.data[index].knownIps[0]} " +
                            "\n ${snapshot.data[index].knownIps[1]}",
                      ), // baca api per index dengan index sesuai list data
                      trailing: Text("ID : ${snapshot.data[index].id}"),
                    ),
                    Divider()
                  ],
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error.toString()}"),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
