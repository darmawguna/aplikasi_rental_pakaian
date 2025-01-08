import 'package:app_rental/utils/secure_storage_util.dart';

Future<bool> isTokenValid() async {
  try {
    // Cek expiredAt yang disimpan
    final String? expiredAtString = await SecureStorageUtil.storage.read(
      key: 'expired_at',
    );
    print('Expired At: $expiredAtString');

    // Jika expiredAt tidak ditemukan, token dianggap tidak valid
    if (expiredAtString == null) {
      return false;
    }

    // Parsing expiredAt menjadi DateTime
    final expiredAt = DateTime.tryParse(expiredAtString);
    if (expiredAt == null) {
      return false; // Jika parsing gagal, dianggap tidak valid
    }

    // Cek apakah waktu sekarang sudah melewati expiredAt
    if (DateTime.now().isAfter(expiredAt)) {
      return false;
    }

    // Token masih valid
    print('Parsed Expired At: $expiredAt'); // Debug log
    return true;
  } catch (e) {
    print('Error checking token: $e');
    return false; // Jika ada error, anggap token tidak valid
  }
}
