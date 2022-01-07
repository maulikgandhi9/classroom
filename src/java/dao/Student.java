package dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author maulik
 */
public class Student {
    
    String student_id;
    String name;
    String password;
    String email_id;
    String course;
    int apporoved;

    public Student() {
    }

    public Student(String student_id, String name, String password, String email_id, String course) {
        this.student_id = student_id;
        this.name = name;
        this.password = password;
        this.email_id = email_id;
        this.course = course;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public int getApporoved() {
        return apporoved;
    }

    public void setApporoved(int apporoved) {
        this.apporoved = apporoved;
    }
    
    
}
