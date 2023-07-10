<?php

trait lib_lin {
    
    //scalar mult
    public static function fn_smul($u, $a) {
        foreach ($u as $e) {
            $v[] = $e * $a;
        }
        return $v;
    }

    //ele mult
    public static function fn_emul($u, $v) {
        return array_map(function ($e1, $e2) {
            return $e1 * $e2;
        }, $u, $v);
    }

    //ele subtract
    public static function fn_esub($u, $v) {
        return array_map(function ($e1, $e2) {
            return $e1 - $e2;
        }, $u, $v);
    }

    //inner prod
    public function fn_dot($u, $v) {
        return array_sum(fn_emul($u, $v));
    }

    //2norm
    public static function fn_nrm2($u) {
        return sqrt(fn_dot($u, $u));
    }

    //1norm
    public static function fn_nrm1($u) {
        return array_sum(array_map("abs", $u));
    }

    //mtx vec mult
    public static function fn_Au($A, $u) {
        foreach ($A as $row) {
            $v[] = fn_dot($row, $u);
        }
        return $v;
    }

    //print (mtx or vec)
    public static function fn_disp($A) {
        foreach ($A as $row) {
            if (is_array($row)) {
                foreach ($row as $ele) {
                    printf("%6.4e ", $ele);
                }
            } else {
                printf("%6.4e ", $row);
            }
            printf("\n");
        }
    }
    
}
