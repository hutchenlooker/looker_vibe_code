- dashboard: vibe_demo_dashboard
  title: "Vibe Demo: Executive Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Recreated dashboard from PDF for e-commerce performance monitoring."

  filters:
  - name: date
    title: "Order Date"
    type: date_filter
    default_value: "last 30 days"

  - name: category
    title: "Category"
    type: field_filter
    model: 1_looker_vibe_code_demo
    explore: order_items
    field: products.category

  elements:
  - name: revenue_kpi
    title: "Total Revenue"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_revenue]
    listen:
      date: order_items.created_date
      category: products.category
    row: 0
    col: 0
    width: 8
    height: 4

  - name: order_count_kpi
    title: "Orders"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    listen:
      date: order_items.created_date
      category: products.category
    row: 0
    col: 8
    width: 8
    height: 4

  - name: aov_kpi
    title: "Avg Order Value"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_revenue_per_order]
    listen:
      date: order_items.created_date
      category: products.category
    row: 0
    col: 16
    width: 8
    height: 4

  - name: sales_trend
    title: "Weekly Revenue Trend"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_week, order_items.total_revenue]
    sorts: [order_items.created_week desc]
    listen:
      date: order_items.created_date
      category: products.category
    row: 4
    col: 0
    width: 24
    height: 8

  - name: status_breakdown
    title: "Order Status Breakdown"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_pie
    fields: [order_items.status, order_items.order_count]
    listen:
      date: order_items.created_date
      category: products.category
    row: 12
    col: 0
    width: 12
    height: 8

  - name: top_categories
    title: "Top Categories by Revenue"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_bar
    fields: [products.category, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 10
    listen:
      date: order_items.created_date
      category: products.category
    row: 12
    col: 12
    width: 12
    height: 8
