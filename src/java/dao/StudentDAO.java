package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author maulik
 */
public class StudentDAO {

    public void insertStudent(Student student) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");
        String sid = student.student_id;
        String name = student.name;
        String password = student.password;
        String email = student.email_id;
        String course = student.course;

        PreparedStatement ps = con.prepareStatement("insert into student (student_id,name,password,email_id,course) values(?,?,SHA(?),?,?)");
        ps.setString(1, sid);
        ps.setString(2, name);
        ps.setString(3, password);
        ps.setString(4, email);
        ps.setString(5, course);
        ps.executeUpdate();
        ps.close();
        con.close();

    }
}
