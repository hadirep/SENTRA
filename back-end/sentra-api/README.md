LIST URL API :

- Kesenian :
    - Cretae Data Kesenian {Method POST}
    > http://sentra.dokternak.id/api/kesenians/
    - Edit Data Kesenian {Method PUT}
    > http://sentra.dokternak.id/api/kesenians/{id}
    - Delete Data Kesenian {Method DELETE}
    > http://sentra.dokternak.id/api/kesenians/{id}
    - Get All Data Kesenian {Method GET} 
    > http://sentra.dokternak.id/api/kesenians/
    - Get By ID Data Kesenian {Method GET} 
    > http://sentra.dokternak.id/api/kesenians/{id}
    - Get Search Data Kesenian {Method GET} 
    > http://sentra.dokternak.id/api/search/kesenians?q={query}
    - Get By Province Data Kesenian {Method GET} 
    > http://sentra.dokternak.id/api/province/kesenians?q={query province}

- Documentation Kesenians Image :
    - Cretae Data Documentation Kesenian {Method POST}
    > http://sentra.dokternak.id/api/documentation/create/{idKesenian}
    - Get All Data Documentation Kesenian {Method GET} 
    > http://sentra.dokternak.id/api/dokumentation/{idKesenian}
    - Get By ID Data Documentation Kesenian {Method GET} 
    > http://sentra.dokternak.id/api/dokumentation/{idKesenian}/{iddokumentasikesenian}
    - Edit Data Kesenian {Method PUT}
    > http://sentra.dokternak.id/api/documentation/edit/{id}
    - Delete Data Kesenian {Method DELETE}
    > http://sentra.dokternak.id/api/documentation/delete/{id}

- URL View Gambar :
    - Menampilkan gambar kesenian 
    > http://sentra.dokternak.id/public/kesenians/{namaimage}
    - Menampilkan gambar documentation kesenian 
    > http://sentra.dokternak.id/public/dokumentasiKesenians/{namaimagedokumetation}
