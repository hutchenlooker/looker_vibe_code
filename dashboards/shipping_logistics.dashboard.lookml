- dashboard: shipping_logistics_overview
  title: "Shipping Logistics & Operations Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Recreated dashboard from PDF focusing on shipping logistics and operations."

  elements:
  - name: operations_overview_header
    type: text
    title_text: "Operations Overview"
    subtitle_text: "How are we doing from a logistics standpoint?"
    row: 0
    col: 0
    width: 24
    height: 2

  - name: orders_processing_kpi
    title: "# Orders Processing"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.orders_processing_count]
    row: 2
    col: 0
    width: 8
    height: 4

  - name: amount_processing_kpi
    title: "Total Amount Processing"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_amount_processing]
    row: 2
    col: 8
    width: 8
    height: 4

  - name: orders_shipped_kpi
    title: "# Orders Shipped"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.orders_shipped_count]
    row: 2
    col: 16
    width: 8
    height: 4

  - name: inventory_aging_report
    title: "Inventory Aging Report"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_column
    fields: [inventory_items.days_in_inventory_tier, inventory_items.unsold_inventory_count]
    fill_fields: [inventory_items.days_in_inventory_tier]
    sorts: [inventory_items.days_in_inventory_tier]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ""
    stacking: ""
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 6
    col: 0
    width: 12
    height: 8

  - name: order_shipment_status
    title: "Order Shipment Status"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_week, order_items.status, order_items.order_count]
    pivots: [order_items.status]
    fill_fields: [order_items.created_week]
    filters:
      order_items.status: "Complete,Processing,Shipped"
    sorts: [order_items.created_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ""
    stacking: ""
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 6
    col: 12
    width: 12
    height: 8

  - name: orders_still_processing_header
    type: text
    title_text: "Orders Still Processing"
    subtitle_text: "What orders should have been shipped but are still processing?"
    body_text: "**Recommended Action:** Send order id over slack to follow up on the order status, then email the customer to let them know that there is a delay"
    row: 14
    col: 0
    width: 24
    height: 3

  - name: open_orders_over_3_days
    title: "Open Orders >3 Days Old"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_grid
    fields: [order_items.order_id, users.email, order_items.created_date, order_items.status, inventory_items.product_name, order_items.days_to_process]
    filters:
      order_items.status: "Processing"
      order_items.days_to_process: ">3"
    sorts: [order_items.days_to_process desc]
    limit: 500
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
    row: 17
    col: 0
    width: 24
    height: 8

  - name: shipping_by_location_header
    type: text
    title_text: "Shipping by Location"
    subtitle_text: "Where can we improve our shipping time?"
    row: 25
    col: 0
    width: 24
    height: 2

  - name: most_common_shipping_locations
    title: "Most Common Shipping Locations"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_google_map
    fields: [users.city, users.count]
    sorts: [users.count desc]
    limit: 500
    row: 27
    col: 0
    width: 12
    height: 8

  - name: average_shipping_time_by_state
    title: "Average Shipping Time to Users"
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_google_map
    fields: [users.state, order_items.average_shipping_time]
    sorts: [order_items.average_shipping_time desc]
    limit: 500
    row: 27
    col: 12
    width: 12
    height: 8
