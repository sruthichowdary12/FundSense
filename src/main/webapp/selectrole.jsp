<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FundSense</title>
  <style>
    body {
      margin: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen",
        "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
        sans-serif;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
      background-color: #fff;
      color: #5500aa;
      user-select: none;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .card-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 2rem;
      padding: 2rem;
    }

    .nft {
      max-width: 250px;
      border: 1px solid #ffffff22;
      background-color: #6D5DE7;
      background: #6559C1;
      box-shadow: 0 7px 20px 5px #00000088;
      border-radius: .7rem;
      backdrop-filter: blur(7px);
      -webkit-backdrop-filter: blur(7px);
      overflow: hidden;
      transition: .5s all;
    }

    .nft hr {
      width: 100%;
      border: none;
      border-bottom: 1px solid #88888855;
      margin-top: 0;
    }

    .nft ins {
      text-decoration: none;
    }

    .nft .main {
      display: flex;
      flex-direction: column;
      width: 90%;
      padding: 1rem;
    }

    .nft .main .tokenImage {
      border-radius: .5rem;
      max-width: 100%;
      height: 250px;
      object-fit: cover;
    }

    .nft .main h2 {
      margin: 0.5rem 0;
      color: #ffffff; /* Admin word color set to white */
      text-align: center;
    }

    .nft .main .tokenInfo {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .nft .main .header-btn {
      padding: 10px 20px;
      border: none;
      color: white;
      background: linear-gradient(45deg, #6D5DE7, #9F86FF);
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .nft .main .header-btn:hover {
      background: linear-gradient(45deg, #9F86FF, #6D5DE7);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      transform: scale(1.05);
    }
    
    .nft .main .tokenInfo1 {
  display: flex;
  justify-content: center; /* Center the button(s) */
  align-items: center;
}

.nft .main .header-btn1 {
  padding: 10px 20px;
  border: none;
  color: white;
  background: linear-gradient(45deg, #6D5DE7, #9F86FF);
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.3s ease;
}

.nft .main .header-btn1:hover {
  background: linear-gradient(45deg, #9F86FF, #6D5DE7);
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
  transform: scale(1.05);
}
    

    .nft:hover {
      border: 1px solid #ffffff44;
      box-shadow: 0 7px 50px 10px #000000aa;
      transform: scale(1.015);
      filter: brightness(1.3);
    }

    .bg {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: -1;
    }

    .bg h1 {
      font-size: 18rem;
      filter: opacity(0.1);
    }
  </style>
</head>

<body>
  <div class="bg">
    <h1>FundSense</h1>
  </div>
  <div class="card-container">
    <!-- Card 1 -->
    <div class="nft">
      <div class="main">
        <img class="tokenImage" src="https://images.unsplash.com/photo-1621075160523-b936ad96132a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80" alt="NFT" />
        <h2>ADMIN</h2>
        <div class="tokenInfo1">
          <a href="adminlogin.jsp" class="header-btn1">Log In</a>
        </div>
        <hr />
      </div>
    </div>
    <div class="nft">
      <div class="main">
        <img class="tokenImage" src="https://images.unsplash.com/photo-1621075160523-b936ad96132a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80" alt="NFT" />
        <h2>FINANCIAL ADVISOR</h2>
        <div class="tokenInfo">
          <a href="advisorlogin.jsp" class="header-btn">Log In</a>
          <a href="quiz.jsp" class="header-btn">Sign Up</a>
        </div>
        <hr />
      </div>
    </div>
    <div class="nft">
      <div class="main">
        <img class="tokenImage" src="https://images.unsplash.com/photo-1621075160523-b936ad96132a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80" alt="NFT" />
        <h2>INVESTOR</h2>
        <div class="tokenInfo">
          <a href="investorlogin.jsp" class="header-btn">Log In</a>
          <a href="register" class="header-btn">Sign Up</a>
        </div>
        <hr />
      </div>
    </div>
    <div class="nft">
      <div class="main">
        <img class="tokenImage" src="https://images.unsplash.com/photo-1621075160523-b936ad96132a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80" alt="NFT" />
        <h2>ANALYST</h2>
        <div class="tokenInfo1">
          <a href="analystlogin.jsp" class="header-btn1">Log In</a>
        </div>
        <hr />
      </div>
    </div>
  </div>
</body>

</html>
