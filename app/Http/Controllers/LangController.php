<?php

namespace App\Http\Controllers;

use Session;
use Illuminate\Http\Request;

class LangController extends Controller
{
    public function setLanguage($language)
    {
        Session::put('language', $language);
        return $language;
    }
}
