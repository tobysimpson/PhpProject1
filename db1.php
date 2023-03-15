<?php

class db1 {

    // single instance of self shared among all instances
    private static $instance = null;
    // db connection config vars
    private $hostname = "localhost";
    private $username = "root";
    private $password = "Flowerdb1";
    private $dbname = "webgame";
    //objects
    public $conn = null;
    public $usr_id = null;

    /*
     * ========================
     * init
     * ========================
     */

    public function __construct() {
        $this->conn = new mysqli($this->hostname, $this->username, $this->password, $this->dbname);
        if ($this->conn->connect_error) {
            die("connection failed: " . $this->conn->connect_error);
        }
        $this->$usr_id = $this->usr_identify();
    }

    public function __destruct() {
        $this->conn->close();
        $this->conn = null;
    }

    public function hello() {
        echo "hello";
        return true;
    }

    /*
     * ========================
     * user
     * ========================
     */

    public function usr_insert($remote_addr, $remote_port, $hostname) {
        $qry = $this->conn->prepare("INSERT INTO usr_info (remote_addr,remote_port,hostname) VALUES (?,?,?);");
        $qry->bind_param("sis", $remote_addr, $remote_port, $hostname);
        $qry->execute();
        return mysqli_insert_id($this->conn);
    }

    public function usr_update($usr_id) {
        $qry = $this->conn->prepare("UPDATE usr_info SET usr_updated = LOCALTIMESTAMP() WHERE usr_id = ?;");
        $qry->bind_param("i", $usr_id);
        $qry->execute();
    }

    public function usr_identify() {
        $usr_id = filter_input(INPUT_COOKIE, "usr_id", FILTER_SANITIZE_NUMBER_INT);
        $remote_addr = filter_input(INPUT_SERVER, "REMOTE_ADDR", FILTER_VALIDATE_IP);
        $remote_port = filter_input(INPUT_SERVER, "REMOTE_PORT", FILTER_VALIDATE_INT);
        $hostname = gethostbyaddr($remote_addr);

        if (is_null($usr_id)) {
            $usr_id = $this->usr_insert($remote_addr, $remote_port, $hostname);
        } else {
            $this->usr_update($usr_id);
        }
        setcookie("usr_id", $usr_id, time() + (365 * 86400), "/"); // 86400 = 1 day

        return $usr_id;
    }

    public function usr_select_all() {
        $qry = $this->conn->prepare("SELECT * FROM usr_info;");
        $qry->execute();
        $res = $qry->get_result();
        $xml = $this->res2dom($res);
        $res->close();

        header('Content-Type: text/html; charset=UTF-8');
        $xsl = $this->xml2dom("xsl1.xsl");
        echo $this->trans($xml, $xsl);
    }

    public function usr_reset() {
        $qry1 = $this->conn->prepare("DELETE FROM usr_info;");
        $qry1->execute();
        $qry2 = $this->conn->prepare("ALTER TABLE usr_info AUTO_INCREMENT = 1;");
        $qry2->execute();
    }

    /*
     * ========================
     * xml
     * ========================
     */

    function res2arr($res) {
        $arr = array();
        while ($row = $res->fetch_assoc()) {
            $arr[] = $row;
        }
        return $arr;
    }

    function arr2dom($arr, $name) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;
        $root = $dom->createElement('arr');
        $this->addAttribute($dom, $root, "name", $name);
        $dom->appendChild($root);

        foreach ($arr as $row) {
            $ele = $dom->createElement('row');
            foreach ($row as $key => $val) {
                $this->addAttribute($dom, $ele, $key, $val);
            }
            $root->appendChild($ele);
        }
        return $dom;
    }

    function res2dom($res) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;

//        $xsl = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="xsl1.xsl"');
//        $dom->appendChild($xsl);
        //root
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
                $this->addAttribute($dom, $node, $key, $val);
            }
            $root->appendChild($node);
        }
        return $dom;
    }

    function xml2dom($filename) {
        $dom = new DOMDocument;
        $dom->load($filename);
        return $dom;
    }

    function trans($xml, $xsl) {
        $proc = new XSLTProcessor;
        $proc->importStyleSheet($xsl);
        return $proc->transformToXML($xml);
    }

    function addAttribute($dom, $ele, $key, $value) {
        $att = $dom->createAttribute($key);
        $att->value = (is_null($value) ? 'NULL' : $value);  //handle nulls
        $ele->appendChild($att);
    }

    /*
     * ========================
     * util
     * ========================
     */

    function clamp($val, $min, $max) {
        if ($val < $min) {
            return $min;
        } else if ($val > $max) {
            return $max;
        }
        return $val;
    }

    /*
     * ========================
     * singleton stuff
     * ========================
     */

    public static function getInstance() {
        if (!self::$instance instanceof self) {
            self::$instance = new self;
        }
        return self::$instance;
    }

    public function __clone() {
        trigger_error('Clone is not allowed.', E_USER_ERROR);
    }

    public function __wakeup() {
        trigger_error('Deserializing is not allowed.', E_USER_ERROR);
    }

}
