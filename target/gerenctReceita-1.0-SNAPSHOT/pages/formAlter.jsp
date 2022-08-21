<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Receita"%>
<!DOCTYPE html>
<html>
    <head>
       <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="/styles/style.css" type="text/css"/>
    </head>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand">Gerador de Receitas</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="selectInfos.jsp">Lista de Receita</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gerador.html">Criar Receitas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>   
    </header>
    <body>
        <div class="container">
            <div class="text-center">
                <div class="mb-3">
                    <form action="ReceitaServlet" enctype="multipart/form-data" >
                        <input type="hidden" id="id" name="id" value="<%out.print(request.getAttribute("id"));%>"><p>
                            <label for="autor">Autor</label><p>
                        <input type="text" id="autor" name="autor" value="<%out.print(request.getAttribute("autor"));%>"><p>
                            <label for="data">Data</label><p>
                        <input type="date" id="data" name="data" value="<%out.print(request.getAttribute("data"));%>" ><p>
                            <label for="titulo">Titulo</label><p>
                        <input type="text" id="titulo" name="titulo" value="<%out.print(request.getAttribute("titulo"));%>"><p>
                            <label for="ingredientes">Ingredientes</label><p>
                            <textarea id="ingredientes" name="ingredientes" rows="8" cols="35" ><%out.print(request.getAttribute("ingredientes"));%></textarea><p>
                            <label for="modopreparo">Modo de Preparo</label><p>
                            <textarea id="modopreparo" name="modopreparo"  rows="8" cols="35"><%out.print(request.getAttribute("modopreparo"));%> </textarea><p>
                            <input type="submit" id="editar" name="opcao" value="Editar">
                            <input type="reset" id="cancelar" name="cancelar" value="Cancelar">
                    </form>
                    <p><a href="selectInfos"/> Lista de Receitas </a></p>
                    <p> <a href="index.html"/> Voltar </a></p>
                </div>
            </div>
        </div>
    </body>
</html>
