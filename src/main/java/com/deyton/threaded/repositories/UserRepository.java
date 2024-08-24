package com.deyton.threaded.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.deyton.threaded.models.User;

@Repository // Indicates that this is a repository component
public interface UserRepository extends CrudRepository<User, Long> {

	// Finds a user by their email address
	Optional<User> findByEmail(String email);
}