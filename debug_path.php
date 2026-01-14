<?php
echo "FCPATH: " . FCPATH . "<br>";
$path = FCPATH . 'public/images/customers/';
echo "Attempting to check: " . $path . "<br>";
if (is_dir($path)) {
    echo "Directory exists.<br>";
    if (is_writable($path)) {
        echo "Directory IS writable.<br>";
    } else {
        echo "Directory IS NOT writable.<br>";
        echo "Permissions: " . substr(sprintf('%o', fileperms($path)), -4) . "<br>";
        echo "Owner ID: " . fileowner($path) . "<br>";
        echo "Group ID: " . filegroup($path) . "<br>";
        echo "Current User (PHP): " . get_current_user() . " (UID: " . getmyuid() . ")<br>";
        if (function_exists('posix_getpwuid')) {
            $user = posix_getpwuid(posix_geteuid());
            echo "Current User (Process): " . $user['name'] . "<br>";
        }
    }
} else {
    echo "Directory does NOT exist.<br>";
}
?>
