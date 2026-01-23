/**
 * Admin Sidebar Menu Active State Management
 * Automatically highlights active menu items and expands parent menus
 */

$(document).ready(function () {

    // Get current URL path
    var currentPath = window.location.pathname;
    var currentPage = currentPath.split('/').pop() || 'dashboard';

    // Remove any existing active classes first
    $('.menu-item').removeClass('active open');
    $('.menu-sub').removeClass('show');

    // Find and activate matching menu item
    $('.menu-link').each(function () {
        var href = $(this).attr('href');

        // Skip javascript:void(0) links (parent menu toggles)
        if (!href || href === 'javascript:void(0);') {
            return;
        }

        // Extract the page name from href
        var hrefPage = href.split('/').pop();

        // Check if this is the current page
        if (hrefPage === currentPage || href === currentPage) {

            var $menuItem = $(this).closest('.menu-item');
            var $parentSub = $(this).closest('.menu-sub');

            // Add active class to current menu item
            $menuItem.addClass('active');

            // If this is a sub-menu item
            if ($parentSub.length > 0) {
                // Show the parent submenu
                $parentSub.addClass('show');

                // Add active and open classes to parent menu item
                var $parentMenuItem = $parentSub.closest('.menu-item');
                $parentMenuItem.addClass('active open');
            }

            // Stop searching once we find a match
            return false;
        }
    });

    // Handle menu toggle clicks with accordion behavior
    $('.menu-toggle').on('click', function (e) {
        var $parentItem = $(this).closest('.menu-item');
        var $subMenu = $parentItem.find('.menu-sub').first();

        // If we are opening a menu, close all other open menus first
        if (!$parentItem.hasClass('open')) {
            $('.menu-item.open').not($parentItem).each(function () {
                $(this).removeClass('open');
                $(this).find('.menu-sub').removeClass('show').slideUp();
            });
            $parentItem.addClass('open');
            $subMenu.addClass('show').slideDown();
        } else {
            // If clicking the already open menu, close it
            $parentItem.removeClass('open');
            $subMenu.removeClass('show').slideUp();
        }
    });

});
