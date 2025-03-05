<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FundSense</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    
</head>
<body>
    <!-- News section -->
    <div class="background">
        <div class="content-container">
            <div style="opacity: 1; transform: none;">
                <div class="news-item">
                    <img src="/images/rocket.png" alt="rocket image" class="rocket-img">
                    <a href="https://economictimes.indiatimes.com/defaultinterstitial.cms" target="_blank" class="news-link">
                        <p>FundSense Raises <span class="bold-text">$1.2M</span> Seed round to revolutionize mutual fund investments and empower investors with advanced insights</p>
                    </a>
                    <button class="read-more-btn" onclick="window.open('https://economictimes.indiatimes.com/defaultinterstitial.cms', '_blank')">
                        Read-On
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Header Section -->
    <header class="header">
        <div class="header-container">
            <div class="logo-container">
                <img src="/images/logo-white.png" alt="FundSense Logo" class="logo-img">
            </div>
            <div class="button-container">
                <a href="blogs" class="header-btn">Blogs</a>
                <a href="selectrole" class="header-btn">Log In</a>
                <a href="register" class="header-btn primary-btn">Sign Up</a>
            </div>
        </div>
    </header>

    <!-- Sticky Navbar -->
<nav class="sticky-nav" id="stickyNavbar">
    <div class="logo-container1"> 
        <img src="/images/logo-black.png" alt="FundSense Logo" class="logo-img1">
    </div>
    <div class="button-container1"> 
        <a href="blogs" class="header-btn1">Blogs</a>
        <a href="selectrole" class="header-btn1">Log In</a>
        <a href="register" class="header-btn1 primary-btn1">Sign Up</a>
    </div>
</nav>

    <!-- Main Content -->
    <main class="main-content">
        <div class="content">
            <div class="flex-container">
                <!-- Left Side (Caption and Play Button) -->
                <div class="left-content">
                    <h1>Invest in the Future with <span class="highlight">FundSense</span></h1>
                    <p>Discover smarter ways to manage and grow your mutual fund investments <br>with expert insights and personalized solutions from FundSense.</p>
                    <div class="caption-line">
                        <p>Check out the FundSense Difference</p>
                        <div class="play-icon">&#9658;</div> <!-- Unicode for play icon -->
                    </div>
                </div>

                <!-- Right Side (Images) -->
                <div class="right-content">
                    <div class="image-container">
                        <img src="/images/side1.png" alt="Main Image" class="main-img">
                        <img src="/images/side2.png" alt="Top Right Image" class="top-right-img">
                        <img src="/images/side3.png" alt="Top Left Image" class="top-left-img">
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Features Section -->
    <section class="features-section">
        <div class="features-container">
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'fund-discovery')">
                <img src="/images/discover.png" alt="Fund Discovery Icon" class="feature-icon">
                <h3><span class="white-text">Fund</span> <span class="purple1-text">Discovery</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'portfolio-builder')">
                <img src="/images/portfolio.png" alt="Portfolio Builder Icon" class="feature-icon">
                <h3><span class="white-text">Portfolio</span> <span class="purple1-text">Builder</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'investment-insights')">
                <img src="/images/investment.png" alt="Investment Insights Icon" class="feature-icon">
                <h3><span class="white-text">Investment</span> <span class="purple1-text">Insights</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'performance-tracking')">
                <img src="/images/tracking.png" alt="Performance Tracking Icon" class="feature-icon">
                <h3><span class="white-text">Performance</span> <span class="purple1-text">Tracking</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'consultations')">
                <img src="/images/consultations.png" alt="Consultations Icon" class="feature-icon">
                <h3><span class="white-text">Expert</span> <span class="purple1-text">Consultations</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'fund-comparisons')">
                <img src="/images/comparisons.png" alt="Fund Comparisons Icon" class="feature-icon">
                <h3><span class="white-text">Fund</span> <span class="purple1-text">Comparisons</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'investment-dashboard')">
                <img src="/images/dashboard.png" alt="Investment Dashboard Icon" class="feature-icon">
                <h3><span class="white-text">Investment</span> <span class="purple1-text">Dashboard</span></h3>
            </div>
            <div class="feature-item" onclick="addUnderlineAndShowDetails(this, 'customer-support-chat')">
                <img src="/images/chat.png" alt="Customer Support Chat Icon" class="feature-icon">
                <h3><span class="white-text">Customer</span> <span class="purple1-text">Support Chat</span></h3>
            </div>
        </div>
    </section>

    <!-- Feature Details Section -->
    <div id="feature-details" class="feature-details">
        <div class="feature-details-content">
            <!-- Left Side: Text -->
            <div class="feature-details-text">
                <h2 id="feature-details-title">
                    <span class="black-text"></span> <span class="purple-text"></span>
                </h2>
                <div id="feature-hashtags" class="hashtags">
                    <span>#hashtag1</span> <span>#hashtag2</span>
                </div>
                <p id="feature-details-description"></p>
            </div>
            <!-- Right Side: Image -->
            <div class="feature-details-image">
                <img id="feature-details-img" src="" alt="Feature Image">
            </div>
        </div>
    </div>

    <!-- JavaScript -->
   <script>
   let featureIndex = 0;
   let autoRotation;
   let clickedManually = false;

   const featureData = {
       'fund-discovery': {
           title: 'Fund Discovery',
           description: 'Explore various mutual funds that match your investment goals. Use our advanced filters to find the best funds for your portfolio.',
           img: '/images/fund-discovery.png',
           hashtags: '#FundDiscovery #InvestSmart',
       },
       'portfolio-builder': {
           title: 'Portfolio Builder',
           description: 'Create and manage your own investment portfolio with ease. Get personalized recommendations based on your preferences.',
           img: '/images/portfolio-builder.png',
           hashtags: '#PortfolioBuilder #InvestmentStrategy',
       },
       'investment-insights': {
           title: 'Investment Insights',
           description: 'Stay informed with our comprehensive market analysis and investment insights tailored to your needs.',
           img: '/images/investment-insights.png',
           hashtags: '#InvestmentInsights #MarketAnalysis',
       },
       'performance-tracking': {
           title: 'Performance Tracking',
           description: 'Monitor the performance of your investments in real-time. Get notifications and insights to optimize your strategy.',
           img: '/images/performance-tracking.png',
           hashtags: '#PerformanceTracking #InvestmentSuccess',
       },
       'consultations': {
           title: 'Expert Consultations',
           description: 'Book a one-on-one consultation with our investment experts to discuss your financial goals and strategies.',
           img: '/images/consultations1.png',
           hashtags: '#Consultations #FinancialAdvice',
       },
       'fund-comparisons': {
           title: 'Fund Comparisons',
           description: 'Compare different mutual funds and choose the best options for your investment strategy.',
           img: '/images/fund-comparisons.png',
           hashtags: '#FundComparisons #InvestmentChoices',
       },
       'investment-dashboard': {
           title: 'Investment Dashboard',
           description: 'Get an overview of your investments with our intuitive dashboard. Analyze trends and performance at a glance.',
           img: '/images/investment-dashboard.png',
           hashtags: '#InvestmentDashboard #InvestingMadeEasy',
       },
       'customer-support-chat': {
           title: 'Customer Support Chat',
           description: 'Need assistance? Chat with our support team for any questions or concerns regarding your investments.',
           img: '/images/customer-support-chat.png',
           hashtags: '#CustomerSupport #ChatWithUs',
       },
   };

   const featureItems = document.querySelectorAll('.feature-item');

   function addUnderlineAndShowDetails(selectedItem, feature) {
       clickedManually = true;
       clearInterval(autoRotation);

       featureItems.forEach(item => item.classList.remove('active'));
       selectedItem.classList.add('active');

       const selectedFeature = featureData[feature];
       const titleWords = selectedFeature.title.split(' ');

       document.querySelector('.black-text').innerText = titleWords[0] || '';
       document.querySelector('.purple-text').innerText = titleWords[1] || '';
       
       const hashtagsContainer = document.getElementById('feature-hashtags');
       hashtagsContainer.innerHTML = selectedFeature.hashtags.split(' ').map(tag => `<span>${tag}</span>`).join(' '); // Corrected here

       document.getElementById('feature-details-description').innerText = selectedFeature.description;
       document.getElementById('feature-details-img').src = selectedFeature.img; // Corrected property name here

       document.getElementById('feature-details').style.display = 'flex';

       setTimeout(() => {
           clickedManually = false;
           startAutoRotation();
       }, 5000); // Restart auto rotation after 5 seconds
   }

   function startAutoRotation() {
       autoRotation = setInterval(() => {
           if (!clickedManually) {
               featureIndex = (featureIndex + 1) % featureItems.length;
               const featureItem = featureItems[featureIndex];
               const featureKey = featureItem.querySelector('h3').innerText.toLowerCase().replace(' ', '-');
               addUnderlineAndShowDetails(featureItem, featureKey);
           }
       }, 5000); // Time between rotations
   }

   function initializeFirstFeature() {
       const firstFeatureItem = featureItems[0];
       const firstFeatureKey = firstFeatureItem.querySelector('h3').innerText.toLowerCase().replace(' ', '-');
       addUnderlineAndShowDetails(firstFeatureItem, firstFeatureKey);
   }

   window.onload = () => {
       initializeFirstFeature();
       startAutoRotation(); // Start automatic rotation after initializing the first feature
   };

     // JavaScript to handle sticky navbar
        window.addEventListener('scroll', () => {
            const stickyNavbar = document.getElementById('stickyNavbar');
            if (window.scrollY > 0) {
                stickyNavbar.classList.add('scrolled');
            } else {
                stickyNavbar.classList.remove('scrolled');
            }
        });
     
    </script>

