# 19 Flutter Navigation

## Resume

Dalam materi ini, mempelajari:

1. Navigation
2. Navigation dengan nama routes

### Navigation

digunakan untuk berpindah dari halaman satu ke halaman lain. untuk berpindah halamanan menggunakan kata Navigator.push() dan sebaliknya jika ingin kembali ke halaman sebelemumnya menggunakan kata Navigator.pop().

### Navigation dengan nama routes

sama seperti navigation dasar, yang membedakan hanyalah untuk berpindah halaman kita harus menggunakan Navigator.pushNamed dan kita diharuskan untuk mendaftarkan route, caranya dengan menambahkan initialRoute dan routes pada materialApp.

## Task

### Membuat halaman contacts

[task1.go](./Praktikum/lib/main.dart)

output:
![task1](./Screenshots/Android%20Emulator%20-%20Pixel_XL_API_32_5554%203_28_2022%201_54_58%20PM.png)

### Melakukan navigation dengan dan tanpa named routes

[task2.go](./Praktikum/lib/pages/create_new_contacts.dart)

output:
![task2](./Screenshots/Android%20Emulator%20-%20Pixel_XL_API_32_5554%203_28_2022%2011_03_32%20PM.png)
