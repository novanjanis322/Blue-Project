import pandas as pd
import logging
from typing import Tuple, List


class DataValidator:
    """Validates data integrity and formats."""
    
    def __init__(self):
        self.errors = []
    
    def validate_required_fields(self, df: pd.DataFrame, required_fields: List[str]) -> bool:
        """Check if all required fields exist in dataframe."""
        missing_fields = [field for field in required_fields if field not in df.columns]
        if missing_fields:
            self.errors.append(f"Missing fields: {missing_fields}")
            return False
        return True
    
    def validate_numeric_ranges(self, df: pd.DataFrame, column: str) -> pd.DataFrame:
        """Return rows with invalid numeric values."""
        invalid_mask = (df[column] <= 0) | df[column].isna()
        invalid_rows = df[invalid_mask]
        if not invalid_rows.empty:
            self.errors.append(f"Invalid {column} values: {len(invalid_rows)} records")
        return invalid_rows
    
    def validate_referential_integrity(self, asset_df: pd.DataFrame, city_df: pd.DataFrame) -> pd.DataFrame:
        """Return asset rows that cannot be matched to city master data."""
        asset_cities = set(asset_df['Alamat4'].str.upper().str.strip())
        city_variations = set()
        
        for city in city_df['City']:
            city_upper = city.upper()
            clean_name = city_upper.replace('KABUPATEN ', '').replace('KOTA ', '')
            city_variations.update([clean_name, clean_name + ', KOTA', clean_name + ' KOTA'])
        
        unmatched_cities = asset_cities - city_variations
        unmatched_rows = asset_df[asset_df['Alamat4'].str.upper().str.strip().isin(unmatched_cities)]
        
        if not unmatched_rows.empty:
            self.errors.append(f"Unmatched cities: {len(unmatched_rows)} records")
            logging.warning(f"Unmatched cities: {list(unmatched_cities)}")
        
        return unmatched_rows
    
    def validate_datasets(self, asset_df: pd.DataFrame, city_df: pd.DataFrame) -> Tuple[List[str], pd.DataFrame]:
        """Validate both datasets and return errors and invalid records."""
        self.errors = []
        
        self.validate_required_fields(asset_df, ['Funcloc', 'Alamat4', 'SiteName'])
        self.validate_required_fields(city_df, ['City', 'CityCode', 'RegionalCode'])
        
        self.validate_numeric_ranges(asset_df, 'Funcloc')
        unmatched_records = self.validate_referential_integrity(asset_df, city_df)
        
        return self.errors, unmatched_records
