import 'mobil.dart';
import 'hewan.dart';
import 'dart:io';
void main() {
  Mobil mobil = new Mobil();
  bool ulangi = false;
  do{
    mobil.totalMuatan(mobil);
    print("kapasitas penuh ${mobil.kapasitas} kg");
    print("kapasitas sekarang ${mobil.totalMuatanSekarang} kg");
    stdout.write("Input berat hewan kg : ");
    int? berat = int.parse(stdin.readLineSync()!);
    Hewan hewan = new Hewan();
    hewan.berat= berat;
    mobil.tambahMuatan(hewan);
    print("muatan mobil : ${mobil.banyakHewan.length}");
    print("muatan mobil : ${mobil.banyakHewan}");
    stdout.write("muatan mobil  : [");
    for(int i = 0; i < mobil.banyakHewan.length; i++){
      stdout.write("${mobil.banyakHewan[i].berat} ,");
    }
    stdout.writeln("]");  
    mobil.totalMuatan(mobil);
    stdout.write("apakah mau menambah Hewan? (y/n) : ");
    String? jawab = stdin.readLineSync();
    ulangi = jawab == "y" ? true : false;
  }while(ulangi);
}