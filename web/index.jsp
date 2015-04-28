<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function getimg(){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','Alexander_Graham_Bell.jpg');
            xhr.responseType='blob';

            xhr.onload=function(){
                if(this.status == 200){
                    var img = document.createElement('img');
                    img.src = window.URL.createObjectURL(this.response);
                    img.onload = function(){
                        window.URL.revokeObjectURL(this.src);
                    }
                    document.body.appendChild(img);
                }
            };
            xhr.send();
        }
        //window.setInterval("getimg()",1000);

        function sendImg () {
            var xhr = new XMLHttpRequest();

            var formData = new FormData();
            formData.append("file",document.getElementById("file").files[0]);
            formData.append("destination","//Users/ibxz/Documents")
            xhr.open('POST','AjaxTestProcessServlet');
            xhr.onload=function(){

                document.getElementById("output").innerText=xhr.responseText;
            };
            xhr.send(formData);
        }



    </script>
</head>
<body>
<form enctype="multipart/form-data" method="post" id="myFormElement" name="fileinfo">
    <label>Your email address:</label>
    <input type="email" autocomplete="on" autofocus name="userid" placeholder="email" required size="32" maxlength="64" /><br />
    <label>Custom file label:</label>
    <input type="text" name="filelabel" size="12" maxlength="32" /><br />
    <label>File to stash:</label>
    <input type="file" name="file" id = "file" required />
</form>
<div id="output"></div>
<a href="javascript:sendImg()">Stash the file!</a>
</body>
</html>