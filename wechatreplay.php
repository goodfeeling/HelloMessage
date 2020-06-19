<?php
header('content-type:text');   //加这一句好像还不行，
ob_clean();       //这一句加上就可以了。
exit(htmlspecialchars($_GET['echostr']));      //把echostr参数返回给微信开发者后台