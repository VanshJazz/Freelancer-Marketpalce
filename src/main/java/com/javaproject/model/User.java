package com.javaproject.model;

import jakarta.persistence.*;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String password;
    private String contactNumber;
    private boolean freelancer;
    private String interestField;

    // Getters and setters
    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

    public String getContactNumber() { return contactNumber; }

    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public boolean isFreelancer() { return freelancer; }

    public void setFreelancer(boolean freelancer) { this.freelancer = freelancer; }

    public String getInterestField() { return interestField; }

    public void setInterestField(String interestField) { this.interestField = interestField; }
}
