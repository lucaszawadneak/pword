import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/safeItem.dart';

class SafeController extends GetxController {
  static SafeController get to => Get.find();

  List<SafeItem> passwords = [];

  final encryptKey = DotEnv().env['ENCRYPT_KEY'];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pword.txt');
  }

  Future storePasswords() async {
    final encoder = Base64Codec();
    final encryptionKey = DotEnv().env['ENCRYPTION_KEY'];
    final file = await _localFile;

    final stringlified = jsonEncode(passwords);
    final encrypt = utf8.encode(stringlified);
    final encodedPasswords = encoder.encode(encrypt);

    final encryptedPasswords = '$encryptionKey$encodedPasswords';

    try {
      await file.writeAsString('$encryptedPasswords');
      print('saved');
    } catch (e) {
      print(e);
    }
  }

  Future loadData() async {
    if (passwords.isNotEmpty) {
      return 1;
    }
    print('Loading');
    try {
      final encoder = Base64Codec();
      final encryptionLength = DotEnv().env['ENCRYPTION_LENGTH'];
      final file = await _localFile;

      var decodingString = await file.readAsString();

      final passwordString =
          decodingString.substring(int.parse(encryptionLength));

      final base64 = encoder.decode(passwordString);

      final String utf = utf8.decode(base64);

      List map = jsonDecode(utf);

      await map.forEach(
          (el) => passwords.add(SafeItem(el['password'], el['description'])));
    } catch (e) {
      print(e);
    }
  }

  void storePassword(SafeItem payload) {
    passwords.add(payload);
    storePasswords();
  }

  void deleteItem(int index) {
    passwords.removeAt(index);
    storePasswords();
  }

  void resetData() {
    passwords = [];
    storePasswords();
  }

  load() => loadData();

  push(SafeItem payload) => storePassword(payload);

  sub(int index) => deleteItem(index);

  reset() => resetData();
}
