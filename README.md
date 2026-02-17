🏥 ClinicOps — Multi-Tenant Clinic Operations SaaS

ClinicOps is a lightweight multi-tenant SaaS platform built for small private clinics (1–5 doctors).

⚠️ This is NOT a full EMR.
✅ This is a focused clinic operations system designed to be simple, sticky, and production-ready.

Target Audience: Small private clinics
Architecture: Multi-tenant SaaS (Clinic-scoped data isolation)

🚀 Core Features
1️⃣ Appointment Scheduling

Create, edit, and delete appointments

Status tracking: scheduled, completed, cancelled, no_show

Linked to Doctor & Patient

Future-date validation

Indexed for performance

2️⃣ Doctor Management

Doctor profiles

Specialization tracking

Clinic-scoped data isolation

3️⃣ Patient Management

Unique phone constraint (scoped per clinic)

Email & DOB support

Linked to appointments

Prevent deletion if appointments exist

4️⃣ Payment Tracking

Nested under appointments

Status tracking: pending, paid, failed, refunded

Revenue aggregation

Indexed for reporting

5️⃣ Follow-Up Reminders

Types: sms, email, call

Status tracking: pending, sent, failed

Nested under appointments

6️⃣ Analytics Dashboard

Total appointments

Upcoming appointments

Completed appointments

Total revenue (paid only)

Pending payments

Pending reminders

Implemented using the Service Object pattern.

🏗 Architecture Overview
🧱 Application Design Principles

Clean MVC architecture

Thin controllers (business logic extracted to services)

Service objects for business logic

RESTful resource routing

Strong parameters enforced

DB-level constraints for safety

Proper indexing for scalability

Full Minitest coverage

Production-ready configuration

🗂 Domain Structure
Clinic
├── Users
├── Doctors
├── Patients
├── Appointments
│   ├── Payments
│   └── Reminders

🔐 Multi-Tenancy Strategy

Clinic model acts as tenant

Every primary model belongs_to :clinic

All queries scoped to current_clinic

Database-level foreign keys enforce tenant isolation

Unique indexes scoped by clinic_id

Zero cross-clinic data leakage

No shared global data between tenants

🛠 Tech Stack

Ruby on Rails (latest stable)

PostgreSQL

Bootstrap 5

Minitest

bcrypt (has_secure_password)

Rack::Timeout

⚙️ Setup Instructions
1️⃣ Clone Repository
git clone https://github.com/rounakpatidar18/clinicflow.git
cd clinic_ops

2️⃣ Install Dependencies
bundle install

3️⃣ Setup Database

Ensure PostgreSQL is running.

rails db:create
rails db:migrate
rails db:seed

4️⃣ Run Server
rails server

🌐 Access Application

Open your browser:

http://localhost:3000
