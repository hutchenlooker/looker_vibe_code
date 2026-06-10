include: "/views/order_items.view.lkml"
include: "/views/inventory_items.view.lkml"

view: +inventory_items {
  dimension: days_in_inventory {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), DATE(${created_raw}), DAY) ;;
  }

  dimension: days_in_inventory_tier {
    type: tier
    tiers: [0, 5, 10, 20, 40, 80, 160]
    style: integer
    sql: ${days_in_inventory} ;;
  }

  measure: unsold_inventory_count {
    type: count
    filters: [sold_date: "null"]
  }
}

view: +order_items {
  dimension: days_to_process {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), DATE(${created_raw}), DAY) ;;
  }

  measure: orders_processing_count {
    type: count_distinct
    sql: ${order_id} ;;
    filters: [status: "Processing"]
  }

  measure: total_amount_processing {
    type: sum
    sql: ${sale_price} ;;
    filters: [status: "Processing"]
    value_format_name: usd
  }

  measure: orders_shipped_count {
    type: count_distinct
    sql: ${order_id} ;;
    filters: [status: "Shipped"]
  }

  measure: average_shipping_time {
    type: average
    sql: DATE_DIFF(DATE(${shipped_raw}), DATE(${created_raw}), DAY) ;;
    value_format_name: decimal_1
  }
}
