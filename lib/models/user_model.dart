import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String mail;

  @HiveField(2)
  final String created;

  @HiveField(3)
  final String modified;

  @HiveField(4)
  final String acceptedPrivacyStatementVersion;

  @HiveField(5)
  final String acceptedTermsOfUseVersion;

  User(
      {this.name,
      this.mail,
      this.created,
      this.modified,
      this.acceptedPrivacyStatementVersion,
      this.acceptedTermsOfUseVersion});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      name: parsedJson['name'],
      mail: parsedJson['mail'],
      created: parsedJson['created'],
      modified: parsedJson['modified'],
      acceptedPrivacyStatementVersion:
          parsedJson['acceptedPrivacyStatementVersion'],
      acceptedTermsOfUseVersion: parsedJson['acceptedTermsOfUseVersion'],
    );
  }
  static void jump() {
    print('jump');
  }
}