- dashboard: ecommerce_sales_v2
  title: "Ecommerce Sales V2"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "A summary of ecommerce sales performance."

  filters:
  - name: date
    title: "Date"
    type: date_filter
    default_value: "last 30 days"
    allow_multiple_values: true
    required: false

  elements:
  - name: total_revenue
    title: "Total Revenue"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_revenue]
    listen:
      date: order_items.created_date
    row: 0
    col: 0
    width: 8
    height: 4

  - name: order_count
    title: "Order Count"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    listen:
      date: order_items.created_date
    row: 0
    col: 8
    width: 8
    height: 4

  - name: average_order_value
    title: "Average Order Value"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_revenue_per_order]
    listen:
      date: order_items.created_date
    row: 0
    col: 16
    width: 8
    height: 4

  - name: revenue_by_category
    title: "Revenue by Category"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_column
    fields: [products.category, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 10
    listen:
      date: order_items.created_date
    row: 4
    col: 0
    width: 12
    height: 8

  - name: revenue_trend
    title: "Revenue Trend"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.total_revenue]
    sorts: [order_items.created_date]
    listen:
      date: order_items.created_date
    row: 4
    col: 12
    width: 12
    height: 8
