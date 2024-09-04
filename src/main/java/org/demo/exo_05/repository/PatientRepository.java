package org.demo.exo_05.repository;

import org.demo.exo_05.entity.Patient;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class PatientRepository {

    public static List<Patient> findAll(EntityManager em) {
        TypedQuery<Patient> query = em.createQuery("SELECT p FROM Patient p", Patient.class);
        return query.getResultList();
    }
}