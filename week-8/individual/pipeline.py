import logging
import time

from data_fetcher import fetch_sales
from transform import clean_data, calculate_weekly_aggregates, calculate_kpis
from visualize_export import export_results


logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)


def run_pipeline():
    logging.info("Pipeline started")

    try:
        logging.info("Starting data fetch")
        sales_df = fetch_sales("2023-01-01", "2025-03-01")
        logging.info("Data fetch complete")

        logging.info("Starting data cleaning")
        sales_clean = clean_data(sales_df)
        logging.info("Data cleaning complete")

        logging.info("Starting data aggregation")
        weekly_sales = calculate_weekly_aggregates(sales_clean)
        logging.info("Data aggregation complete")

        logging.info("Starting KPI calculation")
        kpis = calculate_kpis(sales_clean)
        logging.info("KPI calculation complete")

        logging.info("Starting export")
        export_results(
            sales_clean,
            "output",
            weekly_sales,
            kpis
        )
        logging.info("Export complete")

        logging.info("Pipeline completed successfully")
        print("Pipeline completed successfully")

    except Exception as e:
        logging.error(f"Pipeline failed: {e}")
        print(f"Pipeline failed: {e}")


if __name__ == "__main__":
    start_time = time.time()

    run_pipeline()

    elapsed = time.time() - start_time
    print(f"Total pipeline time: {elapsed:.2f} seconds")