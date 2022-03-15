class Task<T> {
  var a;
  var b;

  Task(T a, T b){
    this.a = a;
    this.b = b;
  }

  Generics<T>(T a, T b){
    if(a.runtimeType == String && b.runtimeType == String){
      print('$a $b');
    } else if(a.runtimeType == int && b.runtimeType == int){
      int cek1 = a as int;
      int cek2 = b as int;
      if (cek1 > cek2){
        print('nilai dari $cek1 lebih besar dari $cek2');
      } else {
        print('nilai dari $cek2 lebih besar dari $cek1');
      }
    } else if(a.runtimeType == double && b.runtimeType == double){
      double cek1 = a as double;
      double cek2 = b as double;
      if(cek1 > cek2){
        print('nilai dari $cek1 lebih besar dari $cek2');
      } else {
        print('nilai dari $cek2 lebih besar dari $cek1');
      }
    } else if(a.runtimeType == bool && b.runtimeType == bool){
      bool cek1 = a as bool;
      bool cek2 = b as bool;
      print(cek1 && cek2);
    } else {
      print('tidak diketahui');
    }
  }
}

void main() {
  var t1 = Task<String>('Kevin', 'Pedro');
  var t2 = Task<int>(1000, 100);
  var t3 = Task<double>(10, 100);
  var t4 = Task<bool>(true, false);
  List list1 = [];
  List list2 = [];
  var t5 = Task<List>(list1, list2);

  t1.Generics(t1.a, t1.b);
  t2.Generics(t2.a, t2.b);
  t3.Generics(t3.a, t3.b);
  t4.Generics(t4.a, t4.b);
  t5.Generics(t5.a, t5.b);
}