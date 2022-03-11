class BangunRuang{
  var panjang;
  var tinggi;
  var lebar;

  BangunRuang(){
    panjang = 0;
    lebar = 0;
    tinggi = 0;
  }

  volume(){
    return panjang * lebar * tinggi;
  }

}

class Kubus extends BangunRuang{
  int sisi;

  Kubus(this.sisi);

  @override
  volume() {
    return (sisi*sisi*sisi);
  }
}

class Balok extends BangunRuang{
  @override
  volume() {
    panjang = 8;
    lebar = 10;
    tinggi = 12;
    return panjang * lebar * tinggi;
  }
}

void main() {
  Kubus k1 = Kubus(10);
  print(k1.volume());
  
  Balok b1 = Balok();
  print(b1.volume());
}