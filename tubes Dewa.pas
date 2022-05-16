Program BismillahTubes;
uses
        crt,math;

type DataCust = record
	Nama, jenis, bahan, IDcust : string;
	jum_pak : integer;
	tot_kain,hrg_bahan, total : real;
        hrg_jahit : longint;
end;

const
	hrg_gamis = 100000;
	hrg_cln = 75000;
	hrg_tunik = 60000;
	hrg_rok = 40000;
        hrg_jeans = 100000;
        hrg_kulot = 70000;

type
	Arr = array[1..999] of DataCust;
var
        n,search,count,del : integer;
        tabcust : arr;
        ID : string;
        status,edit,PilMenu,Pilsort,hapus : char;


procedure Header();
begin
        clrscr();
        writeln('                 _______________________________________________');
        writeln('                |                                               |');
        writeln('                |             ~    FASHION-STORE    ~           |');
        writeln('                |_______________________________________________|');
        writeln();
end;

procedure MainMenu(var pilihan: char);
begin
        Header();
        writeln('1. Input Data');
        writeln('2. Output Data');
        writeln('3. Hapus Data');
        writeln();
        writeln('...');
        writeln('9. Exit');
        writeln();
        writeln('Masukkan Pilihan Anda: ');
        repeat
                readln(pilihan);
        until ((pilihan = '1') or (pilihan = '2') or (pilihan = '3') or (pilihan = '9'));
end;

procedure MenuPakaian();
begin
        writeln(' __________________________________________________________________ ');
        writeln('|no|    Jenis Pakaian     |  Kebutuhan Kain  |   Harga Jasa Jahit  |');
        writeln('|--|----------------------|------------------|---------------------|');
        writeln('|1.| Gamis                |       3,5 m      |      Rp.100.000,-   |');
        writeln('|2.| Celana panjang kulot |       2   m      |      Rp.75.000,-    |');
        writeln('|3.| Kemeja tunik         |       2,2 m      |      Rp.60.000,-    |');
        writeln('|4.| Rok Panjang          |       3   m      |      Rp.40.000,-    |');
        writeln('|__|______________________|__________________|_____________________|');
        writeln();
end;

procedure MenuBahan();
begin
        writeln(' _________________________ _________________ ');
        writeln('|no|      Jenis Bahan     |   Harga Bahan   |');
        writeln('|--|----------------------|-----------------|');
        writeln('|1.|    Bahan Jeans       | Rp. 100.000 /m  |');
        writeln('|2.|    Bahan Kulot       | Rp.  75.000 /m  |');
        writeln('|__|______________________|_________________|');
        writeln();
end;

procedure MenuEdit();
begin
        writeln(' _______________________________');
        writeln('|no|       Pilihan             |');
        writeln('|--|---------------------------|');
        writeln('|1.|    Nama Customer          |');
        writeln('|2.|    Jenis Model Pakaian    |');
        writeln('|3.|    Bahan Pakaian          |');
        writeln('|4.|    Jumlah Pakaian         |');
        writeln('|__|___________________________|');
        writeln();
end;

procedure MenuSorting();
begin
        clrscr();
        writeln('Urutkan data berdasarkan: ');
        writeln();
        writeln(' ___________________________ ');
        writeln('|no|       pilihan          |');
        writeln('|--|------------------------|');
        writeln('|1.|    Total Harga         |');
        writeln('|2.|    Jumlah Pakaian      |');
        writeln('|__|________________________|');
end;

procedure caseNama(i : integer; var Tabcust : Arr);
begin
        clrscr();
        Header();
	write('Nama Customer : ');
	        readln(Tabcust[i].Nama);
end;

procedure caseJenis(i : integer; var Tabcust : arr);
var
        status : boolean;
        pilihan : string;
begin
        status := false;
        clrscr;
        Header();
        MenuPakaian();
        repeat
                write('pilih jenis pakaian (masukkan nomor): ');
                readln(pilihan);
                if (pilihan = '1') or (pilihan = '2') or (pilihan = '3') or (pilihan ='4') then
                begin
                        status := true;
                end
                else
                        status := false;
                if (status) then
                begin
	                case (pilihan) of
                                '1': Tabcust[i].jenis := 'Gamis';
	                        '2': Tabcust[i].Jenis := 'Celana panjang kulot';
		                '3': Tabcust[i].Jenis := 'Kemeja tunik';
		                '4': Tabcust[i].Jenis := 'Rok panjang';
                        end;
                end
                else
                begin
                        writeln('Maaf pilihan tidak ada, mohon ulangi kembali');
                        writeln();
                end;
        until (status = true);
end;
procedure caseBahan(i : integer; var Tabcust : arr);
var
        status : boolean;
        pilihan : string;
begin
        status := false;
        clrscr;
        Header;
        menuBahan();
        repeat
                write('pilih jenis bahan (masukkan nomor): ');
                readln(pilihan);
                        if (pilihan = '1') or (pilihan = '2') then
                                status := true
                        else
                                status := false;
                if (status) then
                begin
	                case pilihan of
	                         '1' : Tabcust[i].bahan := 'Jeans';
		                 '2' : Tabcust[i].bahan := 'Kulot';
	                end;
                end
                else
                begin
                        writeln('Maaf pilihan tidak ada, mohon ulangi kembali');
                        writeln();
                end;
        until(status = true);
