# Data Engineer Technical Assessment

## Overview

This repository contains my solutions for the TAN Digital Data Engineer Technical Assessment. The assessment covers three main areas: SQL database management, ETL pipeline development, and data visualization using Indonesian datasets.

I'm a data engineer with experience in building scalable data pipelines, database optimization, and creating business intelligence solutions that drive actionable insights.

## Tools Used

- **Database**: PostgreSQL 15, Docker Compose
- **ETL Development**: Python 3.9+
  - pandas 2.0+
  - openpyxl 3.1+
  - logging, pathlib
- **Data Visualization**: Google Looker Studio
- **Development**: VS Code, Git
- **Containerization**: Docker

## Setup Instructions

### Prerequisites
- Docker and Docker Compose
- Python 3.9+
- Git

### 1. Clone Repository
```bash
git clone <repository-url>
cd data-engineer-assessment
```

### 2. SQL Assessment
```bash
cd 1-sql-assessment
docker-compose up -d
# Access PgAdmin: http://localhost:8080 (admin@admin.com / admin123)
```

### 3. ETL Assessment  
```bash
cd 2-etl-assessment
pip install pandas openpyxl
python src/etl_pipeline.py
```

### 4. Data Visualization
- SQL Dashboard: [Blue Retail Monitoring Dashboard](https://lookerstudio.google.com/reporting/cdb0c62d-a70b-4852-ae14-b909c46eb928)
- Cooperative Analysis: [Indonesian Cooperatives Dashboard](https://lookerstudio.google.com/reporting/1522d8c7-eeb7-45b7-9632-128c86556546)

## Assessment Results

### Section 1: SQL Assessment
**Achievement**: Complete retail analytics database with advanced query optimization
- **Database**: 6 normalized tables with 12+ records each
- **Queries**: Inventory turnover, staff performance, purchase patterns analysis
- **Visualization**: Executive dashboard with 4 key business intelligence charts
- **Key Insight**: Bandung West Branch achieves 2.4x better inventory turnover

### Section 2: ETL Assessment  
**Achievement**: Robust Python ETL pipeline with 99.2% processing success rate
- **Input**: 4,908 Indonesian asset records with inconsistent city names
- **Output**: 4,870 processed records with standardized Internal Site IDs
- **Process**: Intelligent city mapping, comprehensive validation, error logging
- **Key Feature**: Generates business-compliant IDs (AAA-BB-CCC format)

### Section 3: Data Visualization
**Achievement**: Interactive BI dashboards analyzing Indonesian cooperatives and retail operations
- **Indonesian Cooperatives**: 5,000 cooperatives across all provinces with complete geographic analysis
- **Retail Dashboard**: 4 executive charts for real-time business monitoring  
- **Coverage**: Java Island dominance analysis (68%), gender balance, sectoral distribution
- **Business Value**: Policy recommendations for regional development and operational optimization
- **Key Finding**: 2.25+ million cooperative members served nationwide

## Time Spent

| Section | Duration | Focus Areas |
|---------|----------|-------------|
| 1. SQL Assessment | 12 hours | Schema design, query optimization, dashboard creation |
| 2. ETL Assessment | 12 hours | Pipeline development, validation logic, error handling |
| 3. Data Visualization | 6 hours | Dashboard design, Indonesian cooperative analysis |
| Documentation | 2 hours | README files, technical documentation |
| **Total** | **32 hours** | Complete technical assessment |

## Key Technical Achievements

### SQL Proficiency
- Advanced techniques: CTEs, window functions, self-joins
- Business intelligence: Real-time monitoring dashboards
- Performance optimization: Proper indexing and query structure

### ETL Engineering
- **99.2% success rate** processing complex data transformations
- Modular Python design with comprehensive error handling
- **PEP 8 compliance** with type hints and documentation

### Data Visualization
- **Executive-ready dashboards** with actionable business insights for both retail operations and policy development
- **Interactive visualizations** supporting strategic decision-making with real-time monitoring capabilities
- **Multi-dataset integration** combining SQL query results and national cooperative data

## Repository Structure

```
data-engineer-assessment/
├── README.md
├── 1-sql-assessment/
│   ├── README.md
│   ├── docker-compose.yml
│   ├── queries/
│   │   ├── table_schema.sql
│   │   ├── mock_data.sql
│   │   ├── basic_queries/
│   │   │   ├── turnover.sql
│   │   │   └── staff_performance.sql
│   │   └── intermediate_queries/
│   │       └── purchase_patterns.sql
│   └── results/
│       ├── basic_queries/
│       │   ├── turnover_result.csv
│       │   └── staff_performance_result.csv
│       ├── intermediate_queries/
│       │   └── purchase_patterns_result.csv
│       └── data_visualization/
│           ├── Blue_Retail_Monitoring_Dashboard.pdf
│           └── Blue_Retail_Monitoring_Dashboard_001.png
├── 2-etl-assessment/
│   ├── README.md
│   ├── src/
│   │   ├── __init__.py
│   │   ├── etl_pipeline.py
│   │   ├── data_validation.py
│   │   ├── data_cleaning.py
│   │   └── data_transform.py
│   ├── data/
│   │   ├── input/
│   │       ├── Assessment Data Asset Dummy.xlsx
│   │       └── City Indonesia.xlsx
│   │   └── output/
│   │       ├── processed_assets.csv
│   │       ├── processed_assets.xlsx
│   │       └── validation_errors.txt
│   │
│   └── logs/
│       └── etl_process.log
└── 3-visualization/
    ├── README.md
    ├── screenshots/
    │   └── Indonesian_Cooperatives_Dashboard.png
    └── source_files/
        └── Data_Koperasi_Indonesia.csv
```
