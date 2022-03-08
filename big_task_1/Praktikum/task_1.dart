import 'dart:io';

fungsi (int a) {
  if (a.isEven) {
    return true;
  } else if (a.isOdd) {
    return false;
  }
}

void main() {
  stdout.write("Silahkan masukkan angka : ");
  int a = int.parse(stdin.readLineSync()!);
  bool b = fungsi(a);
  print(b);

}

  