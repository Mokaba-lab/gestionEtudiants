<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="favicon.ico" type="image/x-icon"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary py-3 shadow-sm">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <a class="navbar-brand d-flex align-items-center" href="${createLink(uri: '/')}">
            <asset:image class="rounded-circle" src="UKAG.png" height="60" alt="UKAG Logo" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <g:pageProperty name="page.nav"/>
            </ul>
            <div class="d-flex">
                <a href="${request.forwardURI}?lang=fr" class="btn btn-outline-secondary mr-2">🇫🇷 <g:message code="lang.fr" default="Français"/></a>
                <a href="${request.forwardURI}?lang=en" class="btn btn-outline-secondary">🇬🇧<g:message code="lang.en" default="English"/></a>
            </div>
        </div>
    </div>
</nav>
<main class="container my-4">
    <g:layoutBody/>
</main>
<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Chargement..."/>
</div>
<asset:javascript src="application.js"/>
</body>
</html>
