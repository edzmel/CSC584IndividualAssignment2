/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package student.bean;

/**
 *
 * @author edzme
 */
public class ProfileBean {
    
    String name;
    String studentID;
    String program;
    String email;
    String hobbies;
    String intro;
    
    public ProfileBean(){
        
    }
    
    public void ProfileBean(String name,String studentID,String program,String email,String hobbies,String intro){
        this.name=name;
        this.studentID=studentID;
        this.program=program;
        this.email=email;
        this.hobbies=hobbies;
        this.intro=intro;
    }
    
    public String getName(){
        return name;
    }
    public String getStudentID(){
        return studentID;
    }
    public String getProgram(){
        return program;
    }
    public String getEmail(){
        return email;
    }
    public String getHobbies(){
        return hobbies;
    }
    public String getIntro(){
        return intro;
    }
    
    public void setName(String name){
        this.name=name;
    }
    public void setStudentID(String studentID){
        this.studentID=studentID;
    }
    public void setProgram(String program){
        this.program=program;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public void setHobbies(String hobbies){
        this.hobbies=hobbies;
    }
    public void setIntro(String intro){
        this.intro=intro;
    }
}
