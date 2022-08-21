package controller;

import dao.ReceitaDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Receita;

public class ReceitaServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String opcao = request.getParameter("opcao");
        if (opcao.equals("Adicionar")) {
            String autor, data, titulo, ingredientes, modopreparo;
            autor = request.getParameter("autor");
            data = request.getParameter("data");
            titulo = request.getParameter("titulo");
            ingredientes = request.getParameter("ingredientes");
            modopreparo = request.getParameter("modopreparo");
            //imagem = request(imagem);
            Receita receita = new Receita(autor, data, titulo, ingredientes, modopreparo);
            ReceitaDao dao = new ReceitaDao();
            dao.inserir(receita);
            try ( PrintWriter out = response.getWriter()) {

                out.println("Cadastro realizado com sucesso");
                out.println("<a href='selectInfos'> Voltar </a>");
            }
        }
        
        else if(opcao.equals("Alterar")){
        int id = parseInt(request.getParameter("id"));
        Receita receita = new Receita();
        ReceitaDao dao = new ReceitaDao();
        receita.setId(id);
        dao.alterSelect(receita);

        request.setAttribute("id", receita.getId());
        request.setAttribute("autor", receita.getAutor());
        request.setAttribute("data", receita.getData());
        request.setAttribute("titulo", receita.getTitulo());
        request.setAttribute("ingredientes", receita.getIngredientes());
        request.setAttribute("modopreparo", receita.getModopreparo());
        RequestDispatcher rd = request.getRequestDispatcher("pages/formAlter.jsp");
        rd.forward(request, response);
        } 
        
        else if(opcao.equals("Editar")){
        Receita receita = new Receita();
        ReceitaDao dao = new ReceitaDao();
        receita.setId(parseInt(request.getParameter("id")));
        receita.setAutor(request.getParameter("autor"));
        receita.setData(request.getParameter("data"));
        receita.setTitulo(request.getParameter("titulo"));
        receita.setIngredientes(request.getParameter("ingredientes"));
        receita.setModopreparo(request.getParameter("modopreparo"));
        dao.alter(receita);
        try ( PrintWriter out = response.getWriter()) {

                out.println("Alteração realizada com sucesso");
                out.println("<a href='selectInfos'> Voltar </a>");
            }   
        }
        
        else if(opcao.equals("Excluir")){
        int id;
        id = parseInt(request.getParameter("id"));
        Receita receita = new Receita(id);
        ReceitaDao dao = new ReceitaDao();
        dao.delete(receita);
        try ( PrintWriter out = response.getWriter()) {
            out.println("Exclusão realizada com sucesso.");
             out.println("<a href='selectInfos'> Voltar </a>");
        }      
        }
    }
    
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReceitaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReceitaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReceitaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReceitaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
