import 'dart:io';

azimuth(int angka) {
  if(angka >= 180) {
    angka = angka - 180;
    return angka;
  } else if (angka <= 180) {
    angka = angka + 180;
    return angka;
  } else if (angka <= 0 || angka >= 360) {
    return 0;
  }
}

void main() {
  stdout.write("silahkan masukkan angka : ");
  int angka = int.parse(stdin.readLineSync()!);
  print(azimuth(angka));
}