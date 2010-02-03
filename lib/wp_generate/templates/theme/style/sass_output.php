<?php
header('content-type: text/css');
$sass = 'sass';
if (file_exists('config.php')) include 'config.php';
if (defined('SASS_PATH')) $sass = SASS_PATH;
system("$sass style.sass");
?>
