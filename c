
[1mFrom:[0m /home/ec2-user/environment/lets_pizza/app/controllers/customer/orders_controller.rb:24 Customer::OrdersController#confirm:

    [1;34m10[0m: [32mdef[0m [1;34mconfirm[0m
    [1;34m11[0m:   
    [1;34m12[0m:   @order = current_member.orders
    [1;34m13[0m:   @total_price = calculate(current_member)
    [1;34m14[0m:   
    [1;34m15[0m:   session[[33m:payment_method[0m] = params[[33m:payment_method[0m]
    [1;34m16[0m:   
    [1;34m17[0m:   [32mif[0m params[[33m:delivery[0m] == [31m[1;31m"[0m[31mnew_address[1;31m"[0m[31m[0m
    [1;34m18[0m:     session[[33m:postal_code[0m] = params[[33m:session[0m][[33m:postal_code[0m]
    [1;34m19[0m:     session[[33m:address[0m] = params[[33m:session[0m][[33m:address[0m]
    [1;34m20[0m:     session[[33m:name[0m] = params[[33m:session[0m][[33m:name[0m]
    [1;34m21[0m:     session[[33m:telephone_number[0m] = params[[33m:session[0m][[33m:telephone_number[0m]
    [1;34m22[0m:   [32melsif[0m params[[33m:delivery[0m] == [31m[1;31m"[0m[31mmy_address[1;31m"[0m[31m[0m
    [1;34m23[0m:     binding.pry
 => [1;34m24[0m:     session[[33m:postal_code[0m] = params[[33m:session[0m][[33m:delivery_postal_code[0m]
    [1;34m25[0m:     session[[33m:address[0m] = params[[33m:session[0m][[33m:delivery_address[0m]
    [1;34m26[0m:     session[[33m:name[0m] = params[[33m:session[0m][[33m:delivery_name[0m]
    [1;34m27[0m:     session[[33m:telephone_number[0m] = params[[33m:session[0m][[33m:telephone_number[0m]
    [1;34m28[0m:   [32mend[0m  
    [1;34m29[0m: [32mend[0m

