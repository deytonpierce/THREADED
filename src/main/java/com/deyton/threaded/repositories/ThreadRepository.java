package com.deyton.threaded.repositories;

import org.springframework.data.repository.ListCrudRepository;

import com.deyton.threaded.models.Thread;

// Repository interface for managing Team entities
public interface ThreadRepository extends ListCrudRepository<Thread, Long> {

}