# # Question 8:

# order_data = [
#   {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
#   {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
#   {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
#   {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
#   {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
#   # rest of data...
# ]
# customer_orders = {}

# order_data.each do |row|
#   if customer_orders.key?(row[:customer_id])
#     customer_orders[row[:customer_id]][:orders] << {
#       order_fulfilled: row[:order_fulfilled],
#       order_value: row[:order_value]
#     }
#   else
#     customer_orders[row[:customer_id]] = {
#       customer_id: row[:customer_id],
#       customer_name: row[:customer_name],
#       orders: [
#         {
#           order_fulfilled: row[:order_fulfilled],
#           order_value: row[:order_value]
#         }
#       ]
#     }
#   end
# end

# p customer_orders = customer_orders.values

# Question 9:

# code should look like this:

all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]

# I chose A and C, the answer was A, B and C. But i remember feeling like I was guessing a lot, because I was tired.
