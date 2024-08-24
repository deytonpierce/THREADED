<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>One Thread</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" />
    <style>
        body {
            background-color: #343a40; /* Dark background color */
            color: #f8f9fa; /* Light text color */
        }
        .container {
            max-width: 900px; /* Limit the width of the container */
        }
        .card {
            background-color: #495057; /* Darker card background */
            border: none;
            color: #f8f9fa; /* Light text color */
        }
        .card-header {
            background-color: #007bff; /* Blue header background */
            color: #fff; /* White text color */
        }
        .btn-primary {
            background-color: #007bff; /* Primary button color */
            border-color: #007bff; /* Border color for primary button */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Darker border color on hover */
        }
        .btn-secondary {
            background-color: #6c757d; /* Secondary button color */
            border-color: #6c757d; /* Border color for secondary button */
        }
        .btn-secondary:hover {
            background-color: #5a6268; /* Darker grey on hover */
            border-color: #545b62; /* Darker border color on hover */
        }
        .btn-danger {
            background-color: #dc3545; /* Danger button color */
            border-color: #dc3545; /* Border color for danger button */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red on hover */
            border-color: #bd2130; /* Darker border color on hover */
        }
        .media-body h5 {
            color: #f8f9fa; /* Light text color for comments */
        }
        .media-body p {
            color: #e9ecef; /* Slightly lighter text color for comments */
        }
        .subtitle {
            color: #adb5bd; /* Lighter text color for added by */
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
    </style>
</head>
<body>
    <div class="container mt-4">
        <!-- Logo at the top -->
        <div class="logo">
            <h1>Threaded <span>Your Connection Hub</span></h1>
        </div>

        <!-- Header for thread details -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>${thread.name}</h1>
            <div>
                <a href="/threads" class="btn btn-primary me-2">
                    <i class="bi bi-house-door"></i>
                </a>
                <c:if test="${userId == thread.user.id}">
                    <a href="/threads/${thread.id}/edit" class="btn btn-secondary me-2">
                        <i class="bi bi-pencil"></i>
                    </a>
                    <form action="/threads/${thread.id}/delete" method="post" class="d-inline">
                        <input type="hidden" name="_method" value="delete" />
                        <button type="submit" class="btn btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>
                </c:if>
            </div>
        </div>

        <h6 class="subtitle mb-4">Added by ${thread.user.username}</h6>

        <!-- Table to display the list of comments in the thread -->
        <div class="card mb-4">
            <div class="card-header">
                Comments
            </div>
            <div class="card-body">
                <c:forEach var="comment" items="${thread.comments}">
                    <div class="media mb-4">
                        <div class="media-body">
                            <h5 class="mt-0">${comment.user.username}</h5>
                            <p>${comment.name}</p>
                        </div>
                    </div>
                    <hr>
                </c:forEach>
            </div>
        </div>

        <!-- Conditional form to add a new comment -->
        <div class="mt-4">
            <form:form action="/threads/${thread.id}/addcomment" method="post" modelAttribute="comment">
                <div class="form-group">
                    <form:input type="text" path="name" class="form-control" />
                    <form:errors class="text-danger" path="name" />
                </div>
                <button type="submit" class="btn btn-primary">Comment</button>
            </form:form>
        </div>
    </div>
</body>
</html>