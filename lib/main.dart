import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/user.dart';

// ## Steps
// 1- Create your models
// 2- Run `flutter pub run build_runner build` command
// 3- Initialize your schemas
// 4- Use however you want!

// Note: Why do we need a code generation?
// That's because, Dart lang hasn't supported metaprogramming yet
// in the near future we won't need that but for now, we have to generate the code
// otherwise we have to write by hand and that means it's a lot of boilerplate code!
// For now build_runner handles this boilerplate code for us!

// Note 2: Sad truth
// 32-bit android emulator emulators are not supported.
// You need to test your app on a 64-bit physical device.

void main() async {
  // We need to initialize flutterbinding at the beginning because path_provider needs it to find a valid path!
  WidgetsFlutterBinding.ensureInitialized();

  // We need a path_provider because we need a valid path to store our database
  final dir = await getApplicationSupportDirectory();

  final isar = await Isar.open(
    // UserSchema will show you error at the beginning because user.g.dart file isn't generated yet!
    // Generate the file using `flutter pub run build_runner build` command and import the user.dart file!
    schemas: [UserSchema],
    directory: dir.path,
  );

  final user = User('ehe');

  await isar.writeTxn((isar) async {
    // Users collection will be generated automatically!
    user.id = await isar.users.put(user);
  });

  // Don't care "\u001b[32m" It just makes the print green
  print('\u001b[32m #########################');
  print('\u001b[32m User: ${user.id} - ${user.name}');
  print('\u001b[32m #########################');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
