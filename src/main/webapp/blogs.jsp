<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FundSense Blog</title>
    <link rel="stylesheet" href="blogcss.css">
</head>
<body>

<nav class="sticky-nav">
    <div class="logo-container1"> 
        <img src="/images/logo-black.png" alt="FundSense Logo" class="logo-img1">
    </div>
    <div class="button-container1"> 
        <a href="index" class="header-btn1">Home</a>
        <a href="investorlogin" class="header-btn1">Log In</a>
        <a href="register" class="header-btn1 primary-btn1">Sign Up</a>
    </div>
</nav>

<div class="header-section">
    <h1 class="main-heading">From Local Advancements<br>to Global Changes</h1>
    <div class="search-wrapper">
    <div class="search-bar-container">
        <input type="text" class="search-input" placeholder="Search resources...">
        <button class="search-button">
            <img src="images/search.png" alt="Search Icon" class="search-icon">
        </button>
    </div>
    </div>
    <div class="suggestions">
        <span>Top Suggestion:</span>
        <a href="all" class="suggestion-link">All</a>
        <a href="toppicks" class="suggestion-link">Top Picks</a>
        <a href="fundframeworks" class="suggestion-link">Fund Framework</a>
        <a href="markettrends" class="suggestion-link">Market Trends</a>
    </div>
</div>

<div class="featured-blogs-section">
    <div class="featured-header">
        <h2 class="featured-title">Featured Blogs</h2>
        <a href="#" class="browse-more">Browse More Blogs <img src="images/arrow.png" alt="Arrow Icon"></a>
    </div>
    
    <!-- First row of blogs -->
    <div class="blogs-container">
        <!-- Blog 1 -->
        <a href="investment-strategies.jsp" class="left-blog">
            <div class="blog-text-top">
                <h3 class="blog-title">Investment Strategies</h3>
                <span class="blog-date">October 25, 2024</span>
            </div>
            <img src="images/blog1.jpg" alt="Blog Image 1" class="blog-image">
        </a>

        <div class="blog-gap"></div>

        <!-- Blog 2 -->
        <a href="global-market-analysis.jsp" class="right-blog">
            <img src="images/blog2.jpg" alt="Blog Image 2" class="blog-image">
            <div class="blog-text-bottom">
                <h3 class="blog-title">Global Market Analysis</h3>
                <span class="blog-date">October 30, 2024</span>
            </div>
        </a>
    </div>

    <!-- Second row of blogs -->
    <div class="blogs-container">
        <!-- Blog 3 -->
        <a href="emerging-markets.jsp" class="left-blog">
            <div class="blog-text-top">
                <h3 class="blog-title">Emerging Markets</h3>
                <span class="blog-date">November 2, 2024</span>
            </div>
            <img src="images/blog3.jpg" alt="Blog Image 3" class="blog-image">
        </a>

        <div class="blog-gap"></div>

        <!-- Blog 4 -->
        <a href="sustainable-investments.jsp" class="right-blog">
            <img src="images/blog4.jpg" alt="Blog Image 4" class="blog-image">
            <div class="blog-text-bottom">
                <h3 class="blog-title">Sustainable Investments</h3>
                <span class="blog-date">November 5, 2024</span>
            </div>
        </a>
    </div>
</div>

    
<div class="recent-posts-section">
    <div class="recent-header">
        <h2 class="featured-title">Recent Posts</h2>
        <a href="#" class="recent-browse-more">Browse More Recent Posts <img src="images/arrow.png" alt="arrow"></a>
    </div>
    <div class="recent-posts-container">
        <!-- Recent Post 1 -->
        <a href="post-title-1.jsp" class="recent-post">
            <div class="recent-image"><img src="image1.jpg" alt="Recent Post Image 1"></div>
            <h3 class="recent-title">Post Title 1</h3>
            <span class="recent-date">October 25, 2024</span>
        </a>

        <!-- Recent Post 2 -->
        <a href="post-title-2.jsp" class="recent-post">
            <div class="recent-image"><img src="image2.jpg" alt="Recent Post Image 2"></div>
            <h3 class="recent-title">Post Title 2</h3>
            <span class="recent-date">October 30, 2024</span>
        </a>
    </div>
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
