<?php

trait lib1 {

    public static function fn_l1f1($i) 
    {
        echo $i," l1f1\n";
        self::fn_l1f2($i);
    }
    
    public static function fn_l1f2($i) 
    {
        echo $i," l1f2\n";
    }
}
