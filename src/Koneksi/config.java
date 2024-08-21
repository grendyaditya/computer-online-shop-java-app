/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Koneksi;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author Lenovo
 */
public class config {

    public Connection conn;
    public Statement stm;
    public int id_user;
    public String nama, username, level;

    public void config() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/toko_pc", "root", "");
            stm = conn.createStatement();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Gagal Koneksi\n" + e.getMessage());
            System.exit(0);
        }
    }
}
