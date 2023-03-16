<?php

class cls_pd {

    //markov mtx
    public static function fn_mark($p, $q) {

//        //need to transpose
//        $a1 = array($p[0] * $q[0], $p[0] * (1 - $q[0]), (1 - $p[0]) * $q[0], (1 - $p[0]) * (1 - $q[0]));
//        $a2 = array($p[1] * $q[2], $p[1] * (1 - $q[2]), (1 - $p[1]) * $q[2], (1 - $p[1]) * (1 - $q[2]));
//        $a3 = array($p[2] * $q[1], $p[2] * (1 - $q[1]), (1 - $p[2]) * $q[1], (1 - $p[2]) * (1 - $q[1]));
//        $a4 = array($p[3] * $q[3], $p[3] * (1 - $q[3]), (1 - $p[3]) * $q[3], (1 - $p[3]) * (1 - $q[3]));
        //transposed
        $a1 = array($p[0] * $q[0], $p[1] * $q[2], $p[2] * $q[1], $p[3] * $q[3]);
        $a2 = array($p[0] * (1 - $q[0]), $p[1] * (1 - $q[2]), $p[2] * (1 - $q[1]), $p[3] * (1 - $q[3]));
        $a3 = array((1 - $p[0]) * $q[0], (1 - $p[1]) * $q[2], (1 - $p[2]) * $q[1], (1 - $p[3]) * $q[3]);
        $a4 = array((1 - $p[0]) * (1 - $q[0]), (1 - $p[1]) * (1 - $q[2]), (1 - $p[2]) * (1 - $q[1]), (1 - $p[3]) * (1 - $q[3]));

        return array($a1, $a2, $a3, $a4);
    }

    //first eig
    public static function fn_eig1($A) {
        //init
        $v = array(rand(), rand(), rand(), rand());
//        $v = array(1,2,3,4);
        //normalise
        $v = cls_lin::fn_smul($v, 1e0 / cls_lin::fn_nrm2($v));
        //power iteration
        for ($i = 0; $i < 200; $i++) {
            $w = cls_lin::fn_Au($A, $v);
            $w = cls_lin::fn_smul($w, 1e0 / cls_lin::fn_nrm1($w));
            //conv
            if (cls_lin::fn_nrm1(cls_lin::fn_esub($v, $w)) < 1e-15) {
//                echo $i, " ", cls_lin::fn_nrm1(cls_lin::fn_esub($v, $w)), "\n";
                break;
            }
            $v = $w;
        }//i
        return $v;
    }

}
