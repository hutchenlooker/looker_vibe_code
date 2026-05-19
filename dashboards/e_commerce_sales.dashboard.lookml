- dashboard: e_commerce_sales
  title: "E-Commerce Sales Summary"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "A comprehensive dashboard summarizing sales performance, product metrics, customer demographics, and order status."

  filters:
  - name: Date
    title: "Order Date"
    type: date_filter
    default_value: "last 90 days"
    allow_multiple_values: true
    required: false

  - name: Category
    title: "Product Category"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: 1_looker_vibe_code_demo
    explore: order_items
    field: products.category

  - name: State
    title: "User State"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: 1_looker_vibe_code_demo
    explore: order_items
    field: users.state

  - name: Gender
    title: "Gender"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    model: 1_looker_vibe_code_demo
    explore: order_items
    field: users.gender

  elements:
  - name: total_revenue
    title: "Total Revenue"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_revenue]
    limit: 500
    column_limit: 50
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 0
    col: 0
    width: 6
    height: 4

  - name: total_orders
    title: "Total Orders"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    limit: 500
    column_limit: 50
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 0
    col: 6
    width: 6
    height: 4

  - name: average_sale_price
    title: "Average Sale Price"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    limit: 500
    column_limit: 50
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 0
    col: 12
    width: 6
    height: 4

  - name: gross_margin_percentage
    title: "Gross Margin %"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.gross_margin_percentage]
    limit: 500
    column_limit: 50
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 0
    col: 18
    width: 6
    height: 4

  - name: sales_and_order_trend
    title: "Weekly Sales & Order Trend"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_week, order_items.total_revenue, order_items.order_count]
    fill_fields: [order_items.created_week]
    sorts: [order_items.created_week desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ""
    stacking: ""
    limit_displayed_rows: false
    legend_position: center
    series_types:
      order_items.order_count: column
    colors: ["#1A73E8", "#12B5CB"]
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 4
    col: 0
    width: 16
    height: 8

  - name: order_fulfillment_status
    title: "Order Fulfillment Status"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_column
    fields: [order_items.status, order_items.order_count]
    sorts: [order_items.order_count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 4
    col: 16
    width: 8
    height: 8

  - name: sales_by_category
    title: "Sales by Product Category"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_bar
    fields: [products.category, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 15
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    colors: ["#34A853"]
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 12
    col: 0
    width: 12
    height: 8

  - name: top_brands
    title: "Top 10 Brands by Revenue"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_grid
    fields: [products.brand, order_items.total_revenue, order_items.order_count, order_items.gross_margin_percentage]
    sorts: [order_items.total_revenue desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: "12"
    rows_font_size: "12"
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 12
    col: 12
    width: 12
    height: 8

  - name: sales_by_gender
    title: "Sales Split by Gender"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_pie
    fields: [users.gender, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 500
    column_limit: 50
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 20
    col: 0
    width: 8
    height: 8

  - name: sales_by_state
    title: "Top States by Sales Volume"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_column
    fields: [users.state, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 15
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    colors: ["#FA7B17"]
    listen:
      Date: order_items.created_date
      Category: products.category
      State: users.state
      Gender: users.gender
    row: 20
    col: 8
    width: 16
    height: 8
