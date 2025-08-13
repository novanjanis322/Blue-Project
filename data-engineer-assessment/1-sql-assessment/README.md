# Section 1: SQL Assessment

## Overview

This section implements a comprehensive retail analytics solution using PostgreSQL with a properly normalized database schema. The solution includes inventory management, sales tracking, and staff performance analytics with realistic mock data and optimized queries.

## Database Architecture

### Schema Design
- **6 interconnected tables** with proper foreign key relationships
- **Normalized structure** to eliminate data redundancy
- **Comprehensive data types** including VARCHAR, DECIMAL, DATE, TIMESTAMP, BOOLEAN
- **Business logic constraints** for data integrity

### Tables Structure
1. **branch_details**: Store branch information and operational data
2. **staff_records**: Employee management with performance tracking  
3. **product_hierarchy**: Product catalog with category hierarchies
4. **inventory_movements**: Daily stock movements with transaction types
5. **sales_transactions**: Sales transaction headers with customer data
6. **sales_line_items**: Detailed line items for each transaction

## Implementation Details

### Mock Data Generation
- **12+ records per table** as required
- **Realistic Indonesian retail data** including:
  - Indonesian product names (Indomie, Chitato, Aqua, etc.)
  - Indonesian locations (Jakarta, Bandung, Surabaya, etc.)
  - Proper date ranges and business relationships
- **Transaction types**: IN, OUT, ADJ (adjustment), RTN (return), EXP (expired)

### SQL Queries Implemented

#### Basic Queries

**1. Inventory Turnover Metrics**
- Calculates stock movements per branch for last 3 months
- Includes incoming stock, outgoing stock, current levels, and expired items
- Features advanced stock turnover rate calculation
- **Key Result**: Bandung West Branch has highest turnover (1.20)

**2. Staff Performance Analysis** 
- Analyzes active staff sales performance in 2023
- Combines staff data with transaction metrics
- Calculates transaction counts, total sales, and average values
- **Key Result**: STF002 leads with 904,500 total sales across 5 transactions

#### Intermediate Queries

**3. Customer Purchase Patterns**
- Identifies frequently bought product combinations
- Uses self-join technique on sales line items
- Filters for minimum 2+ co-occurrences
- **Key Result**: Strong correlation between noodle products and beverages

### Setup Instructions

1. **Start Database Services**
   ```bash
   docker-compose up -d
   ```

2. **Access PgAdmin**
   - URL: http://localhost:8080
   - Email: admin@admin.com
   - Password: admin123

3. **Create Database Connection**
   - Host: postgres (container name)
   - Port: 5432
   - Database: retail_data
   - Username: admin
   - Password: admin123

4. **Execute Scripts**
   ```sql
   -- 1. Create tables
   \i queries/table_schema.sql
   
   -- 2. Insert mock data  
   \i queries/mock_data.sql
   
   -- 3. Run analysis queries
   \i queries/basic_queries/turnover.sql
   \i queries/basic_queries/staff_performance.sql
   \i queries/intermediate_queries/purchase_patterns.sql
   ```

## Query Results Summary

### Inventory Turnover (Top 3)
| Branch | Incoming Stock | Outgoing Stock | Current Level | Turnover Rate |
|--------|---------------|----------------|---------------|---------------|
| Bandung West Branch | 100 | 45 | 25 | 1.20 |
| Jakarta Central Store | 1,950 | 730 | 1,215 | 0.49 |
| Yogyakarta Branch | 120 | 0 | 80 | 0.40 |

### Staff Performance (Top 3)
| Staff ID | Branch | Transactions | Total Sales | Avg Transaction |
|----------|---------|-------------|-------------|----------------|
| STF002 | Jakarta Central Store | 5 | 904,500 | 180,900 |
| STF003 | Jakarta Central Store | 3 | 401,000 | 133,667 |
| STF009 | Surabaya Central | 1 | 384,000 | 384,000 |

### Purchase Patterns (Top 3)
| Product 1 | Product 2 | Co-occurrence |
|-----------|-----------|---------------|
| Indomie Goreng Original | Aqua 600ml | 2 |
| Indomie Goreng Original | Chitato 68g | 2 |
| Indomie Soto | Mie Sedaap Goreng | 2 |

## Data Visualization Implementation

**Dashboard**: **Retail Executive Command Center** (Implemented in Looker Studio)

**Dashboard Link**: [View Live Dashboard](https://lookerstudio.google.com/reporting/cdb0c62d-a70b-4852-ae14-b909c46eb928)

**Key Visualizations Implemented**:
1. **Branch Performance Leaderboard**: Real-time inventory turnover ranking with color-coded alerts
2. **Cross-Selling Frequency Analysis**: Product affinity chart for strategic bundling opportunities  
3. **Top Staff Performance Table**: Sales performance metrics with heat map visualization
4. **Performance vs Sales Scatter Plot**: Correlation analysis between staff scores and sales results

**Data Sources Used**:
- `turnover_result.csv` - Branch inventory and turnover metrics
- `staff_performance_result.csv` - Staff sales and performance data
- `purchase_patterns_result.csv` - Product co-occurrence analysis

**Business Value Delivered**: 
- **Real-time Branch Monitoring**: Instant identification of underperforming locations (e.g., Semarang Central with 0% turnover)
- **Staff Optimization**: Clear visibility into top performers (STF002 with 904K sales) for recognition and training models
- **Cross-selling Strategy**: Data-driven product placement based on actual purchase patterns (Indomie + Aqua combo)
- **Executive Decision Support**: Actionable insights for immediate operational improvements


## Technical Achievements

- ✅ **Advanced SQL Techniques**: CTEs, window functions, self-joins, case statements
- ✅ **Performance Optimization**: Proper indexing on foreign keys and date fields
- ✅ **Data Integrity**: Comprehensive foreign key relationships and constraints
- ✅ **Business Logic**: Realistic retail scenarios with proper transaction flows
- ✅ **Scalable Design**: Schema supports future expansion and complex analytics

## Files Structure

```
1-sql-assessment/
├── README.md
├── docker-compose.yml
├── queries/
│   ├── table_schema.sql
│   ├── mock_data.sql
│   ├── basic_queries/
│   │   ├── turnover.sql
│   │   └── staff_performance.sql
│   └── intermediate_queries/
│       └── purchase_patterns.sql
└── results/
    ├── basic_queries/
    │   ├── turnover_result.csv
    │   └── staff_performance_result.csv
    ├── intermediate_queries/
    │   └── purchase_patterns_result.csv
    └── data_visualization/
        ├── Blue_Retail_Monitoring_Dashboard.pdf
        └── Blue_Retail_Monitoring_Dashboard_001.png

```