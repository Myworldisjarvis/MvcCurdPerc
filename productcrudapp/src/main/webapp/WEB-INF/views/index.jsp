<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            padding: 3rem 1rem;
        }
        .table-container {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            margin-bottom: 2rem;
            animation: fadeIn 1s ease-in;
        }
        .table-container h2 {
            color: #333;
            font-weight: 700;
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .table {
            width: 100%;
            margin-bottom: 1rem;
            cursor: pointer;
        }
        .table th, .table td {
            padding: 0.75rem;
            vertical-align: middle;
            border-top: 1px solid #dee2e6;
        }
        .table thead th {
            background-color: #007bff;
            color: white;
            border-bottom: 2px solid #dee2e6;
            position: relative;
        }
        .table thead th.sortable::after {
            content: "\25B2"; /* Unicode character for up arrow */
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0.5;
        }
        .table thead th.sortable.sorted-asc::after {
            content: "\25B2"; /* Unicode character for up arrow */
        }
        .table thead th.sortable.sorted-desc::after {
            content: "\25BC"; /* Unicode character for down arrow */
        }
        .table tbody tr {
            transition: background-color 0.3s ease;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .btn-custom {
            border-radius: 8px;
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        .btn-update {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
        }
        .btn-remove {
            background: linear-gradient(45deg, #dc3545, #c82333);
            color: white;
        }
        .btn-update:hover {
            background: linear-gradient(45deg, #0056b3, #007bff);
        }
        .btn-remove:hover {
            background: linear-gradient(45deg, #c82333, #dc3545);
        }
        .btn-add-product {
            background: linear-gradient(45deg, #28a745, #218838);
            color: white;
            margin-bottom: 2rem;
            display: inline-block;
        }
        .btn-add-product:hover {
            background: linear-gradient(45deg, #218838, #28a745);
            transform: scale(1.05);
        }
        .search-bar {
            margin-bottom: 2rem;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Add Product Button -->
    <div class="text-right">
        <a href="add-product" class="btn btn-add-product btn-custom">Add New Product</a>
    </div>

    <!-- Search Bar -->
    <div class="search-bar">
        <input type="text" id="searchInput" onkeyup="searchProducts()" placeholder="Search for products..." class="form-control">
    </div>

    <!-- Product Table -->
    <div class="table-container">
        <h2>Product List</h2>
        <table class="table table-bordered table-hover" id="productTable">
            <thead>
                <tr>
                    <th class="sortable" onclick="sortTable(0)">#</th>
                    <th class="sortable" onclick="sortTable(1)">Product Name</th>
                    <th class="sortable" onclick="sortTable(2)">Description</th>
                    <th class="sortable" onclick="sortTable(3)">Product Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>SHTECH${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td>
                            <a href="update/${product.id}" class="btn btn-update btn-custom">Update</a>
                            <a href="delete/${product.id}" class="btn btn-remove btn-custom">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Search Functionality
    function searchProducts() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("productTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) { // Start at 1 to skip the header row
            tr[i].style.display = "none"; // Hide the row initially

            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) { // Loop through all table cells
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = ""; // Show the row if match is found
                        break; // Exit the loop once a match is found in this row
                    }
                }
            }
        }
    }

    // Sorting Functionality
    function sortTable(columnIndex) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchCount = 0;
        table = document.getElementById("productTable");
        switching = true;
        dir = "asc"; // Set the sorting direction to ascending initially

        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[columnIndex];
                y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }

            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchCount++;
            } else {
                if (switchCount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }

        // Update sorting arrow icons
        var headers = table.getElementsByTagName("TH");
        for (i = 0; i < headers.length; i++) {
            headers[i].classList.remove("sorted-asc", "sorted-desc");
        }
        headers[columnIndex].classList.add(dir == "asc" ? "sorted-asc" : "sorted-desc");
    }
</script>

</body>
</html>
