<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tutorials List</title>
</head>
<body>
    <h1>Tutorials</h1>
    <a href="<c:url value='/tutorials/create' />">Create New Tutorial</a>
    
    <c:choose>
        <c:when test="${not empty tutorials}">
            <table border="1" cellpadding="10" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Content Type</th>
                        <th>Advisor</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tutorial" items="${tutorials}">
                        <tr>
                            <td>${tutorial.id}</td>
                            <td>${tutorial.title}</td>
                            <td>${tutorial.contentType}</td>
                            <td>${tutorial.advisor.name}</td> <!-- Display advisor name -->
                            <td>${tutorial.createdAt}</td>
                            <td>
                                <a href="<c:url value='/tutorials/${tutorial.id}' />">View</a> |
                                <a href="<c:url value='/tutorials/${tutorial.id}/edit' />">Edit</a> |
                                <form action="<c:url value='/tutorials/${tutorial.id}/delete' />" method="post" style="display:inline;">
                                    <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this tutorial?');" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No tutorials found.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
