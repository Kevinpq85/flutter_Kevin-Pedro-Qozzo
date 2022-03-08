Future<void> fungsi(List list, int pengali) async{
  await Future.delayed(Duration(seconds: 3), () {
    for(var a in list) {
      print(a * pengali);
    }
  });
}

void main() async{
  var list = [1,2,3,4,5];
  await fungsi(list, 5);
}