<%include file="layout/header.tpl"%>

<!-- FAQs Page -->
<div class="py-5 bg-light">
    <div class="container">
        <div class="text-center mb-5" data-aos="fade-down">
            <h2 class="fw-bold mb-3" style="font-family: var(--font-heading);">Frequently Asked Questions</h2>
            <p class="text-muted">Find answers to common questions about our products, shipping, and more.</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="accordion accordion-flush bg-transparent" id="faqAccordion">
                    
                    <!-- Item 1 -->
                    <div class="accordion-item bg-white border-0 shadow-sm rounded-4 mb-3 overflow-hidden" data-aos="fade-up" data-aos-delay="100">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold p-4 bg-white shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                Can I customize my order?
                            </button>
                        </h2>
                        <div id="faq1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body px-4 pb-4 pt-2 text-muted">
                                Absolutely! Many of our items, especially in Resin Art and Crochet, are customizable. Look for the "Custom Order" button on applicable product pages or contact us directly with your requirements.
                            </div>
                        </div>
                    </div>

                    <!-- Item 2 -->
                    <div class="accordion-item bg-white border-0 shadow-sm rounded-4 mb-3 overflow-hidden" data-aos="fade-up" data-aos-delay="200">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold p-4 bg-white shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                How long does shipping take?
                            </button>
                        </h2>
                        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body px-4 pb-4 pt-2 text-muted">
                                Standard shipping typically takes 5-7 business days. For custom orders, please allow an additional 3-5 days for production before shipping. You can find more details in our Shipping Policy.
                            </div>
                        </div>
                    </div>

                    <!-- Item 3 -->
                    <div class="accordion-item bg-white border-0 shadow-sm rounded-4 mb-3 overflow-hidden" data-aos="fade-up" data-aos-delay="300">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold p-4 bg-white shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                Do you offer gift wrapping?
                            </button>
                        </h2>
                        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body px-4 pb-4 pt-2 text-muted">
                                Yes! We offer beautiful, eco-friendly gift wrapping for a small additional fee. You can select this option at checkout and even include a personalized note.
                            </div>
                        </div>
                    </div>

                    <!-- Item 4 -->
                    <div class="accordion-item bg-white border-0 shadow-sm rounded-4 mb-3 overflow-hidden" data-aos="fade-up" data-aos-delay="400">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold p-4 bg-white shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                                What is your return policy?
                            </button>
                        </h2>
                        <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body px-4 pb-4 pt-2 text-muted">
                                We accept returns within 30 days of delivery for most items, provided they are unused and in original packaging. Personalized items are generally non-returnable unless defective.
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="text-center mt-5">
                    <p class="text-muted">Still have questions?</p>
                    <a href="<%base_url('shop/contact')%>" class="btn btn-outline-primary rounded-pill px-4">Contact Support</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%include file="layout/footer.tpl"%>
