<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="login.title" default="Connexion"/></title>
    <style>
    .login-container {
        max-width: 400px;
        margin: 5rem auto;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        background-color: #fff;
    }
    .login-container h2 {
        text-align: center;
        margin-bottom: 1rem;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    input[type=text], input[type=password] {
        width: 100%;
        padding: 10px;
        border-radius: 8px;
        border: 1px solid #ccc;
    }
    .btn {
        width: 100%;
        padding: 10px;
        background-color: #3b82f6;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
    }
    .btn:hover {
        background-color: #2563eb;
    }
    </style>
</head>
<body>
<div class="login-container">
    <h2><g:message code="login.title" default="Connexion"/></h2>

    <g:if test='${flash.message}'>
        <div class="alert alert-danger">
            <g:message code="login.flash" default="${flash.message}"/>
        </div>
    </g:if>

    <g:form controller="login" action="auth">
        <div class="form-group">
            <label><g:message code="login.username" default="Nom d'utilisateur"/></label>
            <input type="text" name="username" autofocus required/>
        </div>
        <div class="form-group">
            <label><g:message code="login.password" default="Mot de passe"/></label>
            <input type="password" name="password" required/>
        </div>
        <button class="btn" type="submit">
            <g:message code="login.submit" default="Se connecter"/>
        </button>
    </g:form>
</div>
</body>
</html>
