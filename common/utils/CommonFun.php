<?php
namespace common\utils;
use yii\base\BaseObject;
use Yii;
class CommonFun extends BaseObject{
    /*
    * 二维数组按照指定的键值进行排序
    */
   public  static function arraySort($arr,$keys,$type='asc'){ 
       $keysvalue = $new_array = array();
       foreach ($arr as $k=>$v){
               $keysvalue[$k] = $v[$keys];
       }
       if(strtolower($type) == 'asc'){
               asort($keysvalue);
       }else{
               arsort($keysvalue);
       }
       reset($keysvalue);
       foreach ($keysvalue as $k=>$v){
               $new_array[$k] = $arr[$k];
       }
       return $new_array; 
   }    
   
   
   //单位转换
   public  static function sizecount($filesize) {
        if ($filesize >= 1073741824) {
            $filesize = round($filesize / 1073741824 * 100) / 100 . ' GB';
        } elseif ($filesize >= 1048576) {
            $filesize = round($filesize / 1048576 * 100) / 100 . ' MB';
        } elseif ($filesize >= 1024) {
            $filesize = round($filesize / 1024 * 100) / 100 . ' KB';
        } else {
            $filesize = $filesize . ' Bytes';
        }
        return $filesize;
    }
    
    /**
     * 获取客户端IP
     * @return string 返回ip地址,如127.0.0.1
     */
    public static function getClientIp()
    {
        $onlineip = 'Unknown';
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        {
            $ips = explode(",", $_SERVER['HTTP_X_FORWARDED_FOR']);
            $real_ip = $ips['0'];
            if ($_SERVER['HTTP_X_FORWARDED_FOR'] && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $real_ip))
            {
                $onlineip = $real_ip;
            }
            else if (isset($_SERVER['HTTP_CLIENT_IP']) == true && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CLIENT_IP']))
            {
                $onlineip = $_SERVER['HTTP_CLIENT_IP'];
            }
        }
        if ($onlineip == 'Unknown' && isset($_SERVER['HTTP_CDN_SRC_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CDN_SRC_IP']))
        {
            $onlineip = $_SERVER['HTTP_CDN_SRC_IP'];
            $c_agentip = 0;
        }
        if ($onlineip == 'Unknown' && isset($_SERVER['HTTP_NS_IP']) && preg_match ( '/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER ['HTTP_NS_IP'] ))
        {
            $onlineip = $_SERVER ['HTTP_NS_IP'];
            $c_agentip = 0;
        }
        if ($onlineip == 'Unknown' && isset($_SERVER['REMOTE_ADDR']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['REMOTE_ADDR']))
        {
            $onlineip = $_SERVER['REMOTE_ADDR'];
            $c_agentip = 0;
        }
        return $onlineip;
    }
    
    /**
     * 读取文本末尾n行
     * @param string $fp
     * @param int $n
     * @param number $base
     * @return multitype:
     */
    public static function tail($fileName, $n, $base = 5) {
        $fp = fopen($fileName, "r+");
        $pos = $n + 1;
        $lines = array ();
        while ( count ( $lines ) <= $n ) {
            try {
                fseek ( $fp, - $pos, SEEK_END );
            } catch ( \Exception $e ) {
                fseek ( 0 );
                break;
            }
            $pos *= $base;
            while ( ! feof ( $fp ) ) {
                array_unshift ( $lines, fgets ( $fp ) );
            }
        }
        //echo implode ( "", array_reverse ( $lines ) );
        return array_reverse ( array_slice ( $lines, 0, $n ) );
    }
   
    
    public static function sortClass($orderby, $key){
        $data = explode(' ', $orderby);
        $sortClass = 'class="sorting"';
        if(count($data) > 0){
            if(empty($data[0]) == false && $data[0] == $key){
                if(empty($data[1]) == false && $data[1] == 'desc'){
                    $sortClass = 'class="sorting_desc"';
                    
                }
                else{
                    $sortClass = 'class="sorting_asc"';
                }
            }
        }
        return $sortClass;
    }

    public static function get_last_time($time = NULL) {
        $text = '';
        $time = $time === NULL || $time > time() ? time() : intval($time);
        $t = time() - $time; //时间差 （秒）
        $y = date('Y', $time)-date('Y', time());//是否跨年
        switch($t){
            case $t == 0:
                $text = '刚刚';
                break;
            case $t < 60:
                $text = $t . '秒前'; // 一分钟内
                break;
            case $t < 60 * 60:
                $text = floor($t / 60) . '分钟前'; //一小时内
                break;
            case $t < 60 * 60 * 24:
                $text = floor($t / (60 * 60)) . '小时前'; // 一天内
                break;
            case $t < 60 * 60 * 24 * 3:
                $text = floor($time/(60*60*24)) ==1 ?'昨天 ' . date('H:i', $time) : '前天 ' . date('H:i', $time) ; //昨天和前天
                break;
            case $t < 60 * 60 * 24 * 30:
                $text = date('m月d日 H:i', $time); //一个月内
                break;
            case $t < 60 * 60 * 24 * 365&&$y==0:
                $text = date('m月d日', $time); //一年内
                break;
            default:
                $text = date('Y年m月d日', $time); //一年以前
                break;
        }

        return $text;
    }
}
