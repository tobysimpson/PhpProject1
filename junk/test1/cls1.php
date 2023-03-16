<?php

require_once 'lib1.php';
require_once 'lib2.php';
require_once 'cls2.php';

class cls1 {

    use lib1;
    use lib2;

    public static function fn_c1f1() {
        echo "c1f1\n";
        for ($i = 0; $i < 10; $i++) {
            self::fn_c1f2($i);
            self::fn_l1f1($i);
            
        }
    }

    public static function fn_c1f2($i) {
        echo $i, " c1f2\n";
    }
    
    public static function fn_c1f3($i) {
        echo $i, " c1f3\n";
//        cls2::fn_c2f1();
        self::fn_l2f1();
    }

}
