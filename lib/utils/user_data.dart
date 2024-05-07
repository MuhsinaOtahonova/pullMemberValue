import 'package:user_list/model/user.dart';
import 'package:user_list/utils/dbconnection.dart';

Future<List<User>> getUsersFromDatabase() async {
  final results = await PostgresDbConnection.executeQueryWithParams(
    'SELECT * FROM member',
    [],
  );

  final userList = results.map((row) => User.fromMap(row.toColumnMap())).toList();
  
  return userList;
}
