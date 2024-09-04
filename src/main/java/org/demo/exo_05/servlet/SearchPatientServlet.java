package org.demo.exo_05.servlet;

import org.demo.exo_05.entity.Patient;
import org.demo.exo_05.repository.PatientRepository;
import org.demo.exo_05.util.JPAUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchPatientServlet", value = "/search-patient")
public class SearchPatientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        List<Patient> patients = PatientRepository.findAll(em);
        em.close();

        request.setAttribute("patients", patients);
        request.getRequestDispatcher("/searchPatient.jsp").forward(request, response);
    }
}