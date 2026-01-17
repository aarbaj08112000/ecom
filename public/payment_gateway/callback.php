<?php
include '../core/core.php';
$booking_id = $_GET['booking_id'];
// print_r($booking_id);
$post_data = $_POST;
if ($post_data['razorpay_payment_id'] != '' && $post_data['merchant_order_id'] != "") {
	$data['title'] = 'Razorpay Success | TechArise';

	if(fun_update("enrollments", 'payment_status|transaction_id', 'Paid|' . $post_data['razorpay_payment_id'], 'id = "' . $booking_id . '"')){
		$user_info = fun_select('enrollments','*',"id='" . $booking_id . "'");
		$batch_data = fun_select('batches','*',"id='" . $user_info[0]['batch_id'] . "'");

		$userName = $user_info[0]['name'];
		$userEmail = $user_info[0]['email'];
		$fromEmail = 'olisticstudios@gmail.com';
		$fromName = 'Olistic Studios';
		$subject = 'Booking Confirmation.';
		$message = '
		<!DOCTYPE html>
		<html>
		<head>
		<title>Contact Us</title>
		<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f4f4f4;
		}
		.container {
			max-width: 600px;
			margin: 0 auto;
			padding: 20px;
		}
		.line{
			border-bottom: 1px solid white;
			padding-bottom: 15px;
		}
		.header {
			background-color: #f99e72;
			color: #ffffff;
			text-align: center;
			padding: 20px;
		}
		.content {
			background-color: #ffffff;
			padding: 20px;
			border-bottom:5px solid #f99e72 ;
		}
		</style>
		</head>
		<body>
		<div class="container border-line">
		<div class="header">
		<div class="line text-center mt-5">
		<img src="https://www.olisticstudios.com/assets/img/logo_white.png" alt="" height="70">
		</div>
		</div>
		<div class="content">
		<p>Dear '.$userName.',</p>

		<p>We are delighted to inform you that your booking has been confirmed. Details are as follows:</p>

		<p><strong>Booking Information:</strong></p>
		<ul>
		<li><strong>Date:</strong> '.$user_info[0]['batch_date'].'</li>
		<li><strong>Time:</strong> '.$user_info[0]['batch_timing'].'</li>
		<li><strong>Services:</strong> '.$batch_data[0]['batch_name'].'</li>

		</ul>

		<p>Thank you for choosing our services. We look forward to serving you on the specified day and time.</p>

		<p>If you have any questions or need further assistance, please feel free to contact us.</p>

		<p>Best Regards,<br>
		Olistic Studios</p>
		</div>
		</div>
		</body>
		</html>
		';
		$headers = "From: $fromName <$fromEmail>\r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=UTF-8\r\n";

		mail($userEmail, $subject, $message, $headers);

		// echo "<h4>Your transaction is successful</h4>";
		// echo "<br/>";
		// echo "Transaction ID: ".$post_data['razorpay_payment_id'];
		// echo "<br/>";
		// echo "Order ID: ".$post_data['merchant_order_id'];
		header('Location: ../thank_you.php');

	}


} else {
	$data['title'] = 'Razorpay Failed | TechArise';
	echo "<h4>Your transaction got Failed</h4>";
	echo "<br/>";
	echo "Transaction ID: ".$post_data['razorpay_payment_id'];
	echo "<br/>";
	echo "Order ID: ".$post_data['merchant_order_id'];

}

?>
