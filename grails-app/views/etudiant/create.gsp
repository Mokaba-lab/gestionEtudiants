<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'etudiant.label', default: 'Étudiant')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <style>
    .form-container {
        max-width: 600px;
        margin: auto;
    }
    .form-icon {
        width: 1.5rem;
        height: 1.5rem;
        margin-right: 0.5rem;
    }
    </style>
</head>
<body>
<div id="content" role="main">
    <div class="container mt-5">
        <div class="form-container">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white text-center rounded-top-4">
                    <h3 class="mb-0">
                        <g:message code="default.create.label" args="[entityName]" />
                    </h3>
                </div>
                <div class="card-body p-4">

                    <g:if test="${flash.message}">
                        <div class="alert alert-success text-center">${flash.message}</div>
                    </g:if>

                    <g:hasErrors bean="${this.etudiant}">
                        <div class="alert alert-danger">
                            <ul class="mb-0">
                                <g:eachError bean="${this.etudiant}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                        <g:message error="${error}" />
                                    </li>
                                </g:eachError>
                            </ul>
                        </div>
                    </g:hasErrors>

                    <g:form action="save" resource="${this.etudiant}" method="POST" enctype="multipart/form-data">
                        <f:all bean="etudiant" />
                        <div class="d-flex justify-content-between mt-4">
                            <g:submitButton name="create" class="btn btn-success w-50 me-2" value="Créer" />

                        </div>
                    </g:form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
