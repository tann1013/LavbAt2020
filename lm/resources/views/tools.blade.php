<html>
<body>

<h3>Tools</h3>
<hr>

<!--url1: /import POST   url2:/web/upload POST -->

<form action="/web/flie2Arr" method="POST" enctype="multipart/form-data">
    {{--<label for="file">Filename:</label><input type="file" name="file" id="file" />--}}
    <hr>
    上传最近（周月等）收支账单Excel： <input type="file" name="excel" />
    <br />
    <input type="submit" name="submit" value="提交Excel" />
</form>

</body>
</html>