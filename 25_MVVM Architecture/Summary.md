# 25 MVVM Architecture

## Resume

Dalam materi ini, mempelajari:

1. Apa itu MVVM Architecture
2. Keuntungan yang didapat

### MVVM Architecture

singkatan dari Model-View-ViewModel yang bertugas untuk memisahkan logic dengan tampilan(view) ke dalam view model

### KEuntungan yang didapat

1. Reusability
   Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama
2. Maintainability
   Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
3. Testability
   Penguji menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat mengingkatkan produktifitas pada pengujian

## Task

### mengubah seluruh halaman menjadi bentuk MVVM

[task1.go](./Praktikum/lib/main.dart)

output:
![task1](./Screenshots/Android%20Emulator%20-%20Pixel_3_XL_API_32_5554%204_18_2022%203_03_56%20PM.png)

### menambahkan halaman baru menggunakan VieModel

[task1.go](./Praktikum/lib/screen/create/create_contact.dartt)

output:
![task1](./Screenshots/Android%20Emulator%20-%20Pixel_3_XL_API_32_5554%204_18_2022%203_04_36%20PM.png)
