<?php
$host = 'localhost';
$db   = 'ecom';
$user = 'root';
$pass = 'Root@123';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);

    // Get all active products
    $stmt = $pdo->query("SELECT id, name FROM products WHERE is_delete = '0'");
    $products = $stmt->fetchAll();

    $reviewers = [
        ['name' => 'Alice Johnson', 'email' => 'alice@example.com'],
        ['name' => 'Bob Smith', 'email' => 'bob@example.com'],
        ['name' => 'Charlie Brown', 'email' => 'charlie@example.com'],
        ['name' => 'Diana Prince', 'email' => 'diana@example.com'],
        ['name' => 'Ethan Hunt', 'email' => 'ethan@example.com'],
        ['name' => 'Fiona Gallagher', 'email' => 'fiona@example.com'],
        ['name' => 'George Costanza', 'email' => 'george@example.com'],
        ['name' => 'Hannah Montana', 'email' => 'hannah@example.com'],
        ['name' => 'Ian McKellen', 'email' => 'ian@example.com'],
        ['name' => 'Julia Roberts', 'email' => 'julia@example.com'],
    ];

    $comments = [
        "Absolutely love this product! The quality is amazing.",
        "Good value for money. Handled with care.",
        "Average experience. The product is okay but could be better.",
        "Highly recommended! The finish is superb.",
        "Not worth the price. Expected more based on the description.",
        "Beautifully crafted. Perfect for gifting.",
        "Fast delivery and great packaging. Product looks exactly like the pictures.",
        "A bit smaller than expected, but the quality makes up for it.",
        "One of the best purchases I've made recently!",
        "Sturdy and well-made. Will definitely buy again."
    ];

    $statuses = ['Approved', 'Pending', 'Rejected', 'Approved', 'Approved']; // Mostly approved

    foreach ($products as $product) {
        for ($i = 0; $i < 5; $i++) {
            $reviewer = $reviewers[array_rand($reviewers)];
            $comment = $comments[array_rand($comments)];
            $rating = rand(3, 5); // Mostly good ratings
            if (strpos($comment, 'Not worth') !== false || strpos($comment, 'Average') !== false) {
                $rating = rand(1, 3);
            }
            $status = $statuses[$i % count($statuses)];

            $sql = "INSERT INTO product_reviews (product_id, reviewer_name, email, rating, comment, status, added_date) 
                    VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                $product['id'],
                $reviewer['name'],
                $reviewer['email'],
                $rating,
                $comment,
                $status,
                date('Y-m-d H:i:s', strtotime("-" . rand(1, 30) . " days"))
            ]);
        }
    }

    echo "Successfully seeded reviews for " . count($products) . " products.\n";

} catch (\PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
