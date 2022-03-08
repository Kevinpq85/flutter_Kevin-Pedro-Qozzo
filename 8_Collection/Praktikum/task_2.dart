void main() {
  List<List<String>> nilai = [
    ["Matematika", "80"],
    ["IPA", "70"],
    ["Inggris", "85"],
  ];
  print(nilai);

  Map<String, String> nilaiMap = {};
  for (var n in nilai) {
    nilaiMap[n[0]] = n[1];
  }
  print(nilaiMap);
  
}