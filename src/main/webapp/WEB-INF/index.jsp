<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register & Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" />
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
        .btn-danger {
            background-color: #dc3545; /* Danger button color */
            border-color: #dc3545; /* Border color for danger button */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red on hover */
            border-color: #bd2130; /* Darker border color on hover */
        }
        .btn-secondary {
            background-color: #6c757d; /* Secondary button color */
            border-color: #6c757d; /* Border color for secondary button */
        }
        .btn-secondary:hover {
            background-color: #5a6268; /* Darker grey on hover */
            border-color: #545b62; /* Darker border color on hover */
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
        .card-header {
            background-color: #007bff; /* Primary color for card header */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <!-- Logo at the top -->
        <div class="logo">
            <h1>Threaded <span>Your Connection Hub</span></h1>
        </div>

        <!-- Registration Form -->
        <div class="card mb-4">
            <div class="card-header text-white">
                <h2>Register</h2>
            </div>
            <div class="card-body">
                <form:form action="/register/user" method="post" modelAttribute="newUser">
                    <div class="form-group">
                        <form:label path="username">Username:</form:label>
                        <form:input type="text" path="username" class="form-control" />
                        <form:errors class="text-danger" path="username" />
                    </div>
                    <div class="form-group">
                        <form:label path="email">Email:</form:label>
                        <form:input type="text" path="email" class="form-control" />
                        <form:errors class="text-danger" path="email" />
                    </div>
                    <div class="form-group">
                        <form:label path="password">Password:</form:label>
                        <form:input type="password" path="password" class="form-control" />
                        <form:errors class="text-danger" path="password" />
                    </div>
                    <div class="form-group">
                        <form:label path="confirm">Confirm Password:</form:label>
                        <form:input type="password" path="confirm" class="form-control" />
                        <form:errors class="text-danger" path="confirm" />
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form:form>
            </div>
        </div>

        <!-- Login Form -->
        <div class="card">
            <div class="card-header text-white">
                <h2>Login</h2>
            </div>
            <div class="card-body">
                <form:form action="/login/user" method="post" modelAttribute="newLogin">
                    <div class="form-group">
                        <form:label path="email">Email:</form:label>
                        <form:input type="text" path="email" class="form-control" />
                        <form:errors class="text-danger" path="email" />
                    </div>
                    <div class="form-group">
                        <form:label path="password">Password:</form:label>
                        <form:input type="password" path="password" class="form-control" />
                        <form:errors class="text-danger" path="password" />
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>