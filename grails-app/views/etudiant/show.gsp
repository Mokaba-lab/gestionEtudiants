<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'etudiant.label', default: 'Etudiant')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div id="content" role="main" class="py-4">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1><g:message code="default.show.label" args="[entityName]"/></h1>
            <div>
                <a class="btn btn-secondary" href="${createLink(uri: '/')}">
                    <i class="fas fa-home"></i> <g:message code="default.home.label"/>
                </a>
                <g:link class="btn btn-info" action="index">
                    <i class="fas fa-list"></i> <g:message code="default.list.label" args="[entityName]"/>
                </g:link>
                <g:link class="btn btn-success" action="create">
                    <i class="fas fa-plus"></i> <g:message code="default.new.label" args="[entityName]"/>
                </g:link>
            </div>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-success" role="status">${flash.message}</div>
        </g:if>

        <div class="card shadow-sm">
            <div class="card-body">
                <f:display bean="etudiant"/>
            </div>
        </div>

        <div class="mt-4 d-flex justify-content-between">
            <g:form resource="${this.etudiant}" method="DELETE" class="d-inline">
                <g:link class="btn btn-primary" action="edit" resource="${this.etudiant}">
                    <i class="fas fa-edit"></i> <g:message code="default.button.edit.label" default="Edit"/>
                </g:link>

                <g:link class="btn btn-warning" controller="etudiant" action="exportXml" id="${etudiant.id}">
                    <i class="fas fa-file-code"></i> <g:message code="default.button.export.label" default="Export XML"/>
                </g:link>

                <input class="btn btn-danger" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
