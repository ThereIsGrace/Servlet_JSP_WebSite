<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include summernote css/js-->
<link href="summernote.css">
<script src="summernote.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<textarea class="summernote" name="editordata"></textarea>
</div>
<script>
$('.summernote').summernote({
	  height: 150,   //set editable area's height
	  codemirror: { // codemirror options
	    theme: 'monokai'
	  }
	});
</script>

</body>
</html>