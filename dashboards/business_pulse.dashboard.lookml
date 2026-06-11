- dashboard: business_pulse
  title: Business Pulse
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: O8Jm9X5pZp5pZp5pZp5pZp
  elements:
  - title: Total Revenue
    name: Total Revenue
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.total_revenue]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Total Orders
    name: Total Orders
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Average Order Value
    name: Average Order Value
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_revenue_per_order]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Total Users
    name: Total Users
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: single_value
    fields: [users.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, products.category, order_items.order_count]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 7 days
    sorts: [order_items.created_date desc, products.category]
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
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    row: 4
    col: 0
    width: 12
    height: 8
  - title: Revenue by Category
    name: Revenue by Category
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_donut_multiples
    fields: [products.category, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 500
    show_value_labels: true
    font_size: 12
    row: 4
    col: 12
    width: 12
    height: 8
  - title: Top 10 Products
    name: Top 10 Products
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_grid
    fields: [products.name, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 12
    col: 0
    width: 12
    height: 8
  - title: Sales by State
    name: Sales by State
    model: 1_looker_vibe_code_demo
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.state, order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    limit: 500
    map: usa
    map_projection: ''
    show_view_names: false
    row: 12
    col: 12
    width: 12
    height: 8
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: 1_looker_vibe_code_demo
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: 1_looker_vibe_code_demo
    explore: order_items
    listens_to_filters: []
    field: users.state
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: 1_looker_vibe_code_demo
    explore: order_items
    listens_to_filters: []
    field: products.category
