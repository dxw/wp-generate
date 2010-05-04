<?php

// Configuration

$pre = array('mixins', 'reset', 'common', 'layout', 'page');
$post = array('ie');

// The below are not the droids you are looking for

function array_delete($arr, $val){ //               lacking?
  foreach ($arr as $key => $value) //            so
    if ($arr[$key] == $val)        //        PHP
      unset($arr[$key]);           //     is
  return $arr = array_values($arr);// Why
}

header('content-type: text/css');

// Find the executable

$sass = 'sass';
if (file_exists('config.php')) include 'config.php';
if (defined('SASS_PATH')) $sass = SASS_PATH;

// Find the SASS files, and put them in some sort of order

$files = glob('*.sass');

$_pre = array();
foreach ($pre as $s) {
  $s = $s.'.sass';
  if (file_exists($s)) $_pre[] = $s;
  array_delete(&$files, $s);
}
$_post = array();
foreach ($post as $s) {
  $s = $s.'.sass';
  if (file_exists($s)) $_post[] = $s;
  array_delete(&$files, $s);
}

$files = array_merge($_pre, $files, $_post);

// Pipe things into sass

$descriptorspec = array(0 => array("pipe", "r"), 1 => array("pipe", "w"));
$process = proc_open($sass, $descriptorspec, $pipes);

if (is_resource($process)) {
  foreach ($files as $s)
    fwrite($pipes[0], "@import $s\n");
  fclose($pipes[0]);

  $output = stream_get_contents($pipes[1]);
  fclose($pipes[1]);

  $return_value = proc_close($process);
  if ($return_value != 0)
    echo '/* sass error */';
  else
    echo $output;
} else
  echo '/* wtf error */';
?>
