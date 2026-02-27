# -----------------------------
# Create Clinics
# -----------------------------
clinics = Clinic.create!([
  { name: "Downtown Health Center", subdomain: "downtown" },
  { name: "Uptown Clinic", subdomain: "uptown" }
])

# -----------------------------
# Create Doctors
# -----------------------------
doctors = []
doctors << Doctor.create!(name: "Dr. Alice Smith", specialization: "Cardiology", clinic: clinics[0])
doctors << Doctor.create!(name: "Dr. Bob Johnson", specialization: "Dermatology", clinic: clinics[0])
doctors << Doctor.create!(name: "Dr. Carol Lee", specialization: "Pediatrics", clinic: clinics[1])
doctors << Doctor.create!(name: "Dr. David Kim", specialization: "Orthopedics", clinic: clinics[1])

# -----------------------------
# Create Patients
# -----------------------------
patients = []
patients << Patient.create!(name: "John Doe", email: "john@example.com", phone: "555-0101", date_of_birth: "1985-05-15", clinic: clinics[0])
patients << Patient.create!(name: "Jane Roe", email: "jane@example.com", phone: "555-0102", date_of_birth: "1990-07-20", clinic: clinics[0])
patients << Patient.create!(name: "Sam Green", email: "sam@example.com", phone: "555-0201", date_of_birth: "2000-01-10", clinic: clinics[1])
patients << Patient.create!(name: "Lisa Brown", email: "lisa@example.com", phone: "555-0202", date_of_birth: "1995-03-25", clinic: clinics[1])

# -----------------------------
# Create Appointments
# -----------------------------
appointments = []
appointments << Appointment.create!(clinic: clinics[0], doctor: doctors[0], patient: patients[0], scheduled_at: 2.days.from_now, status: 0, notes: "Routine check-up")
appointments << Appointment.create!(clinic: clinics[0], doctor: doctors[1], patient: patients[1], scheduled_at: 3.days.from_now, status: 0, notes: "Skin rash consultation")
appointments << Appointment.create!(clinic: clinics[1], doctor: doctors[2], patient: patients[2], scheduled_at: 1.week.from_now, status: 0, notes: "Vaccination")
appointments << Appointment.create!(clinic: clinics[1], doctor: doctors[3], patient: patients[3], scheduled_at: 4.days.from_now, status: 0, notes: "Knee pain evaluation")

# -----------------------------
# Create Payments
# -----------------------------
Payment.create!(appointment: appointments[0], amount: 150.00, payment_method: "Credit Card", status: 1, paid_at: Time.now)
Payment.create!(appointment: appointments[1], amount: 200.00, payment_method: "Cash", status: 0)
Payment.create!(appointment: appointments[2], amount: 100.00, payment_method: "Insurance", status: 1, paid_at: Time.now)
Payment.create!(appointment: appointments[3], amount: 250.00, payment_method: "Credit Card", status: 0)

# -----------------------------
# Create Reminders
# -----------------------------
Reminder.create!(appointment: appointments[0], reminder_type: 0, status: 1, sent_at: 1.day.from_now)
Reminder.create!(appointment: appointments[1], reminder_type: 1, status: 0)
Reminder.create!(appointment: appointments[2], reminder_type: 0, status: 0)
Reminder.create!(appointment: appointments[3], reminder_type: 1, status: 0)

# -----------------------------
# Create Users
# -----------------------------
User.create!(clinic: clinics[0], name: "Admin Downtown", email: "admin@downtown.com", password: "password")
User.create!(clinic: clinics[1], name: "Admin Uptown", email: "admin@uptown.com", password: "password")

puts "✅ Seed data created successfully!"