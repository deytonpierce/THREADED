package com.deyton.threaded.repositories;

import org.springframework.data.repository.ListCrudRepository;

import com.deyton.threaded.models.Comment;

// Repository interface for managing Player entities
public interface CommentRepository extends ListCrudRepository<Comment, Long> {

}