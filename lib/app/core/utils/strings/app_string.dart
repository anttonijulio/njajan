class AppString {
  AppString._();

  // dialog
  static String registerSuccess(String email) {
    return 'Akun Berhasil Didaftarkan, silahkan Login Menggunakan $email';
  }

  static String loginSuccess(String email) {
    return 'Berhasil Masuk Sebagai $email';
  }

  static const logoutSuccess = 'Berhasil Keluar';

  static const noConnection = 'Periksa Koneksi Anda';
  static const userNotFound = 'User Tidak Ditemukan';
  static const unknownError = 'Kesalahan yang Tidak Diketahui';
  static const invalidCredential = 'Email atau Password Anda Salah';
  static const weakPassword = 'Password Telalu Lemah';
  static const invalidEmail = 'Email Tidak Valid';
  static const userAlreadyRegist =
      'Email Telah Terdaftar Silahkan Menggunakan Akun Lain';
}
