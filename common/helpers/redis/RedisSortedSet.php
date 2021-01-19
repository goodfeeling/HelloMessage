<?php


namespace common\helpers;


class RedisSortedSet extends Base
{
    /**
     * # ZADD key score1 member1 [score2 member2]
     *
     * 向有序集合添加一个或多个成员，或者更新已存在成员的分数
     * @param $key
     * @param array $options
     * [
     *     'value1' => score1,
     *     'value2' => score2,
     *     'value3' => score3,
     * ]
     *
     * @return int
     */
    public static function zAdd($key, array $options)
    {
        $key = self::buildKey($key);
        $redis = self::getRedis();
        $param = [$key];

        foreach ($options as $value => $score) {
            $param[] = $score;
            $param[] = $value;
        }

        return (int) call_user_func_array([$redis, 'zadd'], $param);
    }

    // ...其他SortedSet类型的方法
}