class Pistol{
  var nama;
  var jumlahPeluru;

Pistol(this.nama, this.jumlahPeluru); 

  void tembak() {
    if(jumlahPeluru != 0) {
      jumlahPeluru -= 1;
    } else {
      print('peluru kosong! harap reload!');
    }
  }

void reload(int n){
  jumlahPeluru = n;
  }
}

void main() {
  var pistol1 = Pistol('ak47', 1);

  pistol1.reload(6);

  while(pistol1.jumlahPeluru != 0){
    pistol1.tembak();
    print('${pistol1.nama} ${pistol1.jumlahPeluru}');

  }

  pistol1.tembak();
}
