<?php
	
    include 'lib/session.php';
    Session::init();
?>
<?php
	
	include 'lib/database.php';
	include 'helpers/format.php';

	spl_autoload_register(function($class){
		include_once "classes/".$class.".php";
	});
		

	$db = new Database();
	$fm = new Format();
	$ct = new cart();
	$us = new user();
	$cs = new customer();
	$cat = new category();
	$product = new product();
?>

<?php
  header("Cache-Control: no-cache, must-revalidate");
  header("Pragma: no-cache"); 
  header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); 
  header("Cache-Control: max-age=2592000");
?>

<!DOCTYPE HTML>
<head>
<title>Store Website</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all"/>
<script src="js/jquerymain.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script> 
<script type="text/javascript" src="js/nav-hover.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Doppio+One' rel='stylesheet' type='text/css'>
<script type="text/javascript">
  $(document).ready(function($){
    $('#dc_mega-menu-orange').dcMegaMenu({rowItems:'4',speed:'fast',effect:'fade'});
  });
</script>
</head>
<body>
  <div class="wrap">
		<div class="header_top">
			<div class="logo">
				<a href="index.php"><img style="width: 100px ; height: 90px" src="images/logo.png" alt="" /></a>
			</div>
			  <div class="header_top_right">
			    <div class="search_box">
		<form action="" method="get">
            <input type="text" name="search" />
            <input type="submit" name="submit" value="Tìm"/>
        </form>
        <?php
			$conn = mysqli_connect("localhost","root","","webphukiendt") or die("Không thể kết nối!");
			if (isset( $_GET['submit']) && $_GET["search"] != '') {
				$search = $_GET['search'];
				$query = "SELECT * FROM tbl_product WHERE productName like '%$search%'  ";
		
				$sql = mysqli_query($conn, $query);
				//echo $sql;
				$num = mysqli_num_rows($sql);
				if ($num > 0) {
					echo " Kết quả tìm kiếm là <b>$num Sản Phẩm ".$search."</b>";
					echo '<table border="1" cellspacing="0" cellpadding="10">';
					echo 
						'<style>
						table {
						border-collapse: collapse;
						width: 100%;
						}
	
						th, td {
						text-align: left;
						padding: 8px;

						}
						h1{
						text-align: center;
						box-sizing: border-box;
						padding: 5px 5px;
						color: blue;
						}
						tr:nth-child(even){background-color: #ffffff}
		
							th {
								background-color: #4CAF50;
								color: white;
							}</style>';
						echo "<tr>
							<th>Tên Sản Phẩm </th>
							<th>Ảnh </th>
							<th>Giá	</th>                      
						</tr>";
					foreach( $sql as $row ) {
						echo '<tr>';
							echo "<td>{$row['productName']}</td>";
							echo "<td><img src='admin/uploads/".$row['image']."'></td>";
							echo "<td>{$row['price']}</td>";
							
						echo '</tr>';
					}
					echo '</table>';
				} 
				else {
					echo "Khong tim thay ket qua!";
				}
			}
        ?>
			    </div>
			    <div class="shopping_cart">
					<div class="cart">
						<a href="cart.php" title="View my shopping cart" rel="nofollow">
								<span class="cart_title">Cart</span>
								<span class="no_product">
									
								<?php
								$check_cart = $ct->check_cart();
								if ($check_cart) {
								 	$sum = Session::get("sum");
								 	$qty = Session::get("qty");
									echo $fm->format_currency($sum).'Đ'.' '.' SL: '.$qty;

								 }else {
								 	echo 'Emtyp';
								 } 
								
								 ?>

								</span>
							</a>
						</div>
			      </div>
			<?php 
				if(isset($_GET['customer_id'])){
					$customer_id = $_GET['customer_id'];
					$delCart = $ct->del_all_data_cart();
					$delCompare = $ct->del_compare($customer_id);
					Session::destroy();
				}
			?>   
		   <div class="login">
			<?php 
			$login_check = Session::get('customer_login');
			if ($login_check==false) {
				echo '<a href="login.php">Đăng nhập</a></div>'; 
			}else {
				echo '<a href="?customer_id='.Session::get('customer_id').' ">Đăng xuất</a></div>'; 
			}
			 ?>

		   	
		 <div class="clear"></div>
	 </div>
	 <div class="clear"></div>
 </div>
<div class="menu">
	
	<ul id="dc_mega-menu-orange" class="dc_mm-orange">
	  <li><a href="index.php">Trang chủ</a></li>
	  <li><a href="products.php">Sản Phẩm</a></li>
	  
	  
	  <?php 
	  $check_cart = $ct->check_cart();
	  if ($check_cart==true) {
	  	echo '<li><a href="cart.php">Giỏ hàng</a></li>';
	  }else {
	  	echo '';
	  }
	   ?>

	  <?php 
	  $customer_id = Session::get('customer_id'); 
	  $check_order = $ct->check_order($customer_id);
	  if ($check_order==true) {
	  	echo '<li><a href="orderdetails.php">Đơn hàng</a></li>';
	  }else {
	  	echo '';
	  }
	   ?>
	  
	  <?php 
	  $login_check = Session::get('customer_login');
	  if ($login_check==false) {
	  	echo '';
	  }else {
	  	echo '<li><a href="profile.php">Thông tin</a></li>';
	  }
	   ?>

	  <div class="clear"></div>
	</ul>
</div>
