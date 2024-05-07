import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oykyqwkifaswgqkmenpl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im95a3lxd2tpZmFzd2dxa21lbnBsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ5OTc0ODMsImV4cCI6MjAzMDU3MzQ4M30.0Kagf2oOykkTZ_qKLB37-_QEENMLgqQHzCO7QqaL9bM',
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  final user = Supabase.instance.client.from('member').stream(primaryKey: ['member_id']);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body:StreamBuilder<List<Map<String, dynamic>>>(
          stream: user,
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator()
              );
            }
            final member = snapshot.data!;
             return ListView.builder(
              itemCount: member.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(member[index]['name']),
                  );
              },
              );
          },
          ),
          ),
      );
  }
}
