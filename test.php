<?php
// https://github.com/VKCOM/kphp/pull/295#issuecomment-919192727

$int = FFI::new('int8_t');
var_dump(FFI::sizeof($int));
var_dump(FFI::sizeof(FFI::addr($int)));

$cdef = FFI::cdef('
  const char *getenv(const char *name);
', 'libc.so.6');
$home = $cdef->getenv("HOME");
var_dump($home);