<div class="cta-section">
    <h2>Ready to dive in?</h2>
    <button class="cta-button">Try it risk-free today!</button>
    <p>Start your journey with us!</p>
</div>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-brand">
            <img src="/images/logo-white.png" alt="FundSense Logo" class="footer-logo">
            <p>Made with &#x2764; from India for the World</p>
            <p>FundSense Technologies Pvt. Ltd, Sector 1, HSR Layout, Bangalore 560101</p>
            <div class="social-icons">
                <a href="https://www.instagram.com/"><img src="/images/Linkedin.svg" alt="LinkedIn"></a>
                <a href="https://www.linkedin.com/"><img src="/images/Twitter.svg" alt="Twitter"></a>
                <a href="https://x.com/"><img src="/images/Instagram.svg" alt="Instagram"></a>
            </div>
            <p> © 2024 FundSense. Copyright and rights reserved</p>
        </div>
        
        <div class="footer-links">
            <div class="footer-section">
                <h3>Product</h3>
                <ul>
                    <li><a href="#">Get Started</a></li>
                    <li><a href="#">Request Demo</a></li>
                    <li><a href="#">Pricing</a></li>
                    <li><a href="#">Integrations</a></li>
                    <li><a href="#">For Investors</a></li>
                    <li><a href="#">About</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Company</h3>
                <ul>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Terms of Use</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Blogs</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Legal</h3>
                <ul>
                    <li><a href="#">Cookie Policy</a></li>
                </ul>
            </div>
        </div>
        
        <div class="subscribe-section">
            <input type="email" placeholder="Email"> &nbsp; &nbsp;
            <button class="subscribe-button">Subscribe</button>
        </div>
    </div>
</footer>

</body>
</html>
