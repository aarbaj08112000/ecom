<style>
:root {
    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    --accent-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
}

body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    overflow: auto;
}

.inprogress-wrapper {
    padding: 50px 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
    background-size: 400% 400%;
    animation: gradientShift 15s ease infinite;
    position: relative;
}

@keyframes gradientShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Animated background particles */
.particles {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    z-index: 1;
}

.particle {
    position: absolute;
    width: 4px;
    height: 4px;
    background: rgba(255, 255, 255, 0.4);
    border-radius: 50%;
    animation: float 20s infinite;
}

.particle:nth-child(1) { left: 10%; animation-delay: 0s; }
.particle:nth-child(2) { left: 20%; animation-delay: 2s; }
.particle:nth-child(3) { left: 30%; animation-delay: 4s; }
.particle:nth-child(4) { left: 40%; animation-delay: 1s; }
.particle:nth-child(5) { left: 50%; animation-delay: 3s; }
.particle:nth-child(6) { left: 60%; animation-delay: 5s; }
.particle:nth-child(7) { left: 70%; animation-delay: 1.5s; }
.particle:nth-child(8) { left: 80%; animation-delay: 2.5s; }
.particle:nth-child(9) { left: 90%; animation-delay: 4.5s; }
.particle:nth-child(10) { left: 15%; animation-delay: 6s; }

@keyframes float {
    0% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
    10% { opacity: 1; }
    90% { opacity: 1; }
    100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
}

.content-container {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    padding: 60px 40px;
    border-radius: 30px;
    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.3);
    max-width: 700px;
    width: 90%;
    text-align: center;
    position: relative;
    z-index: 2;
    animation: slideUp 0.8s ease-out;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.icon-container {
    margin-bottom: 30px;
    animation: bounce 2s infinite;
}

@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
}

.icon-container i {
    font-size: 80px;
    background: var(--primary-gradient);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.main-title {
    font-size: 3.5rem;
    font-weight: 800;
    background: var(--primary-gradient);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 15px;
    animation: fadeInDown 1s ease-out;
}

@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.subtitle {
    font-size: 1.4rem;
    color: #555;
    margin-bottom: 20px;
    font-weight: 500;
    animation: fadeIn 1.2s ease-out 0.3s both;
}

.description {
    font-size: 1rem;
    color: #777;
    margin-bottom: 40px;
    line-height: 1.8;
    animation: fadeIn 1.4s ease-out 0.5s both;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-top: 40px;
}

.feature-card {
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    padding: 25px 20px;
    border-radius: 20px;
    border: 2px solid rgba(102, 126, 234, 0.2);
    transition: all 0.3s ease;
    animation: fadeInUp 1s ease-out backwards;
}

.feature-card:nth-child(1) { animation-delay: 0.7s; }
.feature-card:nth-child(2) { animation-delay: 0.9s; }
.feature-card:nth-child(3) { animation-delay: 1.1s; }

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 40px rgba(102, 126, 234, 0.3);
    border-color: rgba(102, 126, 234, 0.5);
}

.feature-icon {
    font-size: 40px;
    margin-bottom: 15px;
    background: var(--secondary-gradient);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.feature-title {
    font-size: 1.1rem;
    font-weight: 700;
    color: #333;
    margin-bottom: 8px;
}

.feature-desc {
    font-size: 0.9rem;
    color: #666;
}

.progress-bar-container {
    margin: 40px 0;
    position: relative;
}

.progress-label {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    font-size: 0.9rem;
    color: #666;
    font-weight: 600;
}

.progress-bar {
    width: 100%;
    height: 12px;
    background: rgba(102, 126, 234, 0.1);
    border-radius: 10px;
    overflow: hidden;
    position: relative;
}

.progress-fill {
    height: 100%;
    background: var(--primary-gradient);
    border-radius: 10px;
    width: 75%;
    animation: progressAnimation 2s ease-out forwards;
    position: relative;
    overflow: hidden;
}

@keyframes progressAnimation {
    from { width: 0%; }
    to { width: 75%; }
}

.progress-fill::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
    animation: shimmer 2s infinite;
}

@keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

.cta-button {
    display: inline-block;
    padding: 18px 50px;
    background: var(--primary-gradient);
    color: white;
    text-decoration: none;
    border-radius: 50px;
    font-weight: 700;
    font-size: 1.1rem;
    margin-top: 30px;
    box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
}

.cta-button:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(102, 126, 234, 0.6);
}

.social-links {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 30px;
}

.social-link {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    color: #667eea;
    font-size: 20px;
    transition: all 0.3s ease;
}

.social-link:hover {
    transform: translateY(-5px) rotate(360deg);
    background: var(--primary-gradient);
    color: white;
}

/* Responsive Design */
@media (max-width: 768px) {
    .main-title {
        font-size: 2.5rem;
    }
    
    .subtitle {
        font-size: 1.1rem;
    }
    
    .content-container {
        padding: 40px 25px;
    }
    
    .features-grid {
        grid-template-columns: 1fr;
    }
}
</style>

<div class="inprogress-wrapper">
    <!-- Animated particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Main content -->
    <div class="content-container">
        <div class="icon-container">
            <i class="ti ti-rocket"></i>
        </div>
        
        <h1 class="main-title">Coming Soon</h1>
        <p class="subtitle">Something Amazing is On The Way!</p>
        <p class="description">
            We're working hard to bring you an incredible experience. This feature is currently under development 
            and will be available soon. Stay tuned for updates!
        </p>

        <!-- Progress Bar -->
        <div class="progress-bar-container">
            <div class="progress-label">
                <span>Development Progress</span>
                <span>75%</span>
            </div>
            <div class="progress-bar">
                <div class="progress-fill"></div>
            </div>
        </div>

        <!-- Features -->
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="ti ti-bolt"></i>
                </div>
                <div class="feature-title">Lightning Fast</div>
                <div class="feature-desc">Optimized for speed and performance</div>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="ti ti-shield-check"></i>
                </div>
                <div class="feature-title">Secure & Safe</div>
                <div class="feature-desc">Built with security in mind</div>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="ti ti-sparkles"></i>
                </div>
                <div class="feature-title">Modern Design</div>
                <div class="feature-desc">Beautiful and intuitive interface</div>
            </div>
        </div>

        <!-- CTA Button -->
        <button class="cta-button" onclick="window.history.back()">
            <i class="ti ti-arrow-left"></i> Go Back
        </button>

        <!-- Social Links -->
        <div class="social-links">
            <a href="#" class="social-link" title="Facebook">
                <i class="ti ti-brand-facebook"></i>
            </a>
            <a href="#" class="social-link" title="Twitter">
                <i class="ti ti-brand-twitter"></i>
            </a>
            <a href="#" class="social-link" title="Instagram">
                <i class="ti ti-brand-instagram"></i>
            </a>
            <a href="#" class="social-link" title="LinkedIn">
                <i class="ti ti-brand-linkedin"></i>
            </a>
        </div>
    </div>
</div>