end;
procedure CaseJumlah (i : integer; var Tabcust : Arr);
begin
        clrscr();
        Header();
        writeln();
        writeln();
        repeat
                write('Jumlah Pakaian :   ');
	        readln(Tabcust[i].jum_pak);
                if (tabcust[i].jum_pak < 1) then
                        writeln('Jumlah Pakaian Tidak boleh 0 ');
        until (tabcust[i].jum_pak >= 1);
end;

procedure buatID (i: integer; var tabcust : arr);
var
          IDnama, IDjenis : integer;
          strI,strj : string;
begin
          IDnama := length(tabcust[i].nama);
          IDjenis := length(tabcust[i].jenis);
          str(tabcust[i].jum_pak, strj);
          str(i,strI);
          tabcust[i].IDcust := (strI + tabcust[i].nama[IDnama - 1]) + (tabcust[i].nama[IDnama]) + (tabcust[i].jenis[IDjenis -1]) + (tabcust[i].jenis[IDjenis]) + strj;
end;

function totalkain(i : integer; tabcust : arr) : real;
var
        total : real;
begin
	case tabcust[i].jenis of
		'Gamis' : tabcust[i].tot_kain := 3.5;
		'Celana panjang kulot' : tabcust[i].tot_kain := 2;
		'Kemeja tunik' : tabcust[i].tot_kain := 2.2;
		'Rok panjang' : tabcust[i].tot_kain := 3;
	end;
	tabcust[i].tot_kain := (tabcust[i].tot_kain * tabcust[i].jum_pak);
        if (tabcust[i].tot_kain < tabcust[i].tot_kain + 1) and (tabcust[i].tot_kain >= tabcust[i].tot_kain) then
                Total := Ceil(tabcust[i].tot_kain)
        else
                Total := (tabcust[i].tot_kain);
        totalkain := Total;
end;

function hargajahit(i : integer; tabcust : arr) : longint;
begin
        case tabcust[i].jenis of
                'Gamis' : tabcust[i].hrg_jahit := hrg_gamis;
                'Celana panjang kulot' : tabcust[i].hrg_jahit := hrg_cln;
                'Kemeja tunik' : tabcust[i].hrg_jahit := hrg_tunik;
                'Rok panjang' : tabcust[i].hrg_jahit := hrg_rok;
        end;
        tabcust[i].hrg_jahit := tabcust[i].hrg_jahit * tabcust[i].jum_pak;
        hargajahit := tabcust[i].hrg_jahit;
end;

function hargabahan(i : integer;tabcust : arr) : real;
begin
        case tabcust[i].bahan of
                'Jeans' : tabcust[i].hrg_bahan := hrg_jeans;
                'Kulot' : tabcust[i].hrg_bahan := hrg_kulot;
        end;
        tabcust[i].hrg_bahan := tabcust[i].hrg_bahan * totalkain(i,tabcust);
        hargabahan := tabcust[i].hrg_bahan;
end;

function tot(i : integer; var tabcust : arr) : real;
begin
        tabcust[i].total := (hargajahit(i,tabcust) + hargabahan(i,tabcust));
        tot := tabcust[i].total;
end;

procedure IsiData(i : integer; var Tabcust : arr);
begin
                writeln('Data customer ke # ',i);
                CaseNama(i,tabcust);
		caseJenis(i,tabcust);
		caseBahan(i,tabcust);
                caseJumlah(i,tabcust);
                buatID(i,tabcust);
                tot(i,tabcust);
end;

function searchID(n : integer; data: string; tabcust : arr) : integer;
var
        i : integer;
begin
        i := 1;
        while (tabcust[i].IDcust <> data) and (i < N) do
        begin
                i := i + 1;
        end;
        if (tabcust[i].IDcust = data) then
                searchID := i
        else
                searchID := -1;
end;

procedure TotalselectSort(n : integer; var tabcust: arr);
var
        j,i,max: integer;
        temp : datacust;

begin
        for i := 1 to N - 1 do
        begin
                max := i;
                for j := i + 1 to n do
                begin
                        if (tabcust[j].total > tabcust[max].total) then
                        begin
                                temp := tabcust[j];
                                tabcust[j] := tabcust[max];
                                tabcust[max] := temp;
                        end;
                end;
        end;
end;

procedure JmlselectSort(n : integer; var tabcust: arr);
var
        j,i,max: integer;
        temp : datacust;

begin
        for i := 1 to N - 1 do
        begin
                max := i;
                for j := i + 1 to n do
                begin
                        if (tabcust[j].jum_pak > tabcust[max].jum_pak) then
                        begin

                                temp := tabcust[j];
                                tabcust[j] := tabcust[max];
                                tabcust[max] := temp;
                        end;
                end;
        end;
end;

procedure outdata(count,n: integer; tabcust : arr);
var
        i : integer;
