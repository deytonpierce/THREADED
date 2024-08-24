package com.deyton.threaded.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "threads") // Specifies the table name in the database
public class Thread {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-generates the ID
	private Long id;

	@NotEmpty(message = "Thread name is required!") // Ensures the thread name is not empty
	private String name;

	@Column(updatable = false) // Indicates that this field should not be updated after creation
	@DateTimeFormat(pattern = "yyyy-MM-dd") // Formats the date for display
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd") // Formats the date for display
	private Date updatedAt;

	// Automatically sets the createdAt field to the current date when the entity is
	// first persisted
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	// Automatically sets the updatedAt field to the current date when the entity is
	// updated
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	@ManyToOne(fetch = FetchType.LAZY) // Many threads can be associated with one user
	@JoinColumn(name = "user_id") // Foreign key column in the threads table
	private User user;

	@OneToMany(mappedBy = "thread", fetch = FetchType.LAZY, cascade = CascadeType.ALL) // One thread can have many comments
	private List<Comment> comments;

	public Thread() {
		super();
	}

	// Getter and setter for id
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	// Getter and setter for name
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// Getter and setter for createdAt
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	// Getter and setter for updatedAt
	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	// Getter and setter for user
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// Getter and setter for comments
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

}
