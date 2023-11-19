package com.together.backend.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BasicUser {

    private String userId;
    private String firstName;
    private String secondName;
    private String surname;
    private String contactPhone;
    private String role;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "EEE, d MMM yyyy HH:mm:ss Z")
    private Date creationDate;

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return secondName;
    }
    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getSurname() {
        return surname;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getContactPhone() {
        return contactPhone;
    }
    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public Date getCreationDate() {
        return creationDate;
    }
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    @Override
    public String toString() {
        return "BasicUser [userId=" + userId + ", firstName=" + firstName + ", secondName=" + secondName + ", surname="
                + surname + ", contactPhone=" + contactPhone + ", role=" + role + ", creationDate=" + creationDate
                + "]";
    }

    

}
