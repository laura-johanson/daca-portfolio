import plotly.express as px
import plotly.graph_objects as go
from datetime import datetime
import os


def create_weekly_chart(df_weekly):
    fig = px.line(
        df_weekly,
        x=df_weekly.index,
        y="revenue",
        title="Nädalane tulu",
        labels={
            "revenue": "Tulu (€)"
        }
    )

    fig.update_xaxes(title="Nädal")

    return fig

def create_kpi_summary(kpis):
    fig = go.Figure(
        data=[
            go.Table(
                header=dict(
                    values=["KPI", "Väärtus"]
                ),
                cells=dict(
                    values=[
                        ["Kogutulu", "Unikaalsed kliendid", "Keskmine ostukorv"],
                        [
                            f"{kpis['total_revenue']:.0f} €",
                            kpis["unique_customers"],
                            f"{kpis['avg_order_value']:.2f} €"
                        ]
                    ]
                )
            )
        ]
    )

    fig.update_layout(
        title="Peamised KPI-d"
    )

    return fig

def export_results(df, output_dir, weekly_sales, kpis):
    os.makedirs(output_dir, exist_ok=True)

    date_str = datetime.now().strftime("%Y%m%d")

    csv_path = os.path.join(
        output_dir,
        f"results_{date_str}.csv"
    )

    df.to_csv(csv_path, index=False)

    weekly_chart = create_weekly_chart(weekly_sales)
    weekly_chart.write_html(
        os.path.join(output_dir, "weekly_revenue.html")
    )

    kpi_chart = create_kpi_summary(kpis)
    kpi_chart.write_html(
        os.path.join(output_dir, "kpi_summary.html")
    )

    return csv_path