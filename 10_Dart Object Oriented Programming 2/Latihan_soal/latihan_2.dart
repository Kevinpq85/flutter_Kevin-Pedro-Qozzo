class Mobil{
  String merkMobil;
  String tipeMobil;
  double bahanBakar;
  int jarakTempuh;

  Mobil (this.merkMobil, this.tipeMobil, this.bahanBakar, this.jarakTempuh);

  void jalan(int km) {
    if(bahanBakar > 0){
      jarakTempuh += km;
      bahanBakar -= km / 10;
    }
  }

  void isiBahanBakar(int n){
    bahanBakar += n;
  }

  double infoBahanBakar(){
    return bahanBakar;
  } 

  int infoJarakTempuh(){
    return jarakTempuh;
  }

}

void main(List<String> args) {
  var mobil1 = Mobil('avanza', 'tipeMobil', 10, 10);
  mobil1.jalan(1);
  print(mobil1.infoBahanBakar());
  print(mobil1.infoJarakTempuh());
}
