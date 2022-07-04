Daftar Anggota Kelompok 24

Anggota 1: Michael Christian Chandra - C14200013

Anggota 2: Michael Kevin - C14190167

Judul: JobStreet Application

Database: Firestore Database & Realtime Database

Fungsi yang ada:
1.	Terdiri dari 3 user: Guest, Job seeker / pencari kerja, Employers / Perusahaan
2.	Login dan register sebagai pencari kerja ataupun perusahaan, serta fitur logout
3.	Perusahaan dapat membuat postingan lowongan, dengan mencantumkan lokasi kerja, gaji, deskripsi pekerjaan, qualifications, benefits, dan bagaimana cara apply pada posisi tersebut
4.	Guest dapat melihat dan mencari lowongan menggunakan fitur filter (jabatan, kata kunci, perusahaan, daerah kerja / domisili, dan juga spesialisasi pekerjaan 
5.	Guest hanya bisa mendaftarkan diri melalui lowongan jika sudah membuat akun job seeker pada register page
6.	Job seeker / pencari kerja dapat melakukan direct message kepada suatu perusahaan / employers, fitur ini menggunakan realtime database
7.	Job seeker / pencari kerja dapat mengedit profil mereka (identitas, riwayat pendidikan, riwayat pekerjaan, CV / Resume, domisili, dan ketertarikan pada bidang)
8.	Perusahaan / employers dapat melihat Job seeker / pencari kerja yang meng-apply pada suatu lowongan tertentu yang mereka buat sebelumnya
9.	Terdapat page bagi job seeker / pencari kerja untuk melihat respon status lamaran yang telah di-apply.
10.	Opsional: Terdapat fitur push-notification kepada Job seeker / pencari kerja menggunakan Firebase Cloud Messaging jika terdapat lowongan pekerjaan baru yang di publish oleh suatu perusahaan sesuai dengan domisili ataupun ketertarikan mereka pada suatu bidang

Widget yang digunakan:
Container, TextField, Text, Elevated Button, List View, Navigator, Snackbar, Expanded, ImageView, Card, List Tile, Icon, Row, Column, Expanded Button, SizedBox, dll

Page yang dibuat:
1.	Login, Register, Logout (-)
2.	Home Page (untuk guest) dan Landing Page (after login) (for job seeker & for company) DONE
3.	Profile page job seeker & Edit Profile Page (for job seeker)
4.	Profile page company & edit profile page (for company / employers)
5.	List job vacancy page (for job seeker and guest) DONE
6.	Job application status  & history page (for job seeker) DONE
7.	Add job vacancy and its detail (for company / employers) DONE
8.	View created job vacancy and its appliers (see who's applying the job vacancy) (for company / employers) DONE
9.	Direct messages page (for both)
	
Michael Kevin: Page 1, 3, 4, 9
Michael Chandra: 2, 5, 6, 7, 8

Video : https://drive.google.com/file/d/1YEg-Tv3DYU-cWXJwgGjE5zTXWtum__4U/view?usp=sharing


Referensi:
https://api.flutter.dev
https://www.jobseeker.com

