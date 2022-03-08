import 'dart:io';

void jamPasir() {
  stdout.write('Input angka = ');
  var angka = int.parse(stdin.readLineSync()!);
  int a, b, c;
  for (a = 0; a < angka - 1; a++) {
    for (b = 0; b < a; b++) {
      stdout.write(' ');
    }
    for (c = a; c <= angka - 1; c++) {
      stdout.write('*' + ' ');
    }
    print('');
  }
  for (a = angka; a >= 0; a--) {
    for (b = 0; b < a; b++) {
      stdout.write(' ');
    }
    for (c = a; c <= angka - 1; c++) {
      stdout.write('*' + ' ');
    }
    print('');
  }
  //
}

void main(List<String> args) {
  jamPasir();
}