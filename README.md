🏥 ClinicOps — Multi-Tenant Clinic Operations SaaS

ClinicOps is a lightweight SaaS platform built for small private clinics (1–5 doctors).

This is NOT a full EMR.
This is a focused clinic operations system designed to be simple, sticky, and production-ready.

Target Pricing: $99/month
Target Audience: Small private clinics
Architecture: Multi-tenant SaaS

🚀 Core Features
1️⃣ Appointment Scheduling

Create, edit, delete appointments

Status tracking (scheduled, completed, cancelled, no_show)

Linked to Doctor & Patient

Future-date validation

Indexed for performance

2️⃣ Doctor Management

Doctor profiles

Specialization tracking

Clinic-scoped data isolation

3️⃣ Patient Management

Unique phone constraint (clinic-scoped)

Email & DOB support

Linked to appointments

Prevent deletion if appointments exist

4️⃣ Payment Tracking

Nested under appointments

Status tracking (pending, paid, failed, refunded)

Revenue aggregation

Indexed for reporting

5️⃣ Follow-Up Reminders

Types: sms, email, call

Status tracking (pending, sent, failed)

Nested under appointments

6️⃣ Analytics Dashboard

Total appointments

Upcoming appointments

Completed appointments

Total revenue (paid only)

Pending payments

Pending reminders

Implemented via Service Object pattern

7️⃣ Multi-Tenant SaaS Architecture

Clinic model acts as tenant

User authentication with has_secure_password

Clinic-level data isolation

Foreign key constraints enforce integrity

Zero cross-clinic data leakage

🏗 Architecture Overview
🧱 Application Design Principles

Clean MVC architecture

Thin controllers (logic extracted to services)

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

Every primary model belongs_to Clinic

All queries are scoped to current_clinic

DB-level foreign keys enforce tenant isolation

Unique indexes scoped by clinic_id

No shared global data between tenants

🛠 Tech Stack

Ruby on Rails (latest stable)

PostgreSQL

Bootstrap 5

Minitest

bcrypt

Rack::Timeout

⚙️ Setup Instructions
1️⃣ Clone Repository
git clone rounakpatidar18/clinicflow
cd clinic_ops

2️⃣ Install Dependencies also Install Node Dependencies
rails assets:precompile
bundle install

3️⃣ Setup Database

Ensure PostgreSQL is running.

rails db:create
rails db:migrate
rails db:seed

4️⃣ Run Server
rails s

🌐 Access Application

Open your browser:

http://localhost:3000
