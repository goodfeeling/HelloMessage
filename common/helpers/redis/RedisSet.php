<?php


namespace common\helpers;


class RedisSet extends Base
{
    /**
     * # SADD key member1 [member2]
     *
     * 向集合添加一个或多个成员
     *
     * @param $key
     * @param $members
     * @return int 成功添加数量
     */
    public static function sAdd($key, $members)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();

        // php >= 5.6
        return (int)$redis->sadd($key, ...(array)$members);

        // 通用写法
//        $params = array_merge([$key], (array) $members);
//        return (int) call_user_func_array([$redis, 'sadd'], $params);
    }

    /**
     * # SREM key member1 [member2]
     *
     * 移除集合中一个或多个成员
     * @param $key
     * @param $members
     * @return int
     */
    public static function sRem($key, $members)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();

        $params = array_merge([$key], (array)$members);
        return (int)call_user_func_array([$redis, 'srem'], $params);
    }

    /**
     * # SISMEMBER key member
     *
     * 判断 member 元素是否是集合 key 的成员
     * @param $key
     * @param $member
     * @return bool
     */
    public static function sIsMember($key, $member)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();

        return (bool)$redis->sismember($key, $member);
    }

    /**
     * # SMEMBERS key
     *
     * 返回集合中的所有成员
     * @param $key
     * @return array
     */
    public static function sMembers($key)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();

        return $redis->smembers($key);
    }

    /**
     * # SCARD key
     *
     * 获取集合的成员数
     * @param $key
     * @return bool
     */
    public static function sCard($key)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();

        return (int)$redis->scard($key);
    }

    // ...其他Set类型的方法
}