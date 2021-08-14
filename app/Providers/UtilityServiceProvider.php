<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UtilityServiceProvider extends ServiceProvider
{
    public static function query($query, $print = false)
    {
        $resp = null;
        $query = trim($query);
        $upperQuery = strtoupper(substr($query, 0, 6));
        if ($print) {
            dd('\n-------------------------------------------------------------\n', $query, '\n-------------------------------------------------------------\n');
        } else {
            if ($upperQuery == ('SELECT')) {
                $resp = DB::select(DB::raw($query));
            } elseif ($upperQuery == ('INSERT')) {
                $resp = DB::insert(DB::raw($query));
            } elseif ($upperQuery == ('UPDATE')) {
                $resp = DB::update(DB::raw($query));
            } elseif ($upperQuery == ('DELETE')) {
                $resp = DB::delete(DB::raw($query));
            } else {
                $resp = DB::statement(DB::raw($query));
            }
        }
        return $resp;
    }
    public static function first($query, $print = false)
	{
		$resp = self::query($query, $print);
		return $resp && is_array($resp) && count($resp) >= 1 ? $resp[0] : $resp;
	}
    public static function getOne($query){
	    $finalQuery = $query. " LIMIT 1";
        $resp = DB::select(DB::raw($finalQuery));
        return $resp && is_array($resp) && count($resp) >= 1 ? $resp[0] : $resp;
    }
    public static function getObject($array_input, $table, $order_by_key='', $order_by_desc=false) {
		$sub_sql = '1 ';
		$sub_order = '';
		foreach ( $array_input as $key => $value ) {
			$sub_sql .= " AND " . $key . "= :" . $key;
		}
		if($order_by_key!=''){
			if($order_by_desc){
				$sub_order = " ORDER BY $order_by_key DESC";
			}else{
				$sub_order = " ORDER BY $order_by_key ASC";
			}
		}
		$query = "SELECT * FROM " . $table . " WHERE " . $sub_sql . $sub_order . " LIMIT 1";
		$resp = DB::select(DB::raw($query),$array_input);
		return $resp && is_array($resp) && count($resp) == 1 ? $resp[0] : $resp;
    }

	public static function getMultiObject($array_input, $table, $limit=0, $order_by_key='', $order_by_desc=false) {
		$sub_sql = '1 ';
		$sub_order = '';
		$sub_limit = '';
		foreach ( $array_input as $key => $value ) {
			$sub_sql .= " AND " . $key . "= :" . $key;
		}
		if($order_by_key!=''){
			if($order_by_desc){
				$sub_order = " ORDER BY $order_by_key DESC";
			}else{
				$sub_order = " ORDER BY $order_by_key ASC";
			}
		}
		if($limit){
			$sub_limit = " LIMIT $limit";
		}
		$query = "SELECT * FROM " . $table . " WHERE " . $sub_sql . $sub_order . $sub_limit;
		$resp = DB::select(DB::raw($query),$array_input);
		return $resp ;
    }

	public static function insertSimpleRow($arr_params, $table) {
		$field = "";
		$field_value = "";
		foreach ( $arr_params as $key => $value ) {
			$field .= $key . ",";
			$field_value .= ":" . $key . ",";
		}
		$field = rtrim ( $field, "," );
		$field_value = rtrim ( $field_value, "," );
		$sql = "INSERT IGNORE INTO " . $table . "(" . $field . ") VALUES (" . $field_value . ")";
		$resp = DB::insert(DB::raw($sql),$arr_params);
		return $resp ? DB::getPdo()->lastInsertId() : $resp;
    }

	public static function updateSimpleRow($arr_params, $arr_key, $table) {
		$set_clause = "";
		$arr_binding = array();
		foreach ( $arr_params as $key => $value ) {
			$set_clause .= $key . "= :value_" . $key . ",";
			$arr_binding['value_'.$key] = $value;
		}
		$set_clause = rtrim ( $set_clause, "," );

		$sql_cond = '1=1';
		foreach ( $arr_key as $key => $value ) {
			$sql_cond .= ' AND ' . $key . "= :key_" . $key;
			$arr_binding['key_'.$key] = $value;
		}
		if ($set_clause != '') {
			$sql = 'UPDATE ' . $table . ' SET ' . $set_clause . ' WHERE ' . $sql_cond;
			$resp = DB::update(DB::raw($sql),$arr_binding);
			return $resp;
		}
	}
	public static function makingPagination($list, $total, $page, $limit)
	{
		$pagination = (object)[];
		$data = (object)[];
		$pagination->spage = 1;
		$pagination->cpage = $page;
		$pagination->total = $total;
		$pagination->limit = $limit;
		$pagination->lpage = ($total % $limit) == 0 ? (int)($total / $limit) : (int)($total / $limit) + 1;
		$pagination->ppage = $page > 0 ? $page - 1 : 0;
		$pagination->npage = $page < $pagination->lpage ? $page + 1 : $pagination->lpage;
		$data->list = $list;
		$data->paging = $pagination;
		return $data;
	}
	public static function shuffle_assoc(&$array) {
        $keys = array_keys($array);

        shuffle($keys);

        foreach($keys as $key) {
            $new[$key] = $array[$key];
        }

        $array = $new;

        return true;
    }
	public static function calculatorSessionsByNumberOfSessions($start, $numberOfSessions, $holidays = [], $classdays = [], $onlyEndDate = false) {
        $startTime = strtotime(date("Y-m-d", strtotime($start)));
        if ($numberOfSessions<=0 || !$startTime || !is_array($classdays) || !count($classdays)) {
            return null;
        }
        $classdays = self::validClassdays($classdays);
        $classdays = array_values(Arr::sort($classdays));
        $holidays = self::stringToTimestampHolidays($holidays, $startTime, PHP_INT_MAX);
        $sessions = self::getSessionsByNumberOfSessions($startTime,$numberOfSessions, $classdays, $holidays, $onlyEndDate);
        if ($onlyEndDate) {
            return $sessions;
        }
        $resp = new \stdClass();
        $resp->dates = $sessions;
        $resp->total = count($sessions);
        $resp->end_date = end($sessions);
        return $resp;
    }
	public static function stringToTimestampHolidays($holidays, $startTime, $endTime) {
        if(!$holidays) return null;
        $res = [];
        foreach ($holidays as $holiday) {
            $hStart = strtotime(date("Y-m-d", strtotime($holiday->start_date)));
            $hEnd = strtotime(date("Y-m-d", strtotime($holiday->end_date)));
            $res[] = [
                'start_date' => $hStart,
                'end_date' => $hEnd,
            ];
        }
        usort($res,function($first,$second){
            return $first['start_date'] > $second['start_date'];
        });
        $res = self::mergeHolidays($res, $startTime, $endTime);
        return $res;
    }
	public static function mergeHolidays($holidays, $pStart, $pEnd) {
        if(!$holidays || count($holidays) <= 1) return $holidays;
        $res = [];
        foreach ($holidays as $holiday) {
            if ($holiday['end_date']>= $pStart ) {
                $res[] = $holiday;
            }
        }
        return $res;
    }
	public static function validClassdays($classdays = [])
    {
        $resp = count($classdays) ? $classdays : [2, 5];
        if (count($resp)) {
            $resp = array_unique($resp);
            sort($resp);
            if ($resp[0] == 0) {
                array_shift($resp);
                $resp[] = 0;
            }
        }
        return $resp;
    }
	public static function getSessionsByNumberOfSessions ($startTime, $numberOfSessions, $classdays, $holidays, $onlyEndDate=false){
		$weekday = (int) date('N', $startTime);
        if ($weekday === 7) {
            $weekday = 0;
        }
        $timeOfDay = 24 * 60 * 60;
        $maxLength = count($classdays) - 1;
        $days = [];
        while ($numberOfSessions >= 0) {
            foreach ($classdays as $key => $classday) {
                if ($weekday > $classday) {
                    if ($key >= $maxLength) {
                        $startTime += (7 - $weekday) * $timeOfDay;
                        $weekday = 0;
                    }
                    continue;
                }
                $startTime += ($classday - $weekday) * $timeOfDay;
                if($numberOfSessions<=0){
                    if($onlyEndDate){
                        $l = count($days);
                        return $l> 0 ? $days[$l - 1] : null;
                    }
                    return $days;
                }
                if (!self::checkInHolidayByTimestampBinarySearch($startTime, $holidays)) {
                    $days[] = date("Y-m-d", $startTime);
                    --$numberOfSessions;
                }
                $weekday = $classday;
                if ($key >= $maxLength) {
                    $weekday = 0;
                    $startTime += (7 - $classday) * $timeOfDay;
                }
            }
        }
        if ($onlyEndDate) {
            $l = count($days);
            return $l> 0 ? $days[$l - 1] : null;
        }
        return $days;
    }
	public static function checkInHolidayByTimestampBinarySearch($date, $holidays) {
        if(!$holidays) return false;
        foreach ($holidays as $holiday) {
            if ($date>=$holiday['start_date'] && $date <= $holiday['end_date']) {
                return true;
            }
        }
        return false;
    }
}
