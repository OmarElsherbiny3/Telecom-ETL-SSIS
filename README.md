# Telecom ETL Project – SSIS

## Overview
This project demonstrates a real-world ETL solution for a telecom company using
SQL Server Integration Services (SSIS).

The source system generates a CSV file every 5 minutes containing customer
transaction records. The ETL process validates, transforms, and loads the data
into a SQL Server database while handling rejected records separately.

---

## Source Data
- Source Type: CSV file
- Frequency: Every 5 minutes
- Content: Customer network transactions

### CSV Columns
| Column Name | Description |
|------------|-------------|
| ID | Transaction identifier |
| IMSI | Subscriber identifier |
| IMEI | Device identifier |
| CELL | Cell ID |
| LAC | Location Area Code |
| EVENT_TYPE | Event type |
| EVENT_TS | Event timestamp |

---

## ETL Business Rules

### Data Validation & Transformation
- Reject records if **IMSI, CELL, or LAC** is NULL
- Validate **EVENT_TS** format (must be valid datetime)
- Join IMSI with reference table to get `subscriber_id`
  - Use `-99999` if not found
- IMEI processing:
  - Extract first 8 digits → `TAC`
  - Extract last 6 digits → `SNR`
  - If IMEI is NULL or invalid length, use `-99999`

### Rejected Records
- Invalid records are stored in a separate table
- Original CSV file name is logged for traceability

---

## Target Database Design
- Main fact table for valid transactions
- Rejected records table for data quality tracking

---

## File Handling
- After successful load, the processed CSV file is moved to an archive folder

---

## Tools & Technologies
- SQL Server Integration Services (SSIS)
- SQL Server
- Visual Studio
- T-SQL

---

## Project Structure

