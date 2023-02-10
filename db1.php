<?php

class db1 {

// single instance of self shared among all instances
    private static $instance = null;
// db connection config vars
    protected $hostname = "localhost";
    protected $username = "root";
    protected $password = "Flowerdb1";
    protected $dbname = "webgame";
//objects
    public $conn = null;

    /*
     * ========================
     * init
     * ========================
     */

    public function __construct() {
//        $this->connect();
        $this->conn = new mysqli($this->hostname, $this->username, $this->password, $this->dbname);
        if ($this->conn->connect_error) {
            die("connection failed: " . $this->conn->connect_error);
        }
    }

    public function __destruct() {
        $this->conn->close();
        $this->conn = null;
    }

//    private function connect() {
//        $this->conn = new mysqli($this->hostname, $this->username, $this->password, $this->dbname);
//        if ($this->conn->connect_error) {
//            die("connection failed: " . $this->conn->connect_error);
//        }
//    }

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
        $query = $this->conn->prepare("INSERT INTO usr_info (remote_addr,remote_port,hostname) VALUES (?,?,?);");
        $query->bind_param("sis", $remote_addr, $remote_port, $hostname);
        $query->execute();
        
        return mysqli_insert_id($this->conn);
    }

    public function usr_update($usr_id) {
        $query = $this->conn->prepare("UPDATE usr_info SET usr_updated = LOCALTIMESTAMP() WHERE usr_id = ?;");
        $query->bind_param("i", $usr_id);
        $query->execute();
    }

    public function usr_select() {
        $query = $this->conn->prepare("SELECT * FROM usr_info;");
        $query->execute();

        $this->res2xml($query->get_result());
    }

    /*
     * ========================
     * item
     * ========================
     */

    public function item_insert() {
        $query = $this->conn->prepare("INSERT INTO item_info (item_val1,item_val2) VALUES (RAND(),RAND());");
//        $query->bind_param("i", $item_id);
        $query->execute();

        return mysqli_insert_id($this->conn);
    }

    public function item_update($item_id) {
        $query = $this->conn->prepare("UPDATE item_info SET item_updated = LOCALTIMESTAMP() WHERE item_id = ?;");
        $query->bind_param("i", $item_id);
        $query->execute();
    }

    public function item_select() {
        $query = $this->conn->prepare("SELECT * FROM item_info;");
//        $query->bind_param("i", $item_id);
        $query->execute();
        $result = $query->get_result();

        $this->res2xml($result);
    }

    /*
     * ========================
     * util
     * ========================
     */

    private function res2xml($result) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;

        $xsl = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="xsl1.xsl"');
        $dom->appendChild($xsl);

        $root = $dom->createElement('root');
        $dom->appendChild($root);

        while ($row = $result->fetch_assoc()) {
            $node = $dom->createElement('row');
            foreach ($row as $key => $val) {

                $att = $dom->createAttribute($key); //att
                $att->value = $val;
                $node->appendChild($att);
            }
            $root->appendChild($node);
        }

        header('Content-Type: text/xml');

        echo $dom->saveXML(); //dom
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
