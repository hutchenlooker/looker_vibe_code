include: "/views/order_items.view.lkml"

view: +order_items {
  dimension: id {
    description: "Unique identifier for each individual item within an order."
  }

  dimension_group: created {
    description: "The date and time when the order item record was first created."
  }

  dimension_group: delivered {
    description: "The date and time when the item was successfully delivered to the customer."
  }

  dimension: inventory_item_id {
    description: "Foreign key referencing the specific item in the inventory catalog."
  }

  dimension: order_id {
    description: "The unique identifier for the overall order this item belongs to."
  }

  dimension: product_id {
    description: "Foreign key referencing the product associated with this order item."
  }

  dimension_group: returned {
    description: "The date and time when the item was returned by the customer, if applicable."
  }

  dimension: sale_price {
    description: "The actual price at which the item was sold to the customer."
  }

  dimension_group: shipped {
    description: "The date and time when the item was dispatched from the distribution center."
  }

  dimension: status {
    description: "The current fulfillment status of the item (e.g., Shipped, Processing, Returned, Cancelled, Delivered)."
  }

  dimension: user_id {
    description: "The unique identifier of the customer who placed the order."
  }

  dimension: days_to_deliver {
    description: "The number of days between the order being placed and being delivered."
    type: number
    sql: DATE_DIFF(${delivered_date}, ${created_date}, DAY) ;;
  }

  measure: count {
    description: "Total number of individual order items."
  }

  measure: average_days_to_deliver {
    description: "The average number of days it takes for an order item to be delivered."
    type: average
    sql: ${days_to_deliver} ;;
    value_format_name: decimal_1
  }
}
