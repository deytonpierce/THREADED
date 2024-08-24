<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Charset and viewport settings for responsiveness -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Thread</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for dark theme -->
    <style>
        body {
            background-color: #343a40; /* Dark background color */
            color: #f8f9fa; /* Light text color */
        }
        .container {
            max-width: 600px; /* Limit the width of the container */
        }
        .card {
            background-color: #495057; /* Darker card background */
            border: none;
            color: #f8f9fa; /* Light text color */
        }
        .btn-primary {
            background-color: #007bff; /* Primary button color */
            border-color: #007bff; /* Border color for primary button */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Darker border color on hover */
        }
        .btn-danger {
            background-color: #dc3545; /* Danger button color */
            border-color: #dc3545; /* Border color for danger button */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red on hover */
            border-color: #bd2130; /* Darker border color on hover */
        }
        .form-control {
            background-color: #6c757d; /* Dark background for form inputs */
            color: #f8f9fa; /* Light text color */
            border: 1px solid #6c757d; /* Dark border color */
        }
        .form-control:focus {
            background-color: #6c757d; /* Keep background color on focus */
            border-color: #007bff; /* Change border color on focus */
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25); /* Blue shadow on focus */
        }
        .form-group label {
            color: #f8f9fa; /* Light color for form labels */
        }
        .logo {
            text-align: center;
            margin-bottom: 2rem;
        }
        .logo h1 {
            font-family: 'Arial', sans-serif; /* Font for the logo text */
            font-size: 2.5rem; /* Adjust font size as needed */
            color: #007bff; /* Primary color for the logo text */
            margin: 0;
        }
        .logo span {
            font-size: 1.2rem; /* Slightly smaller secondary text */
            color: #f8f9fa; /* Light color for secondary text */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <!-- Logo at the top -->
        <div class="logo">
            <h1>Threaded <span>Your Connection Hub</span></h1>
        </div>
        <!-- Header for the page -->
        <h1 class="mb-4">Edit Thread</h1>
        <!-- Form to add a new thread -->
		<form:form action="/threads/${thread.id}/edit/process" method="post"
			modelAttribute="thread">
			<!-- Hidden input for form method override to PUT -->
			<input type="hidden" name="_method" value="put" />

			<!-- Thread Name input field -->
			<div class="form-group">
				<form:label path="name">Thread Name:</form:label>
				<form:input type="text" path="name" class="form-control" />
				<form:errors class="text-danger" path="name" />
			</div>

			<!-- Submit and Cancel buttons -->
			<button type="submit" class="btn btn-primary">Update</button>
			<a href="/threads" class="btn btn-danger">Cancel</a>
		</form:form>
    </div>
</body>
</html>

