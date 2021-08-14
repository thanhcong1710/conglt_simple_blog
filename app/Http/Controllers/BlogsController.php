<?php

namespace App\Http\Controllers;

use App\Providers\UtilityServiceProvider as u;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BlogsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        
        $pagination = (object)$request->pagination;
        $page = isset($pagination->cpage) ? (int) $pagination->cpage : 1;
        $limit = isset($pagination->limit) ? (int) $pagination->limit : 20;
        $offset = $page == 1 ? 0 : $limit * ($page-1);
        $limitation =  $limit > 0 ? " ORDER BY p.published_at DESC LIMIT $offset, $limit": "";
        $cond = " p.status = 1 ";
        
        $total = u::first("SELECT count(id) AS total FROM posts AS p WHERE $cond ");
        $list = u::query("SELECT p.*, (SELECT name FROM users WHERE id=p.creator_id) AS creator_name 
            FROM posts AS p WHERE $cond $limitation");
        $data = u::makingPagination($list, $total->total, $page, $limit);
        return response()->json($data);
    }
    public function detail($post_id)
    {
        $data = u::first("SELECT p.*, (SELECT name FROM users WHERE id=p.creator_id) AS creator_name 
            FROM posts AS p WHERE id=$post_id");
        return response()->json($data);
    }
}
