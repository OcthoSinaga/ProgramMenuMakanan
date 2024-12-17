program MenuMakanan;
uses crt;

const
  MAX_MENU = 8;

var
  namaMenu: array[1..MAX_MENU] of string;  // Array untuk nama menu
  hargaMenu: array[1..MAX_MENU] of integer; // Array untuk harga menu
  pilihan, jumlah, total, i: integer;

// Prosedur untuk menampilkan menu makanan
procedure TampilkanMenu();
begin
  writeln('====================================');
  writeln('            MENU MAKANAN            ');
  writeln('====================================');
  for i := 1 to MAX_MENU do
  begin
    writeln(i, '. ', namaMenu[i], ' - Rp', hargaMenu[i]);
  end;
  writeln('0. Selesai dan Hitung Total');
  writeln('====================================');
end;

// Fungsi untuk menghitung total harga
function HitungTotal(harga: integer; jumlah: integer): integer;
begin
  HitungTotal := harga * jumlah;
end;

// Program Utama
begin
  clrscr;

  // Inisialisasi Menu Makanan
  namaMenu[1] := 'Nasi Goreng'; hargaMenu[1] := 15000;
  namaMenu[2] := 'Mie Goreng';  hargaMenu[2] := 12000;
  namaMenu[3] := 'Ayam Bakar';  hargaMenu[3] := 20000;
  namaMenu[4] := 'Sate Ayam';   hargaMenu[4] := 18000;
  namaMenu[5] := 'Ikan Bakar';  hargaMenu[5] := 25000; 
  namaMenu[6] := 'Ayam Penyet'; hargaMenu[6] := 11000;
  namaMenu[7] := 'Es Teh Manis';hargaMenu[7] := 5000;
  namaMenu[8] := 'Es Jeruk'; hargaMenu[8] := 10000;

  total := 0; // Inisialisasi total pembayaran

  // Perulangan untuk input pilihan pengguna
  repeat
    clrscr;  // Membersihkan layar
    TampilkanMenu();  // Menampilkan daftar menu

    // Input pilihan menu
    write('Pilih nomor menu (1-8, 0 untuk selesai): ');
    readln(pilihan);

    // Cek kondisi pilihan
    case pilihan of
      1..8:
        begin
          write('Jumlah pesanan untuk ', namaMenu[pilihan], ': ');
          readln(jumlah);
          
          if jumlah > 0 then
          begin
            // Menghitung total harga menggunakan fungsi
            total := total + HitungTotal(hargaMenu[pilihan], jumlah);
            writeln('Pesanan berhasil ditambahkan.');
          end
          else
          begin
            writeln('Jumlah pesanan tidak valid.');
          end;
        end;
      0: 
        begin
          writeln('Memproses total pembayaran...');
        end;
    else
      writeln('Nomor menu tidak valid. Silakan coba lagi!');
    end;

    writeln;
    writeln('Tekan Enter untuk melanjutkan...');
    readln;

  until pilihan = 0;

  // Menampilkan total pembayaran
  writeln('====================================');
  writeln('Total pembayaran Anda: Rp', total);
  writeln('Terima kasih telah memesan!');
  writeln('====================================');
  readln;
end.