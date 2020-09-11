<?php

namespace common\helpers;

class RedisBase
{
    /**
     * 这个方法中给 key 增加前缀
     * 所有与key相关的方法都要调用这个方法
     * @param $key
     * @return string
     */
    protected static function buildKey($key)
    {
        return \Yii::getAlias('@redisPrefix') . $key;
    }

    /**
     * @return \yii\redis\Connection
     */
    protected static function getRedis()
    {
        return \Yii::$app->redis;
    }

    /**
     * # exists key
     *
     * 检查key是否存在
     * @param string $key
     * @return bool
     */
    public static function exists($key)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();
        return (bool) $redis->exists($key);
    }

    /**
     * # del key [key2 key3 …]
     *
     * 删除指定数据
     *
     * @param string $key
     * @param bool $strict
     * 是否使用严格模式
     * true: 当指定键不存在时，返回false
     * false: 当指定键不存在时，但会true
     * @return bool
     */
    public static function del($key, $strict = false)
    {
        $key = self::buildKey($key);

        // 非严格模式,当指定键不存在时，但会true
        if (! $strict && ! self::exists($key)) return true;

        $redis = self::getRedis();
        return (bool) $redis->del($key);
    }

    /**
     * # expire key seconds
     *
     * 设置 key在seconds秒后过期
     *
     * @param $key
     * @param $seconds
     * @return bool
     */
    public static function expire($key, $seconds)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();
        return (bool) $redis->expire($key, $seconds);
    }

    /**
     * # ttl key
     *
     * 大于等于0时，表示剩余过期秒数
     * -1 表示key存在，并且没有过期时间
     * -2 表示key已经不存在了
     *
     * 查看key的剩余过期时间
     * @param $key
     * @return int
     */
    public static function ttl($key)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();
        return (int) $redis->ttl($key);
    }

    /**
     * # dbsize
     *
     * 当前db 键的总数量
     * @return int
     */
    public static function dbSize()
    {
        $redis = self::getRedis();
        return (int) $redis->dbsize();
    }

    // ... 其他redis基础方法
}