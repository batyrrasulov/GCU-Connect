package com.gcuconnect.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Like")
public class Like {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long likeId;
    @ManyToOne
    private User userId; 
    @ManyToOne
    private Post contentId; 
    private String contentType; 

	public String getContentType() {
		return contentType;
	}
	public void setContent_type(String contentType) {
		this.contentType = contentType;
	}
}
