<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index1</title>
</head>
<body>
    <form action="sql.php" method="get ">
        <h1>Teacher Table</h1>
        <label> idTeach:</label>
        <input type="number" name="id"><br><br>
        <label>fnameTeach:</label>
        <input type="text" name="fname"><br><br>
        <label>lnameTeach:</label>
        <input type="text" name="lname"><br><br>
        <label>telnoTeach:</label>
        <input type="text" name="tel"><br><br>
        <label>addressTeach:</label>
        <input type="text" name="address"><br><br>
        <input type="submit" value="insert" name="insert">
        <input type="submit" value="delete" name="delete">
        <input type="submit" value="search" name="search">
        <input type="submit" value="update" name="update">

       

    </form>
    
</body>
</html>