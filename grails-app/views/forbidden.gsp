<!doctype html>
<html>
    <head>
        <title>Forbidden</title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <ul class="errors">
            <li>Error: Forbidden (403)</li>
            <li>Path: ${request.forwardURI}</li>
            <li>${request.getAttribute('javax.servlet.error.message')}</li>
        </ul>
    </body>
</html>
