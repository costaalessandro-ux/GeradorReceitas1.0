

function confirmaExclusao(id){
    let opcao = confirm("Deseja excluir essa Receita ?");
    if(opcao===true){
       window.location.href= "ReceitaServlet?opcao=Excluir&id=" + id;
    }  
}

function confirmaAlteracao(id){
    let opcao = confirm("Deseja alterar essa Receita ?");
    if(opcao===true){
       window.location.href= "ReceitaServlet?opcao=Alterar&id=" + id;
    }  
}

