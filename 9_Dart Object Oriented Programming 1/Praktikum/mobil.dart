import 'hewan.dart';

class Mobil {
  List<Hewan> banyakHewan = [];
  final int kapasitas = 100;
  int totalMuatanSekarang = 0;
  void tambahMuatan(Hewan hewan) {
    if (totalMuatanSekarang + hewan.berat! <= kapasitas) {
      banyakHewan.add(hewan);
      totalMuatanSekarang += hewan.berat!;
    } else {
      print("hewan sudah penuh");
      print("masukkan hewan : ${hewan.berat} kg");
    }
  }
  void totalMuatan(Mobil mobil) {
    int total = 0;
    for (Hewan hewan in mobil.banyakHewan) {
      total += hewan.berat!;
    }
    print("total muatan mobil: $total Kg");
  }
}