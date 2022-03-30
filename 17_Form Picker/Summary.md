# 17 Form Picker

## Resume

Dalam materi ini, mempelajari:

1. Row dan Column
2. MainAxisSixe
3. MainAxisAlignment
4. CrossAxisAlignment
5. Flexible Widget
6. Expanded Widget
7. Date Picker
8. Color picker
9. File Picker

### Row dan Column

Row meletakan widget children nya secara horizontal
Column meletakan widget children nya secara vertikal

### MainAxisSixe

menentukan seberapa banyak space main axis. main axis dari row adalah horizontal sedangkan column adalah vertikal, properti MainAxisSixe memiliki dua values yaitu MainAxisSixe.max: menempati semua space dari MainAxis dan MainAxisSixe.min tidak memiliki ekstra space, hanya untuk children nya saja

### MainAxisAlignment

properti ini digunakan row dan column untuk memposisikan children mereka di extra space yang ada. MainAxisAlignment memiliki 6 values yaitu:
MainAxisAlignment.start
MainAxisAlignment.end
MainAxisAlignment.center
MainAxisAlignment.spaceBetween
MainAxisAlignment.spaceEvenly
MainAxisAlignment.spaceAround

### CrossAxisAlignment

properti ini digunakan row dan column untuk memposisikan children mereka pada cross axis, cross axis dari row adalah vertikal dan column adalah horizontal. CrossAxisAlignment memiliki 5 values yaitu:
CrossAxisAlignment.start
CrossAxisAlignment.end
CrossAxisAlignment.center
CrossAxisAlignment.stretch
CrossAxisAlignment.baseline

### Flexible Widget

berguna untuk membuat aplikasi yang responsif, flexible widget membungkus widget lain sehingga child dari flexible widget menjadi flexible atau resizable dan harus berada dalam turunan parent widget row atau column. perubahan ukuran nya ditentukan dengan properti fit dan flex.
Fit properti: menentukan apakah flexible widget memenuhi extra space yang tersedia di main axis nya. fit properti menerima nilai values berupa FlexFit.loose yang akan memiliki ukuran minimum dan FlexFit.tight yang akan memiliki ukuran maximum
Flex properti: menentukan perbandingan ukuran dari child ke widget nya. flex properti menerima nilai values berupa integer dan membandingkan nilai nya dengan flex properti lain.

### Expanded widget

berguna untuk membuat aplikasi yang responsif, Expanded widget membungkus widget lain sehingga ukuran dari child expanded widget akan dipaksa untuk memnuhi ruang yang tersedia. expanded widget harus berada dalam turunan parent widget row atau column, memiliki default value FlexFit.tight dan perubahan ukuran ditentukan dengan properti flex.

### Date picker

merupakan widget dimana user bisa memasukkan tanggal. tanggal tersebut bisa merupakan tanggal kelahiran, waktu pemesanan tiket, jadwal meeting, dll

### Color picker

merupakan widget dimana user bisa memilih warna, warna tersbut bisa digunakan untuk berbagai macam kondisi

### File picker

adalah kemampuan widget untuk mengakses storage, bisa untuk memilih dan membuka file

## Task

### Membuat halaman form dengan judul Create Post

[task1.go](./Praktikum/lib/main.dart)

output:
![task1](./Screenshots/Android%20Emulator%20-%20Pixel_XL_API_32_5554%203_30_2022%2011_27_15%20AM.png)

### Membuat tombol simpan dan saat ditekan akan menampilkan data pada form ke halaman baru

[task2.go](./Praktikum/lib/main.dart)

output:
![task2](./Screenshots/Android%20Emulator%20-%20Pixel_XL_API_32_5554%203_30_2022%2011_26_59%20AM.png)
