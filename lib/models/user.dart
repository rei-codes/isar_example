import 'package:isar/isar.dart';

// This one will show you an error because this file isn't generated yet!
// `flutter pub run build_runner build` run this command and wait to be generated
// Caution: this name needs to be the same name in this current file but with a .g suffix!
// Otherwise build_runner does nothing!
part 'user.g.dart';

// @Annotation() - we call that structure as annotation.
// that is pointing out to the build_runner that this guy will be generated
@Collection()
class User {
  // and this one also generate id for us
  @Id()
  int? id;
  final String name;
  User(this.name);
}
