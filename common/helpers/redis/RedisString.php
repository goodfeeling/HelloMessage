<?php


namespace common\helpers;


class RedisString extends Base
{

    /**
     * # SET key value options
     *
     * 设置指定 key 的值
     *
     * @param $key
     * @param $value
     * @param array $options
     *
     * EX seconds -- 设置指定key的过期时间，以秒为单位
     * PX milliseconds -- 设置指定key的过期时间，以毫秒为单位
     * NX -- 只有在key不存在的情况下才设置.
     * XX -- 只有在key存在的情况下才设置.
     *
     * eg: ['NX', 'EX', '3600']
     *
     * @return bool
     */
    public static function set($key, $value, array $options = [])
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();
        $param = array_merge([$key, $value], $options);
        return (bool) call_user_func_array([$redis, 'set'], $param);
    }

    /**
     * # GET key
     *
     * 获取指定 key 的值。
     * @param $key
     * @return string
     */
    public static function get($key)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();
        return $redis->get($key);
    }

    // ...其他String类型的方法
}