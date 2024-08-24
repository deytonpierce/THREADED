<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Threads</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" />
    <style>
        body {
            background-color: #343a40; /* Dark background color */
            color: #f8f9fa; /* Light text color */
        }
        .container {
            max-width: 800px; /* Limit the width of the container */
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
            background-color: #dc3545; /* Danger button color (red) */
            border-color: #dc3545; /* Border color for danger button */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red on hover */
            border-color: #bd2130; /* Darker border color on hover */
        }
        .btn-success {
            background-color: #28a745; /* Success button color (green) */
            border-color: #28a745; /* Border color for success button */
        }
        .btn-success:hover {
            background-color: #218838; /* Darker green on hover */
            border-color: #1e7e34; /* Darker border color on hover */
        }
        .btn-secondary {
            background-color: #6c757d; /* Secondary button color */
            border-color: #6c757d; /* Border color for secondary button */
        }
        .btn-secondary:hover {
            background-color: #5a6268; /* Darker grey on hover */
            border-color: #545b62; /* Darker border color on hover */
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
        .card-header {
            background-color: #007bff; /* Primary color for card header */
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
        table {
            color: #f8f9fa; /* Light text color in the table */
        }
        table th, table td {
            vertical-align: middle;
        }
        table a {
            color: #007bff; /* Primary color for links in the table */
            font-weight: bold; /* Make thread names bold */
        }
        table a:hover {
            color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <!-- Logo at the top -->
        <div class="logo">
            <h1>Threaded <span>Your Connection Hub</span></h1>
        </div>

        <!-- Welcome Message and Buttons -->
        <div class="mb-4 d-flex justify-content-between align-items-center">
            <h1>
                Welcome,
                <c:out value="${user.username}!" />
            </h1>
            <div>
                <a href="/logout" class="btn btn-danger mx-2">
                    <i class="bi bi-box-arrow-right"></i>
                </a>
                <a href="/new/thread" class="btn btn-success mx-2">
                    <i class="bi bi-plus-circle"></i>
                </a>
            </div>
        </div>

        <!-- Table to display threads and their details -->
        <div class="card">
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Thread Name</th>
                            <th>Comments</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="thread" items="${threads}">
                            <tr>
                                <td><a href="/threads/${thread.id}">${thread.name}</a></td>
                                <td><c:out value="${commentCounts[thread.id]}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>