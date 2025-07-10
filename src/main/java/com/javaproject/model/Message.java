package com.javaproject.model;

import jakarta.persistence.*;

@Entity
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private User sender;

    @ManyToOne
    @JoinColumn(name = "receiver_id")
    private User receiver;

    @Column(length = 2000)
    private String content;

    private long timestamp;
    
    private String workNeeded;
    private String dateRequired;
    private String otherDetails;
    
    private String fileName; 
    private String filePath; 


    
    public Long getId() {
        return id;
    }

    

	



	public Message(Long id, User sender, User receiver, String content, long timestamp, String workNeeded,
			String dateRequired, String otherDetails, String fileName, String filePath) {
		super();
		this.id = id;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.timestamp = timestamp;
		this.workNeeded = workNeeded;
		this.dateRequired = dateRequired;
		this.otherDetails = otherDetails;
		this.fileName = fileName;
		this.filePath = filePath;
	}







	public String getFileName() {
		return fileName;
	}







	public void setFileName(String fileName) {
		this.fileName = fileName;
	}







	public String getFilePath() {
		return filePath;
	}







	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}







	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}



	public String getWorkNeeded() {
		return workNeeded;
	}

	public void setWorkNeeded(String workNeeded) {
		this.workNeeded = workNeeded;
	}

	public String getDateRequired() {
		return dateRequired;
	}

	public void setDateRequired(String dateRequired) {
		this.dateRequired = dateRequired;
	}

	public String getOtherDetails() {
		return otherDetails;
	}

	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}

	public void setId(Long id) {
        this.id = id;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }
}
