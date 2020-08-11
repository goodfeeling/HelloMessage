<?php
use yii\helpers\Url;
?>
<script>
    const msg = <?= $msg ?>;
    const btn = <?= $btn ?>;
    const url = "<?=  Url::toRoute('login/index', true)  ?>";
    $.triggerModalBox(msg, btn, url);
</script>