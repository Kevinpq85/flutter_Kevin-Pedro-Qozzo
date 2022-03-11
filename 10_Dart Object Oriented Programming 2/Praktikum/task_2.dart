abstract class Matematika {
  int hasil();
}

class KelipatanPersekutuanTerkecil implements Matematika {
    int x = 6;
    int y = 10; 

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
  int x = 5;
  int y = 10;

  @override
  int hasil() {
      if (y == 0)
        return x;
        return hasil();
  }
}

void main(){
print(KelipatanPersekutuanTerkecil().hasil());
print(FaktorPersekutuanTerbesar().hasil());
}