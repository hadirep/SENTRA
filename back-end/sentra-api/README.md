LIST URL API :

- Kesenian :
-> Cretae Data Kesenian {Method POST}
    > http://127.0.0.1:8000/api/kesenians/
-> Edit Data Kesenian {Method PUT}
    > http://127.0.0.1:8000/api/kesenians/{id}
-> Delete Data Kesenian {Method DELETE}
    > http://127.0.0.1:8000/api/kesenians/{id}
-> Get All Data Kesenian {Method GET} 
    > http://127.0.0.1:8000/api/kesenians/
-> Get By ID Data Kesenian {Method GET} 
    > http://127.0.0.1:8000/api/kesenians/{id}
-> Get Search Data Kesenian {Method GET} 
    > http://127.0.0.1:8000/api/search/kesenians?q={query}
-> Get By Province Data Kesenian {Method GET} 
    > http://127.0.0.1:8000/api/province/kesenians?q={query province}

- Documentation Kesenians Image :
-> Cretae Data Documentation Kesenian {Method POST}
    > http://127.0.0.1:8000/api/documentation/create/{idKesenian}
-> Get All Data Documentation Kesenian {Method GET} 
    > http://127.0.0.1:8000/api/dokumentation/{idKesenian}
-> Get By ID Data Documentation Kesenian {Method GET} 
    > http://127.0.0.1:8000/api/dokumentation/{idKesenian}/{iddokumentasikesenian}
-> Edit Data Kesenian {Method PUT}
    > http://127.0.0.1:8000/api/documentation/edit/{id}
-> Delete Data Kesenian {Method DELETE}
    > http://127.0.0.1:8000/api/documentation/delete/{id}

- URL View Gambar :
-> Menampilkan gambar kesenian 
    > http://127.0.0.1:8000/kesenians/{namaimage}
-> Menampilkan gambar documentation kesenian 
    > http://127.0.0.1:8000/dokumentasiKesenians/{namaimagedokumetation}
