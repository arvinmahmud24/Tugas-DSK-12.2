;Nama  : Arvin Mahmud Santosa
;NIM   : 2300018140
;Kelas : C
;Prodi : Informatika


.model SMALL 
.code 
 ORG 100h
  
tdata: jmp proses 

 lgaris    db 13,10,'========================================================$'
 ljudul    db 13,10,'| Menghitung Keliling Segitiga ( Jumlah Keliling <=9 ) |$'
 lsisi1    db 13,10,'| Sisi 1   = $' 
 lsisi2    db 13,10,'| Sisi 2   = $' 
 lsisi3    db 13,10,'| Sisi 3   = $'  
 lket      db 13,10,'| Keliling = Sisi 1+ Sisi 2 + Sisi 3$'
 lkeliling db 13,10,'| Keliling = $'  
 
 ; menyiapkan memori (var) untuk menerima inputan keyboard 
 vsisi1 db 23,?,23 dup(?) 
 vsisi2 db 23,?,23 dup(?) 
 vsisi3 db 23,?,23 dup(?) 
 vkeliling db 23,?,23 dup(?) 

proses:
    ;Menampilkan garis
    mov ah, 09h
    mov dx, offset lgaris
    int 21h

    ; Menampilkan judul
    mov ah, 09h
    mov dx, offset ljudul
    int 21h
    
    ;Menampilkan garis
    mov ah, 09h
    mov dx, offset lgaris
    int 21h
    
    ; Meminta input sisi 1
    mov ah, 09h
    mov dx, offset lsisi1
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h ; Konversi dari ASCII ke decimal
    mov vsisi1, al

    ; Meminta input sisi 2 
    mov ah, 09h
    mov dx, offset lsisi2
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h ; Konversi dari ASCII ke decimal
    mov vsisi2, al

    ; Meminta input sisi 3 
    mov ah, 09h
    mov dx, offset lsisi3
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h ; Konversi dari ASCII ke decimal
    mov vsisi3, al

    ; keliling = sisi1 + sisi2 + sisi3
    mov al, vsisi1
    add al, vsisi2
    add al, vsisi3
    mov vkeliling, al
    
    ; Menampilkan keteranngan keliling
    mov dx, offset lket 
    mov ah, 09h
    int 21h

    ; Menampilkan keliling
    mov dx, offset lkeliling
    mov ah, 09h
    int 21h
    mov dl, vkeliling 
    
    add dl, 30h ; Konversi dari decimal ke ASCII
    mov ah, 02h
    int 21h
    
    ;Menampilkan garis
    mov ah, 09h
    mov dx, offset lgaris
    int 21h
    
    ;Menutup program
    int 20h
