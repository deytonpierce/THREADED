package com.deyton.threaded.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.deyton.threaded.models.Thread;
import com.deyton.threaded.repositories.ThreadRepository;

@Service
public class ThreadService {

	@Autowired
	ThreadRepository tRepo; // Injecting the ThreadRepository dependency

	// Retrieves all threads from the database
	public List<Thread> getAll() {
		return tRepo.findAll();
	}

	// Creates a new thread
	public void createThread(Thread thread) {
		tRepo.save(thread); // Saves the thread to the database
	}

	// Retrieves a thread by its ID
	public Thread getOneThread(Long id) {
		Optional<Thread> optionalThread = tRepo.findById(id); // Finds thread by ID
		if (optionalThread.isPresent()) {
			return optionalThread.get(); // Returns the thread if present
		} else {
			return null; // Returns null if thread not found
		}
	}

	// Updates an existing thread
	public Thread update(Thread thread) {
		return tRepo.save(thread); // Saves the updated thread to the database
	}

	// Deletes a thread by its ID
	public void deleteThread(Long id) {
		tRepo.deleteById(id); // Deletes the thread from the database
	}

}