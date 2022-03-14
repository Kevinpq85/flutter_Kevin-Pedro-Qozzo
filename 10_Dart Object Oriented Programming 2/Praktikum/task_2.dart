abstract class Matematika {
  int hasil();
}

class KelipatanPersekutuanTerkecil implements Matematika {
    int x = 16;
    int y = 40; 

  @override
  int hasil() {
      int i = x;
      int j = y;
      while (i != j) {
        if (i > j) {
          j = j + y;
        } else {
          i = i + x;
        }
      }
      return i;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x = 16;
  int y = 40;

  @override
  int hasil() {
    int r = 0;
    while(y!=0){
        r = x % y;
        x = y;
        y = r;
    }

    return x;
  }
}

void main(){
KelipatanPersekutuanTerkecil kpk1 = KelipatanPersekutuanTerkecil();
print(kpk1.hasil());

FaktorPersekutuanTerbesar fpb1 = FaktorPersekutuanTerbesar();
print(fpb1.hasil());
}