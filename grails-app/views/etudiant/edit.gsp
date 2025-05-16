<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'etudiant.label', default: 'Étudiant')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div id="content" role="main">
    <div class="container mt-5">
        <nav class="mb-4">
            <a href="${createLink(uri: '/')}"
               class="btn btn-outline-primary me-2">
                <g:message code="default.home.label"/>
            </a>
            <g:link class="btn btn-outline-secondary me-2" action="index">
                <g:message code="default.list.label" args="[entityName]"/>
            </g:link>
            <g:link class="btn btn-outline-success" action="create">
                <g:message code="default.new.label" args="[entityName]"/>
            </g:link>
        </nav>

        <!-- Edit Section -->
        <div id="edit-etudiant" class="card shadow-sm">
            <div class="card-body">
                <h2 class="card-title mb-4">
                    <g:message code="default.edit.label" args="[entityName]"/>
                </h2>

                <g:if test="${flash.message}">
                    <div class="alert alert-info" role="alert">${flash.message}</div>
                </g:if>

                <g:hasErrors bean="${this.etudiant}">
                    <div class="alert alert-danger" role="alert">
                        <ul class="mb-0">
                            <g:eachError bean="${this.etudiant}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">
                                    data-field-id="${error.field}"</g:if>>
                                    <g:message error="${error}"/>
                                </li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>

                <g:form resource="${this.etudiant}" method="PUT">
                    <g:hiddenField name="version" value="${this.etudiant?.version}"/>

                    <fieldset class="form mb-4">
                        <f:all bean="etudiant"/>
                    </fieldset>

                    <div class="d-flex justify-content-between">
                        <input type="submit" class="btn btn-primary"
                               value="${message(code: 'default.button.update.label', default: 'Mettre à jour')}"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
