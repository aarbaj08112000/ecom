document.addEventListener("DOMContentLoaded", function () {

    // Register ScrollTrigger
    gsap.registerPlugin(ScrollTrigger);

    // Page Loader Transition
    const loader = document.createElement('div');
    loader.className = 'page-loader';
    // Using a FontAwesome shopping bag icon with the bounce animation class defined in CSS
    loader.innerHTML = '<i class="fas fa-shopping-bag loader-icon"></i>';
    document.body.appendChild(loader);

    window.addEventListener('load', () => {
        // Enforce a minimum 0.8 second display time for a snappier feel
        setTimeout(() => {
            gsap.to(loader, {
                opacity: 0,
                duration: 0.5,
                onComplete: () => {
                    loader.remove();
                    // Trigger generic entrance after loader is gone
                    // Hero Slider (only if Swiper is loaded and element exists)
                    if (typeof Swiper !== 'undefined' && document.querySelector(".hero-slider")) {
                        var heroSwiper = new Swiper(".hero-slider", {
                            loop: true,
                            autoplay: {
                                delay: 3000,
                                disableOnInteraction: false,
                            },
                            pagination: {
                                el: ".swiper-pagination",
                                clickable: true,
                            },
                            effect: 'fade',
                            fadeEffect: {
                                crossFade: true
                            }
                        });
                    }

                    // Reviews Slider (only if element exists)
                    if (typeof Swiper !== 'undefined' && document.querySelector(".reviews-slider")) {
                        var reviewsSwiper = new Swiper(".reviews-slider", {
                            loop: true,
                            autoplay: {
                                delay: 5000,
                            },
                            pagination: {
                                el: ".swiper-pagination",
                                clickable: true,
                            },
                        });
                    }

                    // Initialize AOS
                    AOS.init({
                        duration: 800,
                        once: true,
                        offset: 50
                    });
                    initAnimations();
                }
            });
        }, 800);
    });

    // Navbar Hide/Show on Scroll
    let lastScroll = 0;
    const nav = document.querySelector('.navbar');

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        // Add frosted glass effect
        if (currentScroll > 50) {
            nav.classList.add('scrolled');
        } else {
            nav.classList.remove('scrolled');
        }

        // Hide/Show logic
        if (currentScroll > lastScroll && currentScroll > 100) {
            // Scrolling Down
            nav.style.transform = 'translateY(-100%)';
        } else {
            // Scrolling Up
            nav.style.transform = 'translateY(0)';
        }
        lastScroll = currentScroll;
    });

    function initAnimations() {
        // Hero Text Stagger
        if (document.querySelector('.hero-section')) {
            const tl = gsap.timeline();
            tl.from(".hero-section h1", { y: 50, opacity: 0, duration: 1, ease: "power3.out" })
                .from(".hero-section p", { y: 30, opacity: 0, duration: 0.8, ease: "power3.out" }, "-=0.6")
                .from(".hero-section .btn-animate", { y: 20, opacity: 0, stagger: 0.2, duration: 0.6, ease: "back.out(1.7)" }, "-=0.6")
                .from(".hero-image-placeholder", { x: 50, opacity: 0, duration: 1, ease: "power2.out" }, "-=0.8");
        }

        // Product Cards Stagger
        gsap.utils.toArray('.product-card').forEach((card, i) => {
            gsap.from(card, {
                scrollTrigger: {
                    trigger: card,
                    start: "top 85%",
                },
                y: 50,
                opacity: 0,
                duration: 0.8,
                ease: "power2.out",
                delay: i * 0.1 // Simple index based delay (works best in grid if items are sequential)
            });
        });

        // Category Cards Scale
        gsap.utils.toArray('.category-card').forEach((card) => {
            gsap.from(card, {
                scrollTrigger: {
                    trigger: card,
                    start: "top 80%",
                },
                scale: 0.9,
                opacity: 0,
                duration: 0.6,
                ease: "back.out(1.5)"
            });
        });
    }

    // Hover Effects Logic using GSAP
    const productCards = document.querySelectorAll('.product-card');
    productCards.forEach(card => {
        card.addEventListener('mouseenter', () => {
            gsap.to(card, { y: -10, boxShadow: "0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)", duration: 0.3 });
            gsap.to(card.querySelector('img'), { scale: 1.05, duration: 0.5 });
        });
        card.addEventListener('mouseleave', () => {
            gsap.to(card, { y: 0, boxShadow: "0 0 #0000, 0 0 #0000", duration: 0.3 });
            gsap.to(card.querySelector('img'), { scale: 1, duration: 0.5 });
        });
    });

    // --- Premium UI Enhancements ---

    // 1. Lenis Smooth Scroll (only if library is loaded)
    if (typeof Lenis !== 'undefined') {
        const lenis = new Lenis();
        function raf(time) {
            lenis.raf(time);
            requestAnimationFrame(raf);
        }
        requestAnimationFrame(raf);
    }

    // 2. Magnetic Buttons
    const magneticBtns = document.querySelectorAll('.btn-animate'); // Applying to existing animated buttons for now
    magneticBtns.forEach(btn => {
        btn.classList.add('btn-magnetic'); // Ensure class is there
        btn.addEventListener('mousemove', (e) => {
            const rect = btn.getBoundingClientRect();
            const x = e.clientX - rect.left - rect.width / 2;
            const y = e.clientY - rect.top - rect.height / 2;

            // magnetic pull strength
            gsap.to(btn, {
                x: x * 0.3,
                y: y * 0.3,
                duration: 0.3,
                ease: "power2.out"
            });
        });

        btn.addEventListener('mouseleave', () => {
            gsap.to(btn, { x: 0, y: 0, duration: 0.5, ease: "elastic.out(1, 0.3)" });
        });
    });

    // 3. Hero 3D Tilt Effect
    const heroSection = document.querySelector('.hero-section');
    const heroImage = document.querySelector('.hero-image-placeholder');

    if (heroSection && heroImage) {
        heroSection.addEventListener('mousemove', (e) => {
            const x = (window.innerWidth / 2 - e.clientX) / 20;
            const y = (window.innerHeight / 2 - e.clientY) / 20;

            gsap.to(heroImage, {
                rotationY: x,
                rotationX: y,
                ease: "power1.out",
                duration: 0.5
            });
        });

        // Reset on leave
        heroSection.addEventListener('mouseleave', () => {
            gsap.to(heroImage, { rotationY: 0, rotationX: 0, ease: "power1.out", duration: 0.5 });
        });
    }

    // Skeleton Simulation (Existing)
    const skeletonContainer = document.getElementById('trending-skeleton');
    const realContent = document.getElementById('trending-content');

    if (skeletonContainer && realContent) {
        setTimeout(() => {
            skeletonContainer.classList.add('d-none');
            realContent.classList.remove('d-none');

            // Re-trigger GSAP for the newly revealed elements
            gsap.utils.toArray('#trending-content .product-card').forEach((card, i) => {
                gsap.from(card, {
                    y: 30,
                    opacity: 0,
                    duration: 0.6,
                    delay: i * 0.1,
                    ease: "power2.out"
                });
            });

            // Initialize Quick View Triggers for these new items
            initQuickView();

        }, 2000); // 2 second fake delay
    }

    // Initial Quick View Bind (for static items if any)
    initQuickView();

    function initQuickView() {
        const quickViewBtns = document.querySelectorAll('button[title="Quick View"]');
        const modalEl = document.getElementById('quickViewModal');
        if (quickViewBtns.length > 0 && modalEl) {
            const modal = new bootstrap.Modal(modalEl);
            quickViewBtns.forEach(btn => {
                // Remove old listeners to prevent duplicates if re-init
                const newBtn = btn.cloneNode(true);
                btn.parentNode.replaceChild(newBtn, btn);

                newBtn.addEventListener('click', (e) => {
                    e.preventDefault();
                    modal.show();
                });
            });
        }
    }

});
