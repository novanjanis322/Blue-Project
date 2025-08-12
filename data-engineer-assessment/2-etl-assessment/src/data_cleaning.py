import pandas as pd
from typing import Dict, Optional


class DataCleaner:
    """Cleans and standardizes data formats."""
    
    def __init__(self):
        self.city_mapping = {}
    
    def create_city_mapping(self, city_df: pd.DataFrame) -> None:
        """Create mapping dictionary for city name variations."""
        for _, row in city_df.iterrows():
            original_city = row['City']
            city_upper = original_city.upper()
            clean_name = city_upper.replace('KABUPATEN ', '').replace('KOTA ', '')
            
            mapping_data = {
                'standardized_name': original_city,
                'city_code': row['CityCode'],
                'regional_code': row['RegionalCode']
            }
            
            self.city_mapping[clean_name] = mapping_data
            self.city_mapping[clean_name + ', KOTA'] = mapping_data
            self.city_mapping[clean_name + ' KOTA'] = mapping_data
    
    def map_city_name(self, alamat4: str) -> Optional[Dict]:
        """Map raw city name to standardized format."""
        alamat4_clean = alamat4.strip().upper()
        
        if alamat4_clean in self.city_mapping:
            return self.city_mapping[alamat4_clean]
        
        for mapped_city in self.city_mapping:
            if alamat4_clean in mapped_city or mapped_city in alamat4_clean:
                return self.city_mapping[mapped_city]
        
        return None
    
    def clean_asset_data(self, asset_df: pd.DataFrame, city_df: pd.DataFrame) -> pd.DataFrame:
        """Clean and standardize asset data."""
        self.create_city_mapping(city_df)
        
        df_clean = asset_df.copy()
        df_clean['Alamat4'] = df_clean['Alamat4'].str.strip()
        df_clean['city_mapping'] = df_clean['Alamat4'].apply(self.map_city_name)
        
        df_clean = df_clean.dropna(subset=['Funcloc', 'Alamat4', 'city_mapping'])
        df_clean = df_clean[df_clean['Funcloc'] > 0]
        
        df_clean['Alamat4'] = df_clean['city_mapping'].apply(lambda x: x['standardized_name'])
        df_clean['CityCode'] = df_clean['city_mapping'].apply(lambda x: x['city_code'])
        df_clean['RegionalCode'] = df_clean['city_mapping'].apply(lambda x: x['regional_code'])
        
        return df_clean.drop('city_mapping', axis=1)