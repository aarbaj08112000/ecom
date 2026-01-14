$(document).ready(function () {
    customerReviews.init();
});

const customerReviews = {
    table: null,
    cleanBaseUrl: '',

    init: function () {
        this.cleanBaseUrl = base_url.replace(/"/g, '');
        this.initializeDataTable();
        this.handleStarRating();
        this.handleModalActions();
        this.handleFormSubmit();
        this.handleStatusToggle();
        this.handleDelete();
        this.handleSearch();
    },

    initializeDataTable: function () {
        const that = this;
        this.table = $('#reviews-list-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: that.cleanBaseUrl + 'get_reviews_ajax',
                type: 'POST'
            },
            columns: [
                { data: 'customer_name' },
                { data: 'rating' },
                { data: 'comment' },
                {
                    data: 'reviewer_type',
                    className: 'text-center',
                    render: function (data, type, row) {
                        data = data || 'system'; // Default to system if empty
                        const lowerData = data.toLowerCase();

                        let statusClass = 'status-inactive';
                        let bgClass = 'bg-secondary';

                        if (lowerData === 'admin') {
                            statusClass = 'status-processing';
                            bgClass = 'bg-primary';
                        } else if (lowerData === 'staff') {
                            statusClass = 'status-delivered';
                            bgClass = 'bg-success';
                        } else if (lowerData === 'system') {
                            statusClass = 'status-shipped';
                            bgClass = 'bg-warning text-dark';
                        } else if (lowerData === 'customer') {
                            statusClass = 'status-active';
                            bgClass = 'bg-success';
                        }

                        // Capitalize first letter for display
                        const displayData = data.charAt(0).toUpperCase() + data.slice(1);

                        return '<span class="status-badge ' + statusClass + '">' + displayData + '</span>';
                    }
                },
                { data: 'status', className: 'text-center', orderable: false },
                { data: 'created_at' },
                { data: 'action', orderable: false, className: 'text-center' }
            ],
            order: [[0, 'asc']],
            pageLength: 10,
            scrollY: true,
            bScrollCollapse: true,
            dom: 'frtilp',
            pagingType: "full_numbers",
            language: {
                processing: "Fetching reviews...",
                emptyTable: "No reviews found",
                searchPlaceholder: "Search reviews...",
                sSearch: "",
                lengthMenu: "_MENU_",
            },
            initComplete: function () {
                $('.dataTables_length').find('label').contents().filter(function () {
                    return this.nodeType === 3;
                }).remove();
                setTimeout(function () {
                    $(".dataTables_length select").select2({
                        minimumResultsForSearch: Infinity
                    });
                }, 100);
            }
        });
    },

    handleSearch: function () {
        const that = this;
        $('#review-search-filter').on('keyup', function () {
            that.table.search(this.value).draw();
        });
    },

    handleStarRating: function () {
        const stars = $('.star-btn');
        const ratingInput = $('#rating_value');

        stars.on('click', function () {
            const val = $(this).data('value');
            ratingInput.val(val);
            stars.removeClass('ti-star-filled active').addClass('ti-star');
            stars.each(function () {
                if ($(this).data('value') <= val) {
                    $(this).removeClass('ti-star').addClass('ti-star-filled active');
                }
            });
        });
    },

    handleModalActions: function () {
        const that = this;

        // Reset modal for Add
        $('#add-review-btn').on('click', function () {
            $('#reviewForm')[0].reset();
            $('#review_id').val('');
            $('#modalTitle').text('Add Customer Review');
            $('.star-btn').removeClass('ti-star-filled active').addClass('ti-star');
            $('#rating_value').val('');
            $('#reviewModal').modal('show');
        });

        // Fetch and show for Edit
        $(document).on('click', '.edit-review', function () {
            const id = $(this).data('id');
            $.ajax({
                url: that.cleanBaseUrl + 'get_review_details',
                type: 'POST',
                data: { id: id },
                dataType: 'json',
                success: function (res) {
                    if (res.success) {
                        const data = res.data;
                        $('#review_id').val(data.id);
                        $('#customer_id').val(data.customer_id);
                        $('#reviewer_type').val(data.reviewer_type);
                        $('#comment').val(data.comment);
                        $('#rating_value').val(data.rating);

                        $('.star-btn').removeClass('ti-star-filled active').addClass('ti-star');
                        $('.star-btn').each(function () {
                            if ($(this).data('value') <= data.rating) {
                                $(this).removeClass('ti-star').addClass('ti-star-filled active');
                            }
                        });

                        $('#modalTitle').text('Edit Customer Review');
                        $('#reviewModal').modal('show');
                    } else {
                        toaster('error', res.msg);
                    }
                }
            });
        });
    },

    handleFormSubmit: function () {
        const that = this;
        $('#reviewForm').on('submit', function (e) {
            e.preventDefault();

            if (that.validateForm()) {
                const formData = new FormData(this);
                $.ajax({
                    url: $(this).attr('action'),
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        const res = JSON.parse(response);
                        if (res.success) {
                            toaster('success', res.msg);
                            $('#reviewModal').modal('hide');
                            that.table.ajax.reload(null, false);
                        } else {
                            toaster('error', res.msg);
                        }
                    }
                });
            }
        });
    },

    validateForm: function () {
        let isValid = true;
        $('#reviewForm .required-input').each(function () {
            if ($(this).val().trim() === '') {
                isValid = false;
                $(this).addClass('is-invalid');
            } else {
                $(this).removeClass('is-invalid');
            }
        });

        if (!isValid) {
            toaster('warning', 'Please fill all required fields, including the star rating.');
        }
        return isValid;
    },

    handleStatusToggle: function () {
        const that = this;
        $(document).on('change', '.status-toggle', function () {
            const id = $(this).data('id');
            const status = $(this).is(':checked') ? 'Active' : 'Inactive';

            $.ajax({
                url: that.cleanBaseUrl + 'update_customer_review_status',
                type: 'POST',
                data: { id: id, status: status },
                dataType: 'json',
                success: function (res) {
                    if (res.success) {
                        toaster('success', res.msg);
                    } else {
                        toaster('error', res.msg);
                    }
                }
            });
        });
    },

    handleDelete: function () {
        const that = this;
        $(document).on('click', '.delete-review', function () {
            const id = $(this).data('id');

            Swal.fire({
                title: 'Delete Review?',
                text: "This action cannot be undone!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: that.cleanBaseUrl + 'delete_customer_review',
                        type: 'POST',
                        data: { id: id },
                        dataType: 'json',
                        success: function (res) {
                            if (res.success) {
                                Swal.fire('Deleted!', res.msg, 'success');
                                that.table.ajax.reload(null, false);
                            } else {
                                toaster('error', res.msg);
                            }
                        }
                    });
                }
            });
        });
    }
};
