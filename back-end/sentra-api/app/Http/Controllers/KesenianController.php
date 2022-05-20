<?php

namespace App\Http\Controllers;

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

        if($kesenians) {
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

        if($createKesenian){
            return response([
                'status' => 'success',
                'message' => 'Kesenian Berhasil Ditambahkan',
                'data' => $requestKesenians
            ], 200);
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
        if($kesenians) {
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

        if($updateKesenian){
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
        $kesenian = Kesenian::where('id_kesenian', $id)->delete();
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
}
