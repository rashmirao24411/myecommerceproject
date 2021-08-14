function add_to_cart(pid,pname,price)
{
	let cart= localStorage.getItem("cart");
	if(cart==null)
		{
		let products=[];
		
		let product={productId:pid,productName:pname,productQuantity:1,productPrice:price}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		}else
			{
			
			}
	}