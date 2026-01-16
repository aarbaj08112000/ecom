document.addEventListener('DOMContentLoaded', function () {
    const shopContainer = document.getElementById('shop-container');
    if (!shopContainer) return;

    const baseUrl = shopContainer.dataset.baseUrl;
    const productGrid = document.getElementById('product-grid');
    const showingText = document.getElementById('showing-text');
    const heroTotalCount = document.getElementById('hero-total-count');
    const priceRange = document.getElementById('priceRange');
    const maxPriceText = document.getElementById('maxPrice');
    const sortSelect = document.getElementById('sort-select');
    const applyBtn = document.getElementById('apply-filters-btn');
    const clearBtn = document.getElementById('clear-filters-btn');
    const categoryCheckboxes = document.querySelectorAll('.filter-category');

    // Update Price Range Text
    if (priceRange) {
        priceRange.addEventListener('input', function () {
            maxPriceText.textContent = this.value;
        });
    }

    // Apply Filters Function
    window.applyFilters = function () {
        const categories = Array.from(document.querySelectorAll('.filter-category:checked'))
            .map(cb => cb.value);

        const params = new URLSearchParams();
        if (categories.length > 0) params.append('categories', categories.join(','));
        if (priceRange) params.append('max_price', priceRange.value);
        if (sortSelect) params.append('sort', sortSelect.value);

        // Update URL without reload
        const newUrl = `${window.location.pathname}?${params.toString()}`;
        window.history.pushState({ path: newUrl }, '', newUrl);

        // Fetch Data
        fetch(`${baseUrl}shop/products?${params.toString()}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    // Update Grid
                    productGrid.innerHTML = data.html;

                    // Update Showing Text
                    if (showingText) showingText.innerHTML = data.showing_text;

                    // Update Hero Count
                    if (heroTotalCount) heroTotalCount.textContent = `${data.total_products} Products`;

                    // Re-initialize AOS if available
                    if (window.AOS) {
                        window.AOS.refresh();
                    }
                }
            })
            .catch(error => console.error('Error filtering products:', error));
    };

    // Reset Filters
    window.resetFilters = function () {
        categoryCheckboxes.forEach(cb => cb.checked = false);
        if (priceRange) {
            priceRange.value = 5000;
            maxPriceText.textContent = '5000';
        }
        if (sortSelect) sortSelect.value = 'default';

        applyFilters();
    };

    // Event Listeners
    if (applyBtn) applyBtn.addEventListener('click', applyFilters);
    if (clearBtn) clearBtn.addEventListener('click', resetFilters);
    if (sortSelect) sortSelect.addEventListener('change', applyFilters);

    // Optional: Auto-apply for checkboxes
    categoryCheckboxes.forEach(cb => {
        cb.addEventListener('change', applyFilters);
    });
});
