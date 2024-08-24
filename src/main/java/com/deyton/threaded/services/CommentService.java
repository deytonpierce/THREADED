package com.deyton.threaded.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.deyton.threaded.models.Comment;
import com.deyton.threaded.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired
	CommentRepository pRepo; // Injecting the CommentRepository dependency

	// Retrieves all comments from the database
	public List<Comment> getAll() {
		return pRepo.findAll();
	}

	// Creates a new comment
	public void createComment(Comment comment) {
		// Ensure comment ID is null for new comments
		if (comment.getId() != null) {
			comment.setId(null); // This ensures that a new comment gets a new ID
		}
		pRepo.save(comment); // Saves the comment to the database
	}

	// Retrieves a comment by its ID
	public Comment getOneComment(Long id) {
		Optional<Comment> optionalComment = pRepo.findById(id); // Finds comment by ID
		if (optionalComment.isPresent()) {
			return optionalComment.get(); // Returns the comment if present
		} else {
			return null; // Returns null if comment not found
		}
	}

	// Updates an existing comment
	public Comment update(Comment comment) {
		return pRepo.save(comment); // Saves the updated comment to the database
	}

	// Deletes a comment by its ID
	public void deleteComment(Long id) {
		pRepo.deleteById(id); // Deletes the comment from the database
	}
}