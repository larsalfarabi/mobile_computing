# Product Requirement Document (PRD)

## Flutter Multi-Page Navigation Assignment (Sports Team Edition)

---

## 1. Project Overview

- **Project Name:** Sports Team Directory App
- **Objective:** Mewujudkan aplikasi Flutter 3 halaman interaktif yang mendemonstrasikan pemahaman mendalam mengenai manajemen _navigation stack_, _data passing_ antar halaman, dan manipulasi _history stack_ menggunakan `Navigator.popUntil()`.
- **Theme Choice:** Sports Team (Daftar Tim → Profil Pemain → Foto Pemain)
- **Target Deadline:** Sebelum Sesi 6 dimulai

---

## 2. User Flow & Navigation Structure

Aplikasi wajib mengikuti alur navigasi linear terstruktur sebagai berikut:

1. **Halaman 1 (List Page):** Menampilkan daftar tim olahraga. Mengetuk salah satu tim akan mengarahkan pengguna ke Halaman 2 sembari membawa data tim tersebut.
2. **Halaman 2 (Detail Page):** Menampilkan profil detail pemain utama dari tim yang dipilih. Mengetuk foto/avatar pemain akan mengarahkan pengguna ke Halaman 3.
3. **Halaman 3 (Avatar Detail Page):** Menampilkan foto pemain dalam ukuran besar dan menyediakan tombol khusus untuk langsung kembali ke Halaman 1 tanpa melewati Halaman 2.

---

## 3. Functional Requirements (Per-Page Specifications)

### 3.1 Page 1: Sports Team List Page

- **Component UI:** Wajib menggunakan widget `ListView.builder`.
- **Data Volume:** Menampilkan minimal 4 item tim olahraga yang berbeda.
- **Item Content:** Setiap baris/card item harus menampilkan:
  - Logo/Avatar kecil dari tim olahraga.
  - Nama tim olahraga.
- **Trigger Event:** Ketika item di-tap, sistem mengeksekusi `Navigator.push()` untuk membuka Halaman 2 dan mengirimkan objek data tim/pemain yang dipilih.

### 3.2 Page 2: Player Detail Page

- **Data Input:** Menerima data tim/pemain secara dinamis dari Halaman 1 melalui parameter Konstruktor kelas (Constructor).
- **Component UI & Content:** Wajib menampilkan informasi berikut secara jelas:
  - Foto/Avatar pemain (ukuran medium).
  - Nama pemain.
  - Deskripsi/Profil singkat mengenai pemain atau pencapaian tim.
- **Trigger Event:** Ketika komponen Foto/Avatar pemain diklik, aplikasi melakukan navigasi ke Halaman 3 dengan mengirimkan data gambar terkait.

### 3.3 Page 3: Avatar Detail Page

- **Component UI & Content:**
  - Menampilkan Foto/Avatar pemain dalam resolusi/ukuran yang jauh lebih besar (Large Size).
  - Menyediakan komponen tombol utama dengan teks `"Kembali ke Daftar"`.
- **Critical Logic (Back Button Management):**
  - Tombol `"Kembali ke Daftar"` dilarang keras hanya menggunakan `Navigator.pop()`.
  - Tombol wajib mengimplementasikan kode spesifik:
    ```dart
    Navigator.popUntil(context, (route) => route.isFirst);
    ```
  - Sistem harus memastikan Halaman 2 dilewati sepenuhnya dan pengguna langsung dihadapkan pada Halaman 1.

---

## 4. Non-Functional & Technical Requirements

- **State Management / Architecture:** Menggunakan imperatif Navigator 1.0 (Standar bawaan Flutter) sesuai instruksi perkuliahan.
- **Code Cleanliness:** * Menerapkan prinsip *Clean Code\* dengan penamaan variabel yang merepresentasikan entitas asli (contoh: `teamName`, `playerAvatar`, `playerDescription`).
  - Pemisahan file widget yang rapi (disarankan memisahkan setiap halaman ke dalam file `.dart` tersendiri di dalam folder `lib/pages/`).
- **Robustness:** Aplikasi harus dapat di-build (_compilation error-free_) dan berjalan lancar pada emulator maupun _real device_.

---

## 5. Data Model Structure Sample (Dart)

Untuk memastikan pemenuhan kriteria kualitas kode, struktur model data yang direkomendasikan adalah sebagai berikut:

```dart
class SportsTeam {
  final String teamName;
  final String playerName;
  final String avatarUrl;
  final String description;

  SportsTeam({
    required this.teamName,
    required this.playerName,
    required this.avatarUrl,
    required this.description,
  });
}
```
