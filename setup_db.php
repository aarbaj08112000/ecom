<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setup extends CI_Controller {

    public function index() {
        $this->load->dbforge();

        $fields = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE,
                'auto_increment' => TRUE
            ),
            'user_id' => array(
                'type' => 'INT',
                'constraint' => 11
            ),
            'name' => array(
                'type' => 'VARCHAR',
                'constraint' => '100'
            ),
            'phone' => array(
                'type' => 'VARCHAR',
                'constraint' => '20'
            ),
            'street' => array(
                'type' => 'TEXT',
                'null' => TRUE
            ),
            'city' => array(
                'type' => 'VARCHAR',
                'constraint' => '100'
            ),
            'state' => array(
                'type' => 'VARCHAR',
                'constraint' => '100'
            ),
            'zip' => array(
                'type' => 'VARCHAR',
                'constraint' => '20'
            ),
            'is_default' => array(
                'type' => 'TINYINT',
                'constraint' => 1,
                'default' => 0
            ),
            'created_at' => array(
                'type' => 'DATETIME',
                'null' => TRUE
            ),
            'updated_at' => array(
                'type' => 'DATETIME',
                'null' => TRUE
            ),
             'is_delete' => array(
                'type' => 'ENUM("0","1")',
                'default' => '0'
            )
        );

        $this->dbforge->add_field($fields);
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('addresses', TRUE);

        echo "Table 'addresses' created successfully!";
    }
}
