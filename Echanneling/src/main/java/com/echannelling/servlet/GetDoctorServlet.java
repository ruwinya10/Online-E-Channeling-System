/**
 * Note this servlet is responsible for retrieving doctor details along with their availability information.
 */

package com.echannelling.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.model.Doctor;
import com.echannelling.model.Availability;
import com.echannelling.service.DoctorDAO;
import com.echannelling.service.AvailabilityDAO;

@WebServlet("/GetDoctorServlet")
public class GetDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = request.getParameter("view");
        
        // If the view is "profiles", apply filtering logic
        if ("profiles".equals(view)) {
            // Fetch all doctors from the DAO
            List<Doctor> alldctrs = DoctorDAO.getAllBook();
            Map<Integer, List<Availability>> doctorAvailabilities = new HashMap<>();

            // Get filtering parameters from request
            String name = request.getParameter("name");
            String specialization = request.getParameter("specialization");
            String hospital = request.getParameter("hospital");
            String date = request.getParameter("date"); // Format: yyyy-MM-ddTHH:mm

            // Check if any filter is applied
            boolean isFilterApplied = (name != null && !name.isEmpty()) ||
                                     (specialization != null && !specialization.isEmpty()) ||
                                     (hospital != null && !hospital.isEmpty()) ||
                                     (date != null && !date.isEmpty());

            // Apply filtering
            Iterator<Doctor> iterator = alldctrs.iterator();
            while (iterator.hasNext()) {
                Doctor doctor = iterator.next();

                boolean match = true;

                // Filter by doctor name
                if (name != null && !name.isEmpty() && !doctor.getFull_name().toLowerCase().contains(name.toLowerCase())) {
                    match = false;
                }

                // Filter by specialization
                if (specialization != null && !specialization.isEmpty() && !doctor.getSpecialization().equalsIgnoreCase(specialization)) {
                    match = false;
                }

                // Get availabilities for this doctor
                List<Availability> availabilities = AvailabilityDAO.getByDoctorId(String.valueOf(doctor.getDoctor_id()));

                // Filter by hospital
                if (hospital != null && !hospital.isEmpty()) {
                    boolean hospitalMatch = availabilities.stream()
                            .anyMatch(av -> av.getHospital_name().equalsIgnoreCase(hospital));
                    if (!hospitalMatch) match = false;
                }

                // Filter by date (day of week)
                if (date != null && !date.isEmpty()) {
                    try {
                        LocalDateTime dateTime = LocalDateTime.parse(date);
                        String dayOfWeek = dateTime.getDayOfWeek().name(); // e.g., MONDAY
                        boolean dateMatch = availabilities.stream()
                                .anyMatch(av -> av.getDay().equalsIgnoreCase(dayOfWeek));
                        if (!dateMatch) match = false;
                    } catch (DateTimeParseException e) {
                        System.out.println("Invalid date format: " + date);
                        match = false;
                    }
                }

                // If match passes all filters, keep doctor and save availability
                if (match) {
                    doctorAvailabilities.put(doctor.getDoctor_id(), availabilities);
                } else {
                    iterator.remove(); // Remove doctor not matching filter
                }
            }

            // Set attributes to be accessed in JSP
            request.setAttribute("alldctrs", alldctrs);
            request.setAttribute("doctorAvailabilities", doctorAvailabilities);

            // Forward request to DoctorProfiles.jsp for display
            request.getRequestDispatcher("DoctorProfiles.jsp").forward(request, response);
        } else {
        	// Default view: load all doctors with availability for DoctorDetails.jsp
            List<Doctor> alldctrs = DoctorDAO.getAllBook();
            Map<Integer, List<Availability>> doctorAvailabilities = new HashMap<>();

            // Populate availability map for each doctor
            for (Doctor doctor : alldctrs) {
                List<Availability> availabilities = AvailabilityDAO.getByDoctorId(String.valueOf(doctor.getDoctor_id()));
                doctorAvailabilities.put(doctor.getDoctor_id(), availabilities);
            }

            // Set attributes
            request.setAttribute("alldctrs", alldctrs);
            request.setAttribute("doctorAvailabilities", doctorAvailabilities);

            // Forward to DoctorDetails.jsp
            request.getRequestDispatcher("DoctorDetails.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle form submission from AddDoctor.jsp
        // Note: This assumes AddDoctorServlet logic is merged here for simplicity
        // You may need to add the actual doctor and availability saving logic here
        // For now, redirect to GetDoctorServlet to show DoctorDetails.jsp
        response.sendRedirect("GetDoctorServlet");
    }
}