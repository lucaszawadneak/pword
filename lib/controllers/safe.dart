import 'package:get/get.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/safeItem.dart';

class SafeController extends GetxController {
  static SafeController get to => Get.find();

  final cryptor = new PlatformStringCryptor();

  final encryptKey = DotEnv().env['ENCRYPT_KEY'];

  List<SafeItem> passwords = [];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pword.txt');
  }

  Future<File> storePasswords() async {
    final file = await _localFile;

    final stringlified = jsonEncode(passwords);
    final encrypt = utf8.encode(stringlified);

    final encoder = Base64Codec();

    final encodedPasswords = encoder.encode(encrypt);

    final encryptionKey = DotEnv().env['ENCRYPTION_KEY'];

    final encryptedPasswords = '$encryptionKey$encodedPasswords';
    print(encryptedPasswords);

    return await file.writeAsString('$encryptedPasswords');
  }

  Future loadData() async {
    print('Loading');
    try {
      final file = await _localFile;

      final encoder = Base64Codec();

      final encryptionLength = DotEnv().env['ENCRYPTION_LENGTH'];

      var decodingString = await file.readAsString();

      final passwordString =
          decodingString.substring(int.parse(encryptionLength));

      final base64 = encoder.decode(passwordString);

      final utf = utf8.decode(base64);

      final array = jsonDecode(utf);

      await array.forEach((e) => passwords.add(SafeItem.fromJson(e)));
    } catch (e) {
      print(e);
      return 0;
    }
  }

  void storePassword(SafeItem payload) {
    passwords.add(payload);
    storePasswords();
  }

  void deleteItem(int index) {
    passwords.removeAt(index);
  }

  void resetData() {
    passwords = [];
  }

  push(SafeItem payload) => storePassword(payload);

  sub(int index) => deleteItem(index);

  reset() => resetData();
}