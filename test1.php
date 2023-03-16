<?php

require_once 'cls_lin.php';

$v = array(rand(),rand(),rand(),rand());

$v = cls_lin::fn_smul($v, 1 / cls_lin::fn_nrm2($v));

$A = array($v,$v,$v,$v);


cls_lin::fn_disp($v);
cls_lin::fn_disp($A);

echo cls_lin::fn_dot($v,$v),"\n";

$w = cls_lin::fn_Au($A, $v);

cls_lin::fn_disp($w);








