<?php

class cls_xml {

    public static function arr2dom($arr, $name) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;
        $root = $dom->createElement('res');
        self::addAttribute($dom, $root, "name", $name);
        $dom->appendChild($root);

        foreach ($arr as $row) {
            $ele = $dom->createElement('row');
            foreach ($row as $key => $val) {
                self::addAttribute($dom, $ele, $key, $val);
            }
            $root->appendChild($ele);
        }
        return $dom;
    }

    public static function file2dom($filename) {
        $dom = new DOMDocument;
        $dom->load($filename);
        return $dom;
    }

    public static function xsltrans($xml, $xsl) {
        $proc = new XSLTProcessor;
        $proc->importStyleSheet($xsl);
        return $proc->transformToXML($xml);
    }

    private static function addAttribute($dom, $ele, $key, $value) {
        $att = $dom->createAttribute($key);
        $att->value = (is_null($value) ? 'NULL' : $value);  //handle nulls
        $ele->appendChild($att);
    }

}
