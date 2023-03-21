<?php

class cls_xml {
    
    public static function vec2dom($arr, $name) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;
        $root = $dom->createElement('res');
        self::addAttribute($dom, $root, "name", $name);
        $dom->appendChild($root);
        
        $ele = $dom->createElement('vec');
        $root->appendChild($ele);
        for ($i = 0; $i < count($arr); $i++) {
            self::addAttribute($dom, $ele, "v".$i, $arr[$i]);
        }
        return $dom;
    }

    //2d with keys
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

    public static function addAttribute($dom, $ele, $key, $val) {
        $att = $dom->createAttribute($key);
        $att->value = (is_null($val) ? 'NULL' : $val);  
        $ele->appendChild($att);
    }
    
    /*
     * =========================
     * recordsets
     * =========================
     */
    
    public static function res2dom($res) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;
//        $xsl = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="xsl1.xsl"');
//        $dom->appendChild($xsl);
        $root = $dom->createElement('root');
        $dom->appendChild($root);
//        //fields
//        while ($finfo = $res->fetch_field()) {
//            $node = $dom->createElement('fld');
//            $this->addAttribute($dom, $node, "table", $finfo->table);
//            $this->addAttribute($dom, $node, "name", $finfo->name);
//            $this->addAttribute($dom, $node, "type", $finfo->type);
//            $this->addAttribute($dom, $node, "flags", $finfo->flags);
//            $this->addAttribute($dom, $node, "max_length", $finfo->max_length);
//            $root->appendChild($node);
//        }
        //rows
        while ($row = $res->fetch_assoc()) {
            $node = $dom->createElement('row');
            foreach ($row as $key => $val) {
                self::addAttribute($dom, $node, $key, $val);
            }
            $root->appendChild($node);
        }
        return $dom;
    }
    
    public static function res2arr($res) {
        $arr = array();
        while ($row = $res->fetch_assoc()) {
            $arr[] = $row;
        }
        return $arr;
    }

}
