include: "/views/order_items.view.lkml"

view: +order_items {
  measure: total_revenue {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: total_cost {
    type: sum
    sql: ${products.cost} ;;
    value_format_name: usd
  }

  measure: total_gross_margin {
    type: number
    sql: ${total_revenue} - ${total_cost} ;;
    value_format_name: usd
  }

  measure: gross_margin_percentage {
    type: number
    sql: 100.0 * ${total_gross_margin} / NULLIF(${total_revenue}, 0) ;;
    value_format: "0.00%"
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
  }
}
