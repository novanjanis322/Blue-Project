import pandas as pd


class DataTransformer:
    """Transforms data and generates business identifiers."""
    
    def format_funcloc(self, df: pd.DataFrame) -> pd.DataFrame:
        """Convert Funcloc to standard string format."""
        df_transformed = df.copy()
        df_transformed['Funcloc'] = df_transformed['Funcloc'].astype(str).str.zfill(12)
        return df_transformed
    
    def generate_internal_site_id(self, df: pd.DataFrame) -> pd.DataFrame:
        """Generate Internal Site ID in format AAA-BB-CCC."""
        df_transformed = df.copy()
        
        df_sorted = df_transformed.sort_values(['CityCode', 'Funcloc'])
        df_sorted['sequence'] = df_sorted.groupby('CityCode').cumcount() + 1
        
        df_sorted['InternalSiteID'] = (
            df_sorted['CityCode'] + '-' +
            df_sorted['RegionalCode'].astype(str).str.zfill(2) + '-' +
            df_sorted['sequence'].astype(str).str.zfill(3)
        )
        
        return df_sorted.drop('sequence', axis=1)
    
    def create_final_output(self, df: pd.DataFrame) -> pd.DataFrame:
        """Create final output with required columns in correct order."""
        output_columns = [
            'InternalSiteID',
            # 'Alamat1',
            # 'Alamat2', 
            # 'Alamat3',
            'Alamat4',
            # 'SiteName',
            'Funcloc'
        ]
        return df[output_columns].copy()
    
    def transform_data(self, df: pd.DataFrame) -> pd.DataFrame:
        """Execute complete data transformation pipeline."""
        df_formatted = self.format_funcloc(df)
        df_with_ids = self.generate_internal_site_id(df_formatted)
        final_output = self.create_final_output(df_with_ids)
        return final_output