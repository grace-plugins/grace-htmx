<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grace</title>
</head>
<body>

<div class="svg" role="presentation">
    <div class="grace-logo-container">
        <asset:image src="grace-launch.svg" class="grace-logo"/>
    </div>
</div>

<div id="content" role="main">
    <div class="container">
        <section class="row">
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
        </section>
    </div>
</div>

</body>
</html>
