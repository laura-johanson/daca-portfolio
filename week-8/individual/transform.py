import pandas as pd


def clean_data(df):
    """Puhastab müügiandmed."""
    
    df_clean = df.drop_duplicates().copy()
    
    df_clean["sale_date"] = pd.to_datetime(
        df_clean["sale_date"],
        errors="coerce"
    )
    
    df_clean = df_clean.dropna(
        subset=["sale_date", "total_price"]
    )
    
    return df_clean

def calculate_weekly_aggregates(df):
    """Arvutab müügiandmete nädalased koondnäitajad."""
    
    weekly = df.resample(
        "W",
        on="sale_date"
    ).agg(
        revenue=("total_price", "sum"),
        orders=("total_price", "count"),
        average_order_value=("total_price", "mean")
    )
    
    return weekly

def calculate_kpis(df):
    """Arvutab müügiandmete peamised KPI-d."""
    
    kpis = {
        "total_revenue": df["total_price"].sum(),
        "unique_customers": df["customer_id"].nunique(),
        "avg_order_value": df["total_price"].mean()
    }
    
    return kpis

def merge_datasets(df_sales, df_customers):
    """Liidab müügi- ja kliendiandmed customer_id järgi."""
    
    merged = pd.merge(
        df_sales,
        df_customers,
        on="customer_id",
        how="left"
    )
    
    return merged