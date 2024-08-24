package com.deyton.threaded.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.deyton.threaded.models.Comment;
import com.deyton.threaded.models.Thread;
import com.deyton.threaded.models.User;
import com.deyton.threaded.services.CommentService;
import com.deyton.threaded.services.ThreadService;
import com.deyton.threaded.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired
	UserService users; // Service for user-related operations
	@Autowired
	ThreadService threads; // Service for thread-related operations
	@Autowired
	CommentService comments; // Service for comment-related operations

	// Display the homepage with a list of threads and comment counts
	@GetMapping("/threads")
	public String homepage(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/"; // Redirect to the home page if the user is not logged in
		} else {
			List<Thread> threadsList = threads.getAll(); // Fetch all threads
			Map<Long, Integer> commentCounts = new HashMap<>();

			for (Thread thread : threadsList) {
				int commentCount = thread.getComments() != null ? thread.getComments().size() : 0;
				commentCounts.put(thread.getId(), commentCount); // Count comments for each thread
			}

			model.addAttribute("user", users.getLoggedInUser(userId)); // Add logged-in user to model
			model.addAttribute("threads", threadsList); // Add list of threads to model
			model.addAttribute("commentCounts", commentCounts); // Add comment counts to model
			return "homepage.jsp"; // Return the homepage view
		}
	}

	// Display form to create a new thread
	@GetMapping("/new/thread")
	public String threadForm(@ModelAttribute("thread") Thread thread, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/"; // Redirect to the home page if the user is not logged in
		} else {
			return "threadForm.jsp"; // Return the thread form view
		}
	}

	// Handle form submission to create a new thread
	@PostMapping("/threads/new/process")
	public String createThread(@Valid @ModelAttribute("thread") Thread thread, BindingResult result, Model model,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/"; // Redirect to the home page if the user is not logged in
		}
		if (result.hasErrors()) {
			return "threadForm.jsp"; // Return the form view if there are validation errors
		} else {
			User user = users.getLoggedInUser(userId);
			thread.setUser(user); // Set the user who is creating the thread
			threads.createThread(thread); // Save the new thread
			return "redirect:/threads"; // Redirect to the threads list
		}
	}

	// Display form to edit an existing thread
	@GetMapping("/threads/{id}/edit")
	public String editForm(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		Thread thread = threads.getOneThread(id); // Fetch the thread to be edited

		if (userId == null || !userId.equals(thread.getUser().getId())) {
			return "redirect:/threads/{id}"; // Redirect if the user is not authorized to edit the thread
		}

		model.addAttribute("thread", thread); // Add the thread to the model
		return "editThread.jsp"; // Return the edit thread form view
	}

	// Handle form submission to update an existing thread
	@PutMapping("/threads/{id}/edit/process")
	public String updateThread(@Valid @ModelAttribute("thread") Thread thread, BindingResult result, Model model,
			HttpSession session, RedirectAttributes redirectAttributes) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/"; // Redirect to the home page if the user is not logged in
		} else if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("error", "No fields can be blank"); // Add error message to redirect
			model.addAttribute("thread", thread); // Add thread to the model
			return "redirect:/threads/" + thread.getId() + "/edit"; // Redirect to the edit page with errors
		} else {
			thread.setUser(users.getLoggedInUser(userId)); // Update the thread with the logged-in user
			threads.update(thread); // Save the updated thread
			return "redirect:/threads"; // Redirect to the threads list
		}
	}

	// Handle deletion of a thread
	@DeleteMapping("/threads/{id}/delete")
	public String deleteThread(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		Thread thread = threads.getOneThread(id); // Fetch the thread to be deleted

		if (userId == null || !userId.equals(thread.getUser().getId())) {
			return "redirect:/threads/{id}"; // Redirect if the user is not authorized to delete the thread
		}

		threads.deleteThread(id); // Delete the thread
		return "redirect:/threads"; // Redirect to the threads list
	}

	// Display details of a single thread
	@GetMapping("/threads/{id}")
	public String viewThread(@PathVariable("id") Long id, Model model, HttpSession session,
			@ModelAttribute("comment") Comment comment) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/"; // Redirect to the home page if the user is not logged in
		} else {
			model.addAttribute("thread", threads.getOneThread(id)); // Add thread details to the model
			return "oneThread.jsp"; // Return the thread details view
		}
	}

	// Handle form submission to add a comment to a thread
	@PostMapping("/threads/{id}/addcomment")
	public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result,
			HttpSession session, @PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/"; // Redirect to the home page if the user is not logged in
		}

		Thread oneThread = threads.getOneThread(id); // Fetch the thread to which the comment will be added
		
		if (result.hasErrors()) {
			model.addAttribute("thread", oneThread); // Add the thread to the model if there are errors
			return "oneThread.jsp"; // Return the thread details view with errors
		} else {
			User loggedInUser = users.getLoggedInUser(userId);
			comment.setThread(oneThread); // Set the thread for the comment
			comment.setUser(loggedInUser); // Set the user who is adding the comment
			comments.createComment(comment); // Save the new comment
			return "redirect:/threads/" + id; // Redirect to the thread details view
		}
	}
}