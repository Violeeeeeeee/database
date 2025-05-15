# Mechanic 

## Mechanic REQUIREMENTS (Must Have)

**1.1 Working with Repairs**
As a mechanic, I want to see the list of repairs assigned to me so I know what to work on.
As a mechanic, I want to see order details (car make, issue, owner, deadlines) so I can prepare for the job.
As a mechanic, I want to update the repair status (e.g., started/completed/unrepairable) so the system knows my progress.


**1.2 Spare Parts**
As a mechanic, I want to check the availability of parts before starting the job to avoid wasting time.
As a mechanic, I want to create a request for parts if they’re unavailable so they can be ordered.


**1.3 Communication**
As a mechanic, I want to add comments to a repair (e.g., “the issue is more complex,” “special tool needed”) so others are aware of the problems.


**1.4 Work Schedule**
As a mechanic, I want to see my schedule and daily assignments so I know when and what I’m working on.


## Mechanic NICE TO HAVE

**2.1 Specializations**
As a mechanic, I want to specify my skills/specializations (e.g., electrical, engine, transmission) so the system assigns me appropriate tasks.


**2.2 Days Off / Holidays**
As a mechanic, I want to mark my days off so I don’t get assigned work on those days.


**2.3 Salary**
As a mechanic, I want to see my payment/salary history so I know how much I’ve earned.


**2.4 Reassignment**
As a mechanic, I want to decline a repair task if I am unable to complete it for valid reasons.


## Mechanic Tables for Functionality Implementation

| Table               | Purpose                                                              |
| -- | -- |
| `mechanics`         | Mechanic data (name, specialization, contact, `service_center_id`)   |
| `mechanic_skills`   | Relation mechanic ↔ skills (many-to-many)                            |
| `repairs`           | Main repair table (car, description, status, client, mechanic, date) |
| `repair_logs`       | History of repair status changes and comments                        |
| `repair_parts`      | Parts needed for the repair (with quantity)                          |
| `parts`             | Parts catalog with availability info                                 |
| `part_requests`     | Requests for unavailable parts                                       |
| `mechanic_schedule` | Mechanic’s work plan (day, time, `repair_id`)                        |
| `holidays`          | General or personal days off                                         |
| `pay_rates`         | Types of payment (fixed, per job, hourly)                            |
| `mechanic_payments` | Earnings history (date, job, amount, bonuses)                        |



---




# Customer

## CustomerREQUIREMENTS (Must Have)

**1.1 Repair Booking**
As a customer, I want to register or log in to the system so I can access my data.
As a customer, I want to book a repair online so I don’t waste time calling or visiting the service center.
As a customer, I want to choose the date, service center, and type of issue so the system can prepare the order.

**1.2 My Vehicles**
As a customer, I want to add multiple cars to my profile so I can manage their maintenance.
As a customer, I want to see the service history of each vehicle so I know what was done and when.

**1.3 Communication & Status**
As a customer, I want to check the status of my car repair so I know when it will be ready.
As a customer, I want to receive notifications about progress or delays so I stay informed.

**1.4 Invoice & Payment**
As a customer, I want to receive a detailed invoice for the work and parts used so I understand what I’m paying for.
As a customer, I want to pay online or in person so I can choose a convenient method.


## Customer NICE TO HAVE

**2.1 Reviews**
As a customer, I want to leave a review about the service so others can see my experience.

**2.2 Offers**
As a customer, I want to receive offers or reminders about scheduled maintenance so I don’t miss important checkups.

**2.3 Rescheduling**
As a customer, I want to reschedule my repair appointment if my plans change.

**2.4 Choose a Mechanic**
As a customer, I want to select a specific mechanic if I’ve had a positive experience with them.


## Customer Tables for Client Functionality Implementation

| Table             | Purpose                                                                        |
| -- | -- |
| `customers`       | Customer profiles (full name, email, phone, password)                          |
| `vehicles`        | Customer vehicles (VIN, make, model, year, `customer_id`)                      |
| `repair_requests` | Repair requests (date, issue description, `vehicle_id`, preferred time/center) |
| `repairs`         | Actual repairs generated from `repair_requests`                                |
| `repair_logs`     | Repair statuses and notes                                                      |
| `invoices`        | Customer invoices (details, amounts, date, payment method)                     |
| `payments`        | Payment information (`in_progress` / `paid` / `failed`)                        |
| `notifications`   | Push/email/SMS notifications for customers                                     |
| `reviews`         | Customer reviews (rating, text, date, `repair_id`)                             |
| `offers`          | Promotional offers and discounts                                               |
| `appointments`    | Scheduled repairs (time, customer, mechanic, vehicle)                          |

