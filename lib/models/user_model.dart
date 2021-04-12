import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? mail;

  @HiveField(2)
  String? created;

  @HiveField(3)
  String? modified;

  @HiveField(4)
  String? acceptedPrivacyStatementVersion;

  @HiveField(5)
  String? acceptedTermsOfUseVersion;

  @HiveField(6)
  String? token;

  User({
    this.name,
    this.mail,
    this.created,
    this.modified,
    this.acceptedPrivacyStatementVersion,
    this.acceptedTermsOfUseVersion,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        name: parsedJson['name'],
        mail: parsedJson['mail'],
        created: parsedJson['created'],
        modified: parsedJson['modified'],
        acceptedPrivacyStatementVersion:
            parsedJson['acceptedPrivacyStatementVersion'],
        acceptedTermsOfUseVersion: parsedJson['acceptedTermsOfUseVersion'],
        token: parsedJson['token']);
  }
  Map<String, dynamic> toJson() => {
        "name": this.name,
        "mail": this.mail,
        "created": this.created,
        "modified": this.modified,
        "acceptedPrivacyStatementVersion": this.acceptedPrivacyStatementVersion,
        "acceptedTermsOfUseVersion": this.acceptedTermsOfUseVersion,
        "token": this.token
      };
}
