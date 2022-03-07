import 'dart:io';

void main() {
  stdout.write("Silahkan masukkan angka : ");
  int? angka = int.parse(stdin.readLineSync()!);

  if (angka.isOdd) {
    print(" $angka adalah angka ganjil");
  } else if (angka.isEven) {
    print(" $angka adalah angka genap");
  }

}

  