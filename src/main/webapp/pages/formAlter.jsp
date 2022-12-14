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
       <link rel="stylesheet" href="../assets/style/style.css" type="text/css"/>
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
                            <a class="nav-link" href="selectInfos">Lista de Receita</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="pages/gerador.html">Criar Receitas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>   
    </header>
    <body>                
            <div class="container color-black">
            <div class="card w-100 my-5">
                <div class="card-body">
                    <h1 class="card-title text-center"> Gerador de Receitas </h1>
                    <form action="ReceitaServlet" method="post">
                        <div class="row my-4">
                            <div class="col-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInput" name="titulo" value="<%out.print(request.getAttribute("titulo"));%>">
                                    <label for="floatingInput">Titulo da Receita</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-floating">
                                    <input type="date" class="form-control" id="floatingInput" name="data" value="<%out.print(request.getAttribute("data"));%>">
                                    <label  for="floatingInput">Data de Cria????o</label>
                                </div>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInput" name="autor" value="<%out.print(request.getAttribute("autor"));%>">
                                    <label for="floatingInput">Nome do Autor</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-floating">
                                    <textarea class="form-control" id="floatingInput" name="ingredientes" rows="3" ><%out.print(request.getAttribute("ingredientes"));%></textarea>
                                    <label for="floatingInput">Ingredientes</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <textarea class="form-control" id="floatingInput" name="modopreparo" rows="3"><%out.print(request.getAttribute("modopreparo"));%> </textarea>
                                <label for="floatingInput">Modo de Preparo</label>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="form-group col-12 mt-4 text-center">
                                <input type="reset" id="cancelar" name="opcao" value="Cancelar" class="btn btn-danger">
                                <input type="submit" id="adicionar" name="opcao" value="Adicionar" class="btn btn-primary" >
                            </div> 
                        </div>
                    </form>
                </div> 
            </div>
        </div>
    </body>
</html>

