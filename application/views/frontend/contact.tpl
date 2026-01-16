<%include file="layout/header.tpl"%>

<div class="contact-page">
    <!-- Hero Section -->
    <section class="position-relative py-5 bg-light overflow-hidden">
        <div class="position-absolute top-0 start-0 w-100 h-100 opacity-10" style="background: url('https://www.transparenttextures.com/patterns/creampaper.png');"></div>
        <div class="container position-relative py-5">
            <div class="row justify-content-center text-center">
                <div class="col-lg-8">
                    <span class="d-inline-block py-1 px-3 rounded-pill bg-primary-subtle text-primary fw-bold small mb-3">Get In Touch</span>
                    <h1 class="display-4 fw-bold mb-3" style="font-family: var(--font-heading);">We'd Love to Hear From You</h1>
                    <p class="lead text-muted mb-0">Have a question about a custom order or just want to say hi? We're here to help!</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Content -->
    <section class="py-5" style="background-color: var(--light);">
        <div class="container py-lg-4">
            <div class="row g-5">
                <!-- Contact Form -->
                <div class="col-lg-7">
                    <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden">
                        <div class="card-body p-5">
                            <h3 class="fw-bold mb-4" style="font-family: var(--font-heading);">Send us a Message</h3>
                            <form id="contactForm" method="POST" action="javascript:void(0);">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control bg-light border-0 rounded-3" id="contactName" name="contact_name" placeholder="Your Name">
                                            <label for="contactName">Your Name</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="email" class="form-control bg-light border-0 rounded-3" id="contactEmail" name="contact_email" placeholder="name@example.com">
                                            <label for="contactEmail">Email Address</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <select class="form-select bg-light border-0 rounded-3" id="contactSubject" name="contact_subject">
                                                <option value="">Select Subject</option>
                                                <option value="General Inquiry">General Inquiry</option>
                                                <option value="Custom Order Request">Custom Order Request</option>
                                                <option value="Order Status">Order Status</option>
                                                <option value="Collaboration">Collaboration</option>
                                            </select>
                                            <label for="contactSubject">Subject</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control bg-light border-0 rounded-3" placeholder="Leave a message here" id="contactMessage" name="contact_message" style="height: 150px"></textarea>
                                            <label for="contactMessage">Your Message</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary rounded-pill px-5 py-3 fw-bold shadow-sm btn-animate">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Contact Info -->
                <div class="col-lg-5">
                    <div class="d-flex flex-column gap-4 h-100">
                        <!-- Info Card -->
                        <div class="card border-0 shadow-sm rounded-4 bg-primary text-white p-4 position-relative overflow-hidden">
                            <div class="position-absolute top-0 end-0 opacity-10 translate-middle-y me-n4 mt-4">
                                <i class="ti ti-message-circle fs-1" style="font-size: 8rem !important;"></i>
                            </div>
                            <div class="position-relative z-1">
                                <h4 class="fw-bold mb-4" style="font-family: var(--font-heading);">Contact Information</h4>
                                <div class="d-flex align-items-start gap-3 mb-4">
                                    <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center" style="width:40px;height:40px;">
                                        <i class="ti ti-map-pin"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Our Studio</h6>
                                        <p class="mb-0 small text-white-50"><%if isset($config['contact_location']) && $config['contact_location'] != ''%><%$config['contact_location']|nl2br%><%else%>123 Creative Avenue, Art District<br>Mumbai, Maharashtra, 400001<%/if%></p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start gap-3 mb-4">
                                    <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center" style="width:40px;height:40px;">
                                        <i class="ti ti-mail"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Email Us</h6>
                                        <p class="mb-0 small text-white-50"><%if isset($config['company_email']) && $config['company_email'] != ''%><%$config['company_email']%><%else%>hello@craftology.com<br>support@craftology.com<%/if%></p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center" style="width:40px;height:40px;">
                                        <i class="ti ti-phone"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Call Us</h6>
                                        <p class="mb-0 small text-white-50"><%if isset($config['contact_phone']) && $config['contact_phone'] != ''%><%$config['contact_phone']|nl2br%><%else%>+91 98765 43210<br>Mon - Fri, 9am - 6pm<%/if%></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- FAQ / Trust Card -->
                        <div class="card border-0 shadow-sm rounded-4 p-4 bg-white flex-grow-1">
                            <h5 class="fw-bold mb-3" style="font-family: var(--font-heading);">Why Choose Craftology?</h5>
                            <ul class="list-unstyled mb-0 d-flex flex-column gap-3">
                                <li class="d-flex gap-3 align-items-center">
                                    <i class="ti ti-heart-handshake text-secondary fs-4"></i>
                                    <div>
                                        <span class="fw-bold d-block text-dark">Handmade with Love</span>
                                        <span class="small text-muted">Every item is unique and crafted with care.</span>
                                    </div>
                                </li>
                                <li class="d-flex gap-3 align-items-center">
                                    <i class="ti ti-shield-check text-primary fs-4"></i>
                                    <div>
                                        <span class="fw-bold d-block text-dark">Secure Payments</span>
                                        <span class="small text-muted">100% secure checkout process.</span>
                                    </div>
                                </li>
                                <li class="d-flex gap-3 align-items-center">
                                    <i class="ti ti-truck-delivery text-warning fs-4"></i>
                                    <div>
                                        <span class="fw-bold d-block text-dark">Fast Shipping</span>
                                        <span class="small text-muted">Reliable delivery partners across India.</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <div class="bg-secondary-subtle" style="height: 350px;">
        <iframe src="<%if isset($config['google_map_location']) && $config['google_map_location'] != ''%><%$config['google_map_location']%><%else%>https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3770.817359556488!2d72.82583831490216!3d19.07185598709121!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c91c32729793%3A0x6968d87747551e7a!2sBandra%20West%2C%20Mumbai%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1633519392237!5m2!1sen!2sin<%/if%>" style="border:0; width: 100%; height: 100%;" allowfullscreen="" loading="lazy"></iframe>
    
        </div>
