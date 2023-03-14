<?php

function fn_dot($v1, $v2) {
    return $v1[0] * $v2[0] + $v1[1] * $v2[1] + $v1[2] * $v2[2] + $v1[3] * $v2[3];
}

function fn_Av($A, $v) {
    $u[0] = fn_dot($A[0], $v);
    $u[1] = fn_dot($A[1], $v);
    $u[2] = fn_dot($A[2], $v);
    $u[3] = fn_dot($A[3], $v);
    return $u;
}

function fn_disp4($v) {
    printf("%6.4e\n%6.4e\n%6.4e\n%6.4e\n", $v[0], $v[1], $v[2], $v[3]);
}

function fn_disp4x4($A) {
    printf("%6.4e %6.4e %6.4e %6.4e\n", $A[0][0], $A[0][1], $A[0][2], $A[0][3]);
    printf("%6.4e %6.4e %6.4e %6.4e\n", $A[1][0], $A[1][1], $A[1][2], $A[1][3]);
    printf("%6.4e %6.4e %6.4e %6.4e\n", $A[2][0], $A[2][1], $A[2][2], $A[2][3]);
    printf("%6.4e %6.4e %6.4e %6.4e\n", $A[3][0], $A[3][1], $A[3][2], $A[3][3]);
}

$v = [1, 2, 3, 4];

//rows
$a1 = [1, 2, 3, 4];
$a2 = [5, 6, 7, 8];
$a3 = [0, 0, 1, 0];
$a4 = [0, 0, 0, 1];

$A = [$a1, $a2, $a3, $a4];

fn_disp4x4($A);

echo "\n";

echo fn_dot($a1, $a2), "\n";
echo "\n";

fn_disp4(fn_Av($A, $v));

echo "\n";

for ($i = 0; $i <= 10; $i++) {
    $v = fn_Av($A, $v);
    fn_disp4($v);
    echo "\n";
} 

?>