begin
        clrscr;
        i := count;
        while (i <= n) do
        begin
                if (tabcust[i].IDcust = ' ') then
                begin
                        writeln('Data Customer ke # ',i,' Sudah dihapus');
                        writeln();
                end
                else
                begin
                        writeln('Data Customer ke # ',i,': ');
                        writeln('ID customer            : ',Tabcust[i].IDcust);
                        writeln('Nama Customer          : ',Tabcust[i].Nama);
                        writeln('Jenis Pakaian          : ',Tabcust[i].jenis);
                        writeln('Jenis Bahan            : ',tabcust[i].bahan);
                        writeln('Jumlah Pakaian         : ',tabcust[i].jum_pak);
                        writeln('Total kebutuhan kain   : ',totalkain(i,tabcust):0:1,' meter');
                        writeln('Harga jahit            : ','Rp. ',hargajahit(i,tabcust));
                        writeln('Harga bahan            : ','Rp. ',hargabahan(i,tabcust):4:0);
                        writeln('Total harga            : ','Rp. ',tot(i,tabcust):0:2);
                        writeln();
                end;
                i := i + 1;
        end;
end;

procedure caseEdit(var i : integer; var tabcust : Arr);
var
        status : boolean;
        pilihan : char;
begin
        menuEdit();
        write('Masukkan pilihan anda : ');
        readln(pilihan);
        if (pilihan = '1') or (pilihan = '2') or (pilihan = '3') or (pilihan ='4') then
        begin
	        case (pilihan) of
                        '1': caseNAma(i,tabcust);
                        '2': caseJenis(i,tabcust);
                        '3': caseBahan(i,tabcust);
                        '4': caseJumlah(i,tabcust);
                end;
        end
        else
        begin
                writeln('Maaf pilihan tidak ada, mohon ulangi kembali');
                writeln();
        end;
end;

procedure caseHapus(ID : string; var i : integer);
begin
        tabcust[i].IDcust := ' ';
        tabcust[i].nama := ' ';
        tabcust[i].jenis := ' ';
        tabcust[i].bahan := ' ';
        tabcust[i].jum_pak := 0;
        writeln('Data dengan ID  {',ID,'}  Berhasil dihapus ');
end;

begin
        N := 0;
        repeat
                MainMenu(pilmenu);
                if pilmenu = '1' then
                begin
                        clrscr();
                        repeat
                                N := N + 1;
                                count := n;
	                        isidata(n,tabcust);
                                writeln();
                                status := 'y';
	                        outdata(count,N,tabcust);
                                repeat
                                        writeln('Ingin melakukan transaksi lagi?(y/n) ');
                                        readln(status);
                                until (status = 'n') or (status = 'y');
                        until (status = 'n');
                end
                else if pilmenu = '2' then
                begin
                        count := 1;
                        MenuSorting();
                        write('Masukkan pilihan anda : ');
                        readln(pilsort);
                        while (pilsort <> '1') and (pilsort <> '2') do
                        begin
                                writeln('Maaf Pilihan tidak ada, mohon ulangi kembali ');
                                writeln();
                                write('Masukkan pilihan anda : ');
                                readln(pilsort);
                        end;
                        if (pilsort = '1') then
                        begin
                                Totalselectsort(n,tabcust);
                                writeln('Rekap Data berdasarkan total pembelian : ');
                        end
                        else
                        begin
                                Jmlselectsort(n,tabcust);
                                writeln('Rekap Data berdasarkan jumlah pakaian yang dipesan : ');
                        end;
                        outdata(count,n,tabcust);
                        repeat
                                write('Apakah ada data yang salah?(y/n) ');
                                readln(edit);
                                if edit = 'y' then
                                begin
                                        write('Masukkan ID yang ingin di edit: ');
                                        readln(ID);
                                        search := SearchID(n,ID,tabcust);
                                        if (search <> -1) then
                                        begin
                                                writeln();
                                                writeln('Data ditemukan pada saat masukan ke # ',search);
                                                caseEdit(search,tabcust);
                                                if (pilsort = '1') then
                                                        Totalselectsort(n,tabcust)
                                                else
                                                        Jmlselectsort(n,tabcust);
                                                outdata(count,n,tabcust);
                                                readln();
                                        end;
                                end;
                        until (edit ='n');
                end
                else if pilmenu = '3' then
                begin
                        repeat
                                if (pilsort = '1') then
                                        Totalselectsort(n,tabcust)
                                else if (pilsort = '2') then
                                        Jmlselectsort(n,tabcust)
                                else
                                        count := 1;
                                outdata(count,n,tabcust);
                                write('Masukkan ID yang datanya ingin dihapus : ');
                                readln(ID);
                                del := searchID(n,ID,tabcust);
                                caseHapus(ID,del);
                                repeat
                                        writeln();
                                        writeln('Ingin Hapus data lagi (y/n)?  ');
                                        readln(Hapus);
                                until (hapus = 'y') or (hapus = 'n');
                        until (Hapus = 'n')
                end;
        until(pilmenu = '9');
        clrscr();
        header();
        writeln('                 ~ TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI ~ ');

end.
