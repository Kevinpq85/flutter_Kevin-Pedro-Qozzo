class Hewan{
  String nama;
  String jenis;

  Hewan(this.nama, this.jenis);

  void suara(){
  print('hewan bersuara: ');
  }
}

class Kucing extends Hewan{
  Kucing(nama, jenis) : super(nama, jenis);
  
  void lari(){
    print('lari dengan menggunakan kaki');
  }
  @override
  void suara() {
    print('miauww');
  }
}

class Unggas extends Hewan{
  String? keluarga;
  Unggas(this.keluarga, nama, jenis) : super(nama, jenis);
}

class Burung extends Unggas{
  Burung(keluarga, nama, jenis) : super(keluarga, nama, jenis);

  void terbang(){
    print('terbang dengan menggunakan sayap');
  }
  @override
  void suara() {
    print('berkicau');
  }
}

void main() {
  var miauww = Kucing('kucing', 'mamalia');
  print(miauww.nama);
  print(miauww.jenis);
  miauww.lari();
  miauww.suara();


var berkicau = Burung('burung', 'elang', 'burung');
print(berkicau.keluarga);
print(berkicau.nama);
print(berkicau.jenis);
berkicau.terbang();
berkicau.suara();

}