---



# Administrator

## Administrator REQUIREMENTS (Must Have)

**1.1 Customer Management**
As an administrator, I want to add a new customer and their vehicle to the system so I can register a repair request.
As an administrator, I want to view the customer’s visit history to provide better service.
As an administrator, I want to create a new service request to pass it on to a manager or mechanic.


**1.2 Billing**
As an administrator, I want to generate an invoice for the customer so payment can be processed.
As an administrator, I want to view payment statuses to track who has paid and who hasn't.


**1.3 Calls and Reminders**
As an administrator, I want to see a list of upcoming appointments so I can call or remind customers.
As an administrator, I want to mark a customer as arrived to notify the mechanic.


**1.4 Staff Interaction**
As an administrator, I want to see a list of staff currently present to know who is available.


## Administrator NICE TO HAVE

**2.1 Customer Database**
As an administrator, I want to see a customer’s full service history (including all vehicles) to offer discounts or loyalty benefits.


**2.2 Tickets and Comments**
As an administrator, I want to leave comments on each repair to keep internal notes.


**2.3 Time Optimization**
As an administrator, I want automatic time slot suggestions to schedule customers more efficiently.


## Administrator Tables Supporting Administrator Functions

| Table               | Purpose                                            |
| -- | -- |
| `customers`         | Customer information                               |
| `vehicles`          | Vehicle data                                       |
| `repair_requests`   | Repair requests                                    |
| `repairs`           | Details of active/completed repairs                |
| `invoices`          | Generated invoices                                 |
| `payments`          | Payment statuses                                   |
| `appointments`      | Appointments for repairs or inspections            |
| `employee_presence` | Presence status of employees in the service center |
| `notes`             | Comments on repairs or customers                   |
| `notifications`     | Notification system                                |
| `service_history`   | Customer service history                           |

---



# Manager

## Manager REQUIREMENTS (Must Have)

**1.1 Personnel Management**
As a manager, I want to add, update, or deactivate mechanic and staff accounts so I can manage the team.
As a manager, I want to check the availability of free mechanics so I can assign tasks efficiently.


**1.2 Order Assignment**
As a manager, I want to view new repair requests so I can assign them to the appropriate mechanics.
As a manager, I want to see the service calendar or schedule to avoid overbooking.


**1.3 Parts Control**
As a manager, I want to check the stock availability of parts so I know whether a repair can be done.
As a manager, I want to place orders for parts if they are out of stock.


**1.4 Reporting**
As a manager, I want to view statistics on completed work, payments, and workload so I can evaluate performance.
As a manager, I want to generate financial reports to report to the owner or accounting department.


**1.5 Customer Interaction**
As a manager, I want to see all active repairs so I can respond to customer inquiries.
As a manager, I want to manually update repair statuses if necessary.


## Manager NICE TO HAVE

**2.1 Holiday Management**
As a manager, I want to define holidays or days off so the service schedule takes them into account.


**2.2 Automated Notifications**
As a manager, I want to configure automated alerts (e.g., delays or missing parts).


**2.3 Price Management**
As a manager, I want to set or update prices for standard services so staff see up-to-date rates.


**2.4 Multi-Branch Management**
As a manager, I want to manage multiple service centers so I can balance workload and resources across them.


## Manager Tables for Manager Functionality Implementation

| Table                | Purpose                                        |
| -- | -- |
| `employees`          | All staff members: mechanics, managers, admins |
| `roles`              | Employee roles (mechanic, manager, etc.)       |
| `employee_schedule`  | Work schedule of employees                     |
| `repair_requests`    | New repair requests                            |
| `repairs`            | Active and completed repairs                   |
| `repair_assignments` | Assignment of mechanics to repairs             |
| `parts`              | Parts (name, quantity, price)                  |
| `part_orders`        | Orders for parts                               |
| `branches`           | Service centers                                |
| `branch_schedule`    | Working hours and holidays of each branch      |
| `reports`            | Aggregated data for reports                    |
| `pricing`            | Prices for standard services                   |
| `notifications`      | Notifications for customers and employees      |

