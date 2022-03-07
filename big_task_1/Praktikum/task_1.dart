import 'dart:io';

fungsi(int a) {
  
  if (a.isOdd) {
    return true;
  } else if (a.isEven) {
    return false;
  }
}
void main() {
  stdout.write("Silahkan masukkan angka : ");
  int a = int.parse(stdin.readLineSync()!);
  bool b = fungsi(a);
  print(b);
}

  