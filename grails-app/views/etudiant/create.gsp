<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'etudiant.label', default: 'Étudiant')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <style>
    .form-container {
        max-width: 700px;
        margin: auto;
    }
    .form-icon {
        width: 1.5rem;
        height: 1.5rem;
        margin-right: 0.5rem;
    }
    .language-selector {
        position: absolute;
        top: 20px;
        right: 30px;
    }
    </style>
    <script>
        function fillFormFromXML(xmlText) {
            const parser = new DOMParser();
            const xml = parser.parseFromString(xmlText, 'text/xml');

            document.getElementById('nom').value = xml.getElementsByTagName('nom')[0]?.textContent || '';
            document.getElementById('prenom').value = xml.getElementsByTagName('prenom')[0]?.textContent || '';
            document.getElementById('email').value = xml.getElementsByTagName('email')[0]?.textContent || '';
            document.getElementById('dateNaissance').value = xml.getElementsByTagName('dateNaissance')[0]?.textContent || '';
        }

        function handleXMLImport(event) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function(e) {
                fillFormFromXML(e.target.result);
            }
            reader.readAsText(file);
        }
    </script>
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

                <!-- Formulaire de création avec champs remplissables -->
                    <g:form action="save" resource="${this.etudiant}" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="nom"><g:message code="label.nom" /></label>
                            <input type="text" id="nom" name="nom" class="form-control" required />
                        </div>
                        <div class="mb-3">
                            <label for="prenom"><g:message code="label.prenom" /></label>
                            <input type="text" id="prenom" name="prenom" class="form-control" required />
                        </div>
                        <div class="mb-3">
                            <label for="email"><g:message code="label.email" /></label>
                            <input type="email" id="email" name="email" class="form-control" required />
                        </div>
                        <div class="mb-3">
                            <label for="dateNaissance"><g:message code="label.dateNaissance" /></label>
                            <input type="number" id="dateNaissance" name="dateNaissance" class="form-control" min="16" max="99" required />
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <g:submitButton name="create" class="btn btn-success w-50 me-2" value="${message(code:'button.create')}" />
                        </div>
                    </g:form>

                    <hr class="my-4" />

                    <!-- Import XML -->
                    <div class="text-center mb-3">
                        <h5 class="text-secondary"><g:message code="label.import.title" /></h5>
                    </div>
                    <div class="mb-3">
                        <input type="file" accept=".xml" class="form-control" onchange="handleXMLImport(event)" />
                    </div>
                    <div class="alert alert-info text-center">
                        <g:message code="label.import.note" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
