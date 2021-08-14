<?php

namespace App\Http\Controllers;

use App\Providers\UtilityServiceProvider as u;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        $status = isset($request->status) ? $request->status : '';
        $keyword = isset($request->keyword) ? $request->keyword : '';
        $published_date = isset($request->published_date) ? $request->published_date : '';
        $order = isset($request->order) ? $request->order : '';
        
        $pagination = (object)$request->pagination;
        $page = isset($pagination->cpage) ? (int) $pagination->cpage : 1;
        $limit = isset($pagination->limit) ? (int) $pagination->limit : 20;
        $offset = $page == 1 ? 0 : $limit * ($page-1);
        $limitation =  $limit > 0 ? " LIMIT $offset, $limit": "";
        $cond = " 1 ";
        $can_published = 0;
        if(!$request->user()->hasRole('admin')){
            $cond .= " AND p.creator_id = ".(int)$request->user()->id;
        }else{
            $can_published = 1;
        }
        if ($status !== '') {
            $cond .= " AND p.status=$status";
        }
        if ($keyword !== '') {
            $cond .= " AND p.title LIKE '%$keyword%'";
        }
        if ($published_date !== '') {
            $cond .= " AND DATE_FORMAT(published_at,'%Y-%m-%d') = '$published_date'";
        }
        if($order == 1){
            $order = " ORDER BY p.id ASC"; 
        }elseif($order == 2){
            $order = " ORDER BY p.published_at DESC";
        }elseif($order == 3){
            $order = " ORDER BY p.published_at ASC";
        }else{
            $order = " ORDER BY p.id DESC"; 
        }
        $total = u::first("SELECT count(id) AS total FROM posts AS p WHERE $cond ");
        $list = u::query("SELECT p.*, (SELECT name FROM users WHERE id=p.creator_id) AS creator_name,
                $can_published AS can_published  
            FROM posts AS p WHERE $cond $order $limitation");
        $data = u::makingPagination($list, $total->total, $page, $limit);
        return response()->json($data);
    }
    public function add(Request $request)
    {
        $data = u::insertSimpleRow(array(
            'title'=>$request->title,
            'description'=>$request->description,
            'intro_text' => $request->intro_text,
            'status' => 0,
            'created_at' => date('Y-m-d H:i:s'),
            'creator_id' => Auth::user()->id,
        ), 'posts');
        return response()->json($data);
    }
    public function detail($post_id)
    {
        $data = u::getObject(array('id' => $post_id), 'posts');
        return response()->json($data);
    }
    public function update(Request $request, $post_id)
    {
        $data = u::updateSimpleRow(array(
            'title'=>$request->title,
            'description'=>$request->description,
            'intro_text' => $request->intro_text,
            'updated_at' => date('Y-m-d H:i:s'),
            'updator_id' => Auth::user()->id,
        ), array('id' => $post_id), 'posts');
        return response()->json($data);
    }
    public function delete($post_id)
    {
        $data = u::query("DELETE FROM posts WHERE id=$post_id");
        return response()->json($data);
    }
    public function active(Request $request, $post_id)
    {
        $data = u::updateSimpleRow(array(
            'status'=>1,
            'published_at'=>date('Y-m-d H:i:s',strtotime($request->published_date)),
        ), array('id' => $post_id), 'posts');
        return response()->json($data);
    }
}
