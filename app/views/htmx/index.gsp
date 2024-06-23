<!doctype html>
<html>
<head>
    <title>Welcome to Htmx</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
    <asset:javascript src="htmx.js" />
</head>
<body>

    <h1>Welcome to Grace</h1>

    <p>
        Congratulations, you have successfully started your first Grace application! At the moment
        this is the default page, feel free to modify it to either redirect to a controller or display
        whatever content you may choose. Below is a list of controllers that are currently deployed in
        this application, click on each to execute its default action:
    </p>

    <div id="controllers" role="navigation">
        <h2>Available Controllers:</h2>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller">
                    <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                </li>
            </g:each>
        </ul>
    </div>

</body>
</html>
