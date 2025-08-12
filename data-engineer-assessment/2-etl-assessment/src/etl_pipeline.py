import pandas as pd
import logging
from pathlib import Path
from data_validation import DataValidator
from data_cleaning import DataCleaner
from data_transform import DataTransformer


class ETLPipeline:
    """Main ETL pipeline orchestrator."""
    
    def __init__(self):
        self.validator = DataValidator()
        self.cleaner = DataCleaner()
        self.transformer = DataTransformer()
        self.setup_logging()
    
    def setup_logging(self) -> None:
        """Configure logging for the ETL process."""
        log_dir = Path('logs')
        log_dir.mkdir(exist_ok=True)
        
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            handlers=[
                logging.FileHandler('logs/etl_process.log'),
                logging.StreamHandler()
            ]
        )
    
    def load_data(self) -> tuple[pd.DataFrame, pd.DataFrame]:
        """Load input data from Excel files."""
        input_dir = Path('data/input')
        
        city_df = pd.read_excel(input_dir / 'City Indonesia.xlsx')
        asset_df = pd.read_excel(input_dir / 'Assessment Data Asset Dummy.xlsx')
        
        logging.info(f"Loaded {len(city_df)} city records and {len(asset_df)} asset records")
        return asset_df, city_df
    
    def save_results(self, df: pd.DataFrame, errors: list) -> None:
        """Save processed results and error logs."""
        output_dir = Path('data/output')
        output_dir.mkdir(exist_ok=True)
        
        df.to_excel(output_dir / 'processed_assets.xlsx', index=False)
        df.to_csv(output_dir / 'processed_assets.csv', index=False)
        
        with open(output_dir / 'validation_errors.txt', 'w') as f:
            for error in errors:
                f.write(f"{error}\n")
        
        logging.info(f"Saved {len(df)} processed records")
    
    def run(self) -> None:
        """Execute the complete ETL pipeline."""
        logging.info("Starting ETL pipeline")
        
        try:
            asset_df, city_df = self.load_data()
            
            logging.info("Validating data")
            errors, _ = self.validator.validate_datasets(asset_df, city_df)
            
            logging.info("Cleaning data")
            cleaned_df = self.cleaner.clean_asset_data(asset_df, city_df)
            
            logging.info("Transforming data")
            final_df = self.transformer.transform_data(cleaned_df)
            
            self.save_results(final_df, errors)
            
            logging.info(f"ETL completed successfully. Processed {len(final_df)} records")
            print(f"\nSample output:\n{final_df.head()}")
            
        except Exception as e:
            logging.error(f"ETL pipeline failed: {str(e)}")
            raise

if __name__ == "__main__":
    pipeline = ETLPipeline()
    pipeline.run()