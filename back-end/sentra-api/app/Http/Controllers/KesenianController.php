<?php

namespace App\Http\Controllers;

use App\Models\Images_Kesenian;
use App\Models\Kesenian;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class KesenianController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $kesenians = Kesenian::all();

        if($kesenians != null) {
            return response ([
                'status' => 'Data kesenians berhasil ditampilkan',
                'data' => $kesenians
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Data kesenians tidak ditemukan'
            ], 404);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dt = new DateTime();
        $tahun = $dt->format('y');
        $bulan = $dt->format('m');
        $id_kesenian = "";

        $kesenians = Kesenian::orderBy('id_kesenian', 'desc')->get();

        if ($kesenians->count() > 0) {
            $id_kesenian = $kesenians[0]->id_kesenian;
            $last_increment = substr($id_kesenian, 7);

            $id_kesenian = str_pad($last_increment + 1, 3, '0', STR_PAD_LEFT);
            $id_kesenian = 'STR' . $tahun . '' . $bulan . '' . $id_kesenian;
        } else {
            $id_kesenian = 'STR' . $tahun . '' . $bulan . '-001';
        };

        $reqImage = $request->image;
        $imageurl=null;

        if($request->hasfile('image')) {
            $name = time().rand(1,100).'.'.$reqImage->extension();
            $reqImage->move(public_path().'/kesenians/', $name);
            $imageurl = $name;
        }

        $requestKesenians = [
            'id_kesenian' => $id_kesenian,
            'name'=> $request->name,
            'price' => $request->price,
            'category' => $request->community,
            'phone_number' => $request->phone_number,
            'email' => $request->email,
            'province' => $request->province,
            'description' => $request->description,
            'image'=> $imageurl,
        ];

        $createKesenian = DB::table('kesenians')->insert($requestKesenians);

        if($createKesenian != null){
            return response([
                'status' => 'success',
                'message' => 'Kesenian Berhasil Ditambahkan',
                'data' => $requestKesenians
            ], 201);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Kesenian gagal Ditambahkan'
            ], 404);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $kesenians = Kesenian::where('id_kesenian', $id)->first();

        if($kesenians != null) {
            return response ([
                'status' => 'Data kesenian berhasil ditampilkan',
                'data' => $kesenians
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'kesenian tidak ditemukan'
            ], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $getKesenian = Kesenian::where('id_kesenian', $id)->first();

        $requestKesenians = [
            'name'=> $request->name,
            'price' => $request->price,
            'category' => $request->community,
            'phone_number' => $request->phone_number,
            'email' => $request->email,
            'province' => $request->province,
            'description' => $request->description,
        ];

        if($request->hasfile('image')) {
            $image_path = "/kesenians/" .$getKesenian->image;
            if ($getKesenian->image != '' && $getKesenian->image != null) {
                File::delete(public_path($image_path));
            }
            $reqImage = $request->image;
            $name = time().rand(1,100).'.'.$reqImage->extension();
            $reqImage->move(public_path().'/kesenians/', $name);
            $requestKesenians['image'] = $name;
        }

        $updateKesenian = DB::table('kesenians')->update($requestKesenians, $id);

        if($updateKesenian != null){
            return response([
                'status' => 'success',
                'message' => 'Kesenian Berhasil Diedit',
                'data' => $requestKesenians
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Kesenian gagal Diedit'
            ], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $getKesenian = Kesenian::where('id_kesenian', $id)->first();
        $image_path = "/kesenians/" .$getKesenian->image;
        if ($getKesenian->image != '' && $getKesenian->image != null) {
            File::delete(public_path($image_path));
        }
        $dokumentations = Images_Kesenian::where('id_kesenian_img', $id)->get();
        foreach($dokumentations as $file)
        {
            $imageDocumentation = $file->documentation;
            $image_path = "/dokumentasiKesenians/" .$imageDocumentation;
            if ($imageDocumentation != '' && $imageDocumentation != null) {
                File::delete(public_path($image_path));
            }
        }

        $kesenian = Kesenian::where('id_kesenian', $id)->delete();
        $deldokumentations = Images_Kesenian::where('id_kesenian_img', $id)->delete();
        if($kesenian){
            return response([
                'status' => 'success',
                'message' => 'Data berhasil dihapus'
            ], 200);
        }else{
            return response([
                'status' => 'failed',
                'message' => 'Data gagal dihapus'
            ], 404);
        }
    }

    public function search(Request $request) {
        $searchQuery = $request->q;
        $kesenians = Kesenian::where('name','like',"%".$searchQuery."%")
                            ->orWhere('category','like',"%".$searchQuery."%")
                            ->orWhere('province','like',"%".$searchQuery."%")
                            ->get();

        if($kesenians != null){
            return response([
                'status' => 'success',
                'message' => 'Kesenian yang dicari Berhasil Ditampilkan',
                'data' => $kesenians
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Kesenian yang dicari gagal tidak ditemukan'
            ], 404);
        }
    }

    public function category(Request $request) {
        $searchQuery = $request->categoryName;
        $kesenians = Kesenian::where('category','like',"%".$searchQuery."%")
                            ->get();

        if($kesenians != null){
            return response([
                'status' => 'success',
                'message' => 'Kesenian berdasarkan kategori Berhasil Ditampilkan',
                'data' => $kesenians
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Kesenian berdasarkan kategori gagal tidak ditemukan!'
            ], 404);
        }
    }

    public function getAllDocumentation($id) {
        $dokumentations = Images_Kesenian::where('id_kesenian_img', $id)->get();

        if($dokumentations != null){
            return response([
                'status' => 'success',
                'message' => 'Dokumentasi berhasil ditampilkan',
                'data' => $dokumentations
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Dokumentasi gagal ditampilkan!'
            ], 404);
        }
    }

    public function getDocumentationById($id, $detailId) {
        $dokumentations = Images_Kesenian::where('id_kesenian_img', $id)
                                        ->where('id', $detailId)
                                        ->get();
        if($dokumentations != null){
            return response([
                'status' => 'success',
                'message' => 'Dokumentasi berdasarkan id berhasil ditampilkan',
                'data' => $dokumentations
            ], 200);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Dokumentasi berdasarkan id gagal ditampilkan!'
            ], 404);
        }
    }

    public function createDocumentation($id, Request $request) {
        $imageurl=[];
        if($request->hasfile('documentation')) {
            foreach($request->file('documentation') as $file)
            {
                $name = time().rand(1,100).'.'.$file->extension();
                $file->move(public_path().'/dokumentasiKesenians/', $name);
                $imageurl[] = $name;
            }

            foreach($imageurl as $value) {
                $imageKesenian[] = Images_Kesenian::create([
                    'id_kesenian_img' => $id,
                    'documentation' => $value
                ]);
            }
        }
        if($imageKesenian != null){
            return response([
                'status' => 'success',
                'message' => 'Dokumentasi berhasil ditambahkan',
                'data' => $imageKesenian
            ], 201);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Dokumentasi gagal ditambahkan!'
            ], 404);
        }
    }

    public function editDocumentation(Request $request, $id) {
        $dokumentations = Images_Kesenian::where('id', $id)->first();
        $imageDocumentation = $dokumentations->documentation;

        $image_path = "/dokumentasiKesenians/" .$imageDocumentation;
        if ($imageDocumentation != '' && $imageDocumentation != null) {
            File::delete(public_path($image_path));
        }

        $reqImage = $request->dokumentation;
        $name = time().rand(1,100).'.'.$reqImage->extension();
        $reqImage->move(public_path().'/dokumentasiKesenians/', $name);
        $requestDocumentation['documentation'] = $name;

        $updateDocumentation = DB::table('images_kesenians')->update($requestDocumentation, $id);

        if($updateDocumentation != null){
            return response([
                'status' => 'success',
                'message' => 'Dokumentasi berhasil ditambahkan',
                'data' => $updateDocumentation
            ], 201);
        } else {
            return response ([
                'status' => 'failed',
                'message' => 'Dokumentasi gagal ditambahkan!'
            ], 404);
        }
    }

    public function deleteDocumentation($id) {
        $getdokumentations = Images_Kesenian::where('id', $id)->first();
        $imageDocumentation = $getdokumentations->documentation;
        $image_path = "/dokumentasiKesenians/" .$imageDocumentation;
        if ($imageDocumentation != '' && $imageDocumentation != null) {
            File::delete(public_path($image_path));
        }
        $dokumentations = Images_Kesenian::where('id', $id)->delete();
        if($dokumentations){
            return response([
                'status' => 'success',
                'message' => 'Data berhasil dihapus'
            ], 200);
        }else{
            return response([
                'status' => 'failed',
                'message' => 'Data gagal dihapus'
            ], 404);
        }
    }
}
