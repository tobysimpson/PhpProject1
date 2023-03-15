<?php

//scalar mult
function fn_smul($u, $a) {
    foreach ($u as $e) {
        $v[] = $e * $a;
    }
    return $v;
}

//ele mult
function fn_emul($u, $v) {
    return array_map(function ($e1, $e2) {
        return $e1 * $e2;
    }, $u, $v);
}

//ele subt
function fn_esub($u, $v) {
    return array_map(function ($e1, $e2) {
        return $e1 - $e2;
    }, $u, $v);
}

//inner
function fn_dot($u, $v) {
    return array_sum(fn_emul($u, $v));
}

//2norm
function fn_nrm2($u) {
    return sqrt(fn_dot($u, $u));
}

//1norm
function fn_nrm1($u) {
    return array_sum(array_map("abs", $u));
}

function fn_Au($A, $u) {
    foreach ($A as $r) {
        $v[] = fn_dot($r, $u);
    }
    return $v;
}

function fn_disp4($u) {
    printf("%6.4e\n%6.4e\n%6.4e\n%6.4e\n", $u[0], $u[1], $u[2], $u[3]);
}

function fn_disp4x4($A) {
    foreach ($A as $r) {
        printf("%6.4e %6.4e %6.4e %6.4e\n", $r[0], $r[1], $r[2], $r[3]);
    }
}

?>