</div>

<%include file="layout/footer.tpl"%>

<script>
$(document).ready(function() {
    // Initialize form validation
    $('#contactForm').validate({
        rules: {
            contact_name: {
                required: true,
                minlength: 2
            },
            contact_email: {
                required: true,
                email: true
            },
            contact_subject: {
                required: true
            },
            contact_message: {
                required: true,
                minlength: 10
            }
        },
        messages: {
            contact_name: {
                required: "Please enter your name",
                minlength: "Name must be at least 2 characters"
            },
            contact_email: {
                required: "Please enter your email address",
                email: "Please enter a valid email address"
            },
            contact_subject: {
                required: "Please select a subject"
            },
            contact_message: {
                required: "Please enter your message",
                minlength: "Message must be at least 10 characters"
            }
        },
        errorElement: 'div',
        errorClass: 'text-danger small mt-1',
        submitHandler: function(form) {
            // Get form data
            var formData = $(form).serialize();
            
            // Disable submit button to prevent double submission
            var submitBtn = $(form).find('button[type="submit"]');
            var originalText = submitBtn.html();
            submitBtn.prop('disabled', true).html('<i class="ti ti-loader"></i> Sending...');
            
            // Submit via AJAX
            $.ajax({
                url: '<%base_url("shop/submit-contact")%>',
                type: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        toaster('success', response.message);
                        // Reset form on success
                        $('#contactForm')[0].reset();
                        $('#contactForm').validate().resetForm();
                    } else {
                        toaster('error', response.message);
                    }
                },
                error: function() {
                    toaster('error', 'An error occurred while sending your message. Please try again later.');
                },
                complete: function() {
                    // Re-enable submit button
                    submitBtn.prop('disabled', false).html(originalText);
                }
            });
            
            return false;
        }
    });
});
</script>
