<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }
        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
            animation: fadeIn 1s ease-in;
        }
        .form-container h1 {
            margin-bottom: 1.5rem;
            color: #333;
            font-weight: 700;
        }
        .form-group {
            margin-bottom: 1.25rem;
        }
        .form-control {
            border-radius: 8px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }
        .form-control:focus {
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
            outline: none;
        }
        .btn-custom {
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        .btn-back {
            background: linear-gradient(45deg, #6c757d, #343a40);
            color: white;
        }
        .btn-add {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
        }
        .btn-back:hover, .btn-add:hover {
            background: linear-gradient(45deg, #343a40, #6c757d);
            transform: scale(1.05);
            color: white;
        }
        .btn-add:hover {
            background: linear-gradient(45deg, #0056b3, #007bff);
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
<div class="form-container">
        <h1 class="text-center">Fill The Product Details</h1>
        <form action="handle-product" method="post">
            <div class="form-group">
                <label for="firstName">Product Name</label>
                <input type="text" class="form-control" id="firstName" name="name" placeholder="Enter Product Name" required>
            </div>
            <div class="form-group">
                <label for="description">Product Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="Enter product description" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Product Price</label>
                <input type="text" class="form-control" id="price" name="price" placeholder="Enter product price" required>
            </div>
            <div class="form-group text-center">
                <a href="${pageContext.request.contextPath }/" class="btn btn-back btn-custom">Back</a>
                <button type="submit" class="btn btn-add btn-custom">Add Product</button>
            </div>
        </form>
    </div>
</body>
</html>