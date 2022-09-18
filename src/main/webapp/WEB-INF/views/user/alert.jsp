<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>alertpage</title>
</head>
<body>
<script type="text/javascript">
    var message = "${msg}";
    var url = "${url}";
    alert(message);
    document.location.href = url;
</script>
</body>
</html>