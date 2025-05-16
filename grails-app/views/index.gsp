<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>BiblioApp - Home</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f6f9;
        margin: 0;
        padding: 0;
    }

    .welcome-section {
        max-width: 800px;
        margin: 80px auto 40px auto;
        padding: 40px;
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .welcome-section h1 {
        color: #2c3e50;
        font-size: 2.5rem;
        margin-bottom: 20px;
    }

    .welcome-section p {
        font-size: 1.2rem;
        color: #555;
    }

    .action-buttons {
        text-align: center;
        margin-top: 30px;
    }

    .action-button {
        background-color: #2559a7;
        color: white;
        font-size: 1.1rem;
        padding: 12px 30px;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .action-button:hover {
        background-color: #1c4280;
    }

    @media (max-width: 600px) {
        .welcome-section {
            padding: 20px;
            margin: 40px 20px;
        }

        .action-button {
            width: 100%;
            padding: 14px;
            font-size: 1rem;
        }
    }
    </style>
</head>
<body>

<div class="welcome-section">
    <h1><g:message code="home.heading" default="Bienvenue au service de Scolarité"/></h1>

    <p>
        <g:message code="home.paragraph" default="Nous sommes ravis de vous accueillir sur l'outil de la scolarité, une solution conçue pour simplifier la gestion des étudiants." /><br/>
        <g:message code="home.thanks" default="Merci de votre visite et bonne navigation sur notre site !" />
    </p>
<div class="action-buttons mt-4">
    <a href="${createLink(controller:'Etudiant', action:'index')}" class="action-button">
        <g:message code="home.button.label" default="Accéder à la gestion des étudiants"/>
    </a>
</div>
</div>

</body>
</html>
