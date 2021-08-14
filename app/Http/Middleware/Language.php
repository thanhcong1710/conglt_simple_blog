<?php
 
namespace App\Http\Middleware;
 
use App;
use Closure;
use Session;
 
class Language
{
 
    /**
     * Run the request filter.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Session::has('language')) {
            App::setLocale(Session::get('language'));
        } else {
            App::setLocale('vi');
        }
 
        return $next($request);
    }
}