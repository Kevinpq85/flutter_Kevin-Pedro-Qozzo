import 'dart:io';

azimuth () {
  stdout.write("Masukkan angka : ");
  int? angka = int.parse(stdin.readLineSync()!);
  if(angka >= 180){
    angka = angka - 180;
    return angka;
  } else if(angka <= 180) {
    angka = angka + 180;
    return angka;
  } else if (angka <=0 || angka >= 360) {
    angka = 0;
    return angka;
  }
}

void main() {
print(azimuth());
}