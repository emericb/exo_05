package org.demo.exo_05.servlet;

import org.demo.exo_05.entity.Patient;
import org.demo.exo_05.util.JPAUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.persistence.EntityManager;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "createPatientServlet", value = "/create-patient")
@MultipartConfig
public class CreatePatientServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/createPatient.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateDeNaissanceStr = request.getParameter("dateDeNaissance");
        Part photoPart = request.getPart("photo");

        String fileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        String filePath = uploadPath + File.separator + fileName;
        photoPart.write(filePath);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateDeNaissance = null;
        try {
            dateDeNaissance = dateFormat.parse(dateDeNaissanceStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Patient patient = new Patient();
        patient.setNom(nom);
        patient.setPrenom(prenom);
        patient.setDateDeNaissance(dateDeNaissance);
        patient.setPhoto(filePath);

        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(patient);
        em.getTransaction().commit();
        em.close();
    }
}