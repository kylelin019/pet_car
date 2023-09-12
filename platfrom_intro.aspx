<%@ Page Language="C#" AutoEventWireup="true" CodeFile="platfrom_intro.aspx.cs" Inherits="platfrom_intro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>平台簡介</title>
    
    <link rel="stylesheet" href="css/platfrom_intro.css" />
  
    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css" />
     <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css" />
    <link rel="stylesheet" href="./css/owl.theme.default.min.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <style>
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
        @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");
    </style>
</head>
<body>
    <header>
        <div class="container">
            <input type="checkbox" name="" id="check" />
            <div class="logo-container">
                <a href="index.aspx" >
                     <img src="./image/logo-b.png" alt="logo"  width='320'; />
                 </a>  
            </div>

            <div class="nav-btn">
                <div class="nav-links">
                    <ul>
                        <li class="nav-link" style="--i: .6s">
                            <a href="platfrom_intro.aspx"><i class="fa fa-paw fa-1x"></i>&nbsp;寵愛平台</a>
                        </li>
                        <li class="nav-link" style="--i: .85s">
                            <a href="clinic_map.aspx"><i class="fa fa-map-marker fa-1x"></i>&nbsp;醫療據點</a>
                        </li>
                        <li class="nav-link" style="--i: 1.1s">
                            <a href="#"><i class="fa fa-user fa-1x"></i>&nbsp;會員功能<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="pet.aspx">我的寵物</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="appoint_num.aspx">預約掛號</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="appoint_search.aspx">查詢預約</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="inquire_appoint.aspx">病歷資料</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.35s">
                            <a href="connect.aspx"><i class="fa fa-bullhorn fa-1x"></i>&nbsp;寵物連接</a>
                        </li>
                        <li class="log-sign" style="--i: 1.8s">
                            <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label>
                            <asp:Label ID="welcomeLabel" runat="server" Text="，您好"></asp:Label>&nbsp;&nbsp;
                            <asp:Label ID="logoutlabel" runat="server"><a href="logout.aspx" class="btn log">登出</a></asp:Label>
                            <asp:Label ID="loginlabel" runat="server"><a href="login.aspx" class="btn log">登入</a></asp:Label>
                            <asp:Label ID="registerlabel" runat="server"><a href="register.aspx" class="btn sign">註冊</a></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="menu-container">
                <div class="menu">
                    <div></div>
                </div>
            </div>
        </div>
    </header>
    <!------------x----------- Site Title ----------x----------->
    <br />
    <br />
    <main>
        <!-- -------------------- - #ABOUT ------------------------>

      <section class="section about" id="about">
        <div class="container-about">

          <div class="about-banner">

            <h2 class="deco-title">About Us</h2>

            <img src="./image/deco-img.png" width="58" height="261" alt="" class="deco-img" />

            <div class="banner-row">

              <div class="banner-col">
                <img src="./image/image1.png" width="315" height="380" loading="lazy" alt="Tiger"
                  class="about-img w-100" />

                <img src="./image/clinic_map.png" width="386" height="250" loading="lazy" alt="Panda"
                  class="about-img about-img-2 w-100" />
              </div>

              <div class="banner-col">
                <img src="./image/image1.png" width="250" height="277" loading="lazy" alt="Elephant"
                  class="about-img about-img-3 w-100" />

                <img src="./image/image1.png" width="315" height="380" loading="lazy" alt="Deer"
                  class="about-img w-100" />
              </div>
            </div>
          </div>

          <div class="about-content">
            <p class="section-subtitle">          
              <span>～關於我們</span>
            </p>
            <h2 class="section-title">
              寵愛智慧醫療-<strong>寵物預約看診平台</strong>
            </h2>           
            <div class="tab-content">
              <p class="section-text">
               本平台開發一個關於寵物醫療的平台，以滿足現代社會中日益增長的寵物健康需求。儘管人類醫療領域的平台和軟體已經相當成熟，但寵物醫療方面的發展卻相對有限。因此，本團隊建立一個名為「寵愛智慧平台」的應用程式，旨在為寵物飼主和寵物診所提供一個媒合平台。
<br />本平台將提供多種功能，以改善寵物醫療的便利性。對於寵物飼主，他們可以使用平台來管理寵物的檔案，預約醫療服務，並即時諮詢專業的寵物醫生。對於寵物診所，他們可以使用平台查看飼主的預約紀錄，並編輯寵物的診療紀錄，使診所運作更加系統化和高效。
這個專題的目標是滿足寵物市場的需求，提供一個全面的解決方案，既方便了飼主，又幫助了寵物診所提供更好的服務。本團隊希望這個平台能夠填補寵物醫療領域的缺口，為寵物和飼主提供更好的醫療和健康管理工具。
              </p>
              <ul class="tab-list">
                <li class="tab-item">
                  <div class="item-icon">
                    <ion-icon name="checkmark-circle"></ion-icon>
                  </div>
                  <p class="tab-text">預約看診服務</p>
                </li>
                <li class="tab-item">
                  <div class="item-icon">
                    <ion-icon name="checkmark-circle"></ion-icon>
                  </div>
                  <p class="tab-text">即時獸醫諮詢</p>
                </li>
                <li class="tab-item">
                  <div class="item-icon">
                    <ion-icon name="checkmark-circle"></ion-icon>
                  </div>
                  <p class="tab-text">附近寵物診所地圖</p>
                </li>
                <li class="tab-item">
                  <div class="item-icon">
                    <ion-icon name="checkmark-circle"></ion-icon>
                  </div>
                  <p class="tab-text">Charity For Medical</p>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
     <!--  - ionicon link-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
     <script nomodule="" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <br /><br />
        <!---------------------- special service ------------------>
       <section class="special-service" style="background-color: #f7f7f7;">
            <div class="center-special" data-aos="fade-up" data-aos-delay="90">
                <span class="special-heading">特色服務。</span>&nbsp;<span class="special">寵愛共育，健康成長每一步</span>
            </div>

            <div class="row" data-aos="zoom-in-up" data-aos-delay="120">
                <a href="clinic_map.aspx" class="col">
                    <div class="col">
                        <img src="image/undraw_my_current_location_re_whmt.svg" alt="massage" />
                        <h3>查詢附近寵物診所地圖</h3>
                        <p>
                            迅速找到最近的寵物診所！我們整合了地圖功能，讓您輕鬆查找附近的寵物診所，同時提供相關資訊。
                            照顧您的毛小孩從未如此容易，立即點擊尋找最佳醫療照護！
                        </p>
                    </div>
                </a>
                <a href="appoint_num.aspx" class="col">
                    <div class="col">
                        <img src="image/undraw_online_resume_re_ru7s.svg" alt="booking" />
                        <h3>線上預約掛號</h3>
                        <p>「輕鬆預約，寵愛無等候」：我們提供便捷預約系統，讓您隨時安排寵物就診，免去繁瑣排隊，專心照顧您的毛孩。</p>
                    </div>
                </a>
                <a href="connect.aspx" class="col">
                    <div class="col">
                        <img src="image/undraw_education_f8ru.svg" alt="education" />
                        <h3>寵物連接</h3>
                        <p>
                            進入無限寵愛世界，找貼心寵物用品、活動資訊，照顧毛孩。遠程寵物醫療、新聞、專業文章、熱門寵物影片，貼近寵物世界。
                            推動寵物健康教育，護航毛小孩的福祉。                   
                        </p>
                    </div>
                </a>
            </div>

        </section>
        <!-------------xx--------- special service ----------xx-------->
        <!---------------------- 註冊------------------->
     <section class="getstarted">
        <div class="ctn-container">
            <div class="ctn-text">
                <h1 class="getstarted-h1">一個平台，無限關愛</h1>
                <p>輕鬆預約看診，即刻加入我們的行列！</p>
            </div>
            <a href="register.aspx">
                <button class="ctn-btn">立即註冊</button></a>
        </div>
    </section>
    </main>
    <!---------------------- team------------------->
    <section class="team">
          <h1 class="team-h1"  data-aos="fade-up" data-aos-delay="50">研發團隊</h1>
        <div class="grid-wrapper">
                   
            <div class="team-mem" data-aos="zoom-in">
                <img src="abouts/team1.png" alt="" />
                <h1>林意琇</h1>
                <h2>網頁設計</h2>
                <div class="social-profiles">
                    <i class="fa fa-facebook"></i>
                    <i class="fa fa-instagram"></i>
                </div>
            </div>
            <div class="team-mem" data-aos="zoom-in">
                <img src="abouts/team2.png" alt="" />
                <h1>林哲凱</h1>
                <h2>程式設計</h2>
                <div class="social-profiles">
                    <i class="fa fa-facebook"></i>
                    <i class="fa fa-instagram"></i>
                </div>
            </div>
            <div class="team-mem" data-aos="zoom-in">
                <img src="abouts/team3.png" alt="" />
                <h1>張凱淇</h1>
                <h2>網頁設計</h2>
                <div class="social-profiles">
                    <i class="fa fa-facebook"></i>
                    <i class="fa fa-instagram"></i>
                </div>
            </div>
            <div class="team-mem" data-aos="zoom-in">
                <img src="abouts/team4.png" alt="" />
                <h1>賴嘉鎧</h1>
                <h2>程式設計</h2>
                <div class="social-profiles">
                    <i class="fa fa-facebook"></i>
                    <i class="fa fa-instagram"></i>
                </div>
            </div>
        </div>
    </section>
       <br /><br /><br />
    <!----------------------footer------------------->
    <footer>
        <div class="footer-container">
            <!--**comoany-box**-->
            <div class="footer-company-box">
                <!--details-->
                <p>
                    本體系客戶服務時段為週一至週五10:00~12:00、14:00~17:00，不含例假日及國定假日，<br />
                    如需客戶服務請撥 0800-999-111，非服務時段請至「<a href="mailto:s1b01.one@gmail.com" style="color: #66a9a7; font-weight: 600;">客服信箱</a>」頁面留言。
                </p>
                <!--social-box-->
                <div class="footer-social">
                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                </div>
            </div>
            <!--**link-box***-->
            <div class="footer-link-box">
                <strong>會員功能</strong>
                <ul>
                    <li><a href="pet.aspx" style="color: grey"><i class="fa-solid fa-paw"></i>&nbsp;我的寵物</a></li>
                    <li><a href="appoint_num.aspx" style="color: grey"><i class="fa-solid fa-calendar-check"></i>&nbsp;預約掛號</a></li>
                    <li><a href="appoint_search.aspx" style="color: grey"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;查詢預約</a></li>
                </ul>
            </div>
            <!--**link-box***-->
            <div class="footer-link-box">
                <a href="connect.aspx"><strong>寵物連接</strong></a>
                <ul>
                    <li><a href="healthy.aspx" style="color: grey"><i class="fa fa-arrow-right"></i>&nbsp;健康</a></li>
                    <li><a href="lifestyle.aspx" style="color: grey"><i class="fa fa-arrow-right"></i>&nbsp;生活方式</a></li>
                    <li><a href="announce.aspx" style="color: grey"><i class="fa fa-arrow-right"></i>&nbsp;訊息公告</a></li>
                </ul>
            </div>
            <!--**link-box***-->
            <div class="footer-link-box">
                <strong>相關連結</strong>
                <ul>
                    <li><a href="platfrom_intro.aspx" style="color: grey"><i class="fa fa-gratipay"></i>&nbsp;寵愛平台</a></li>
                    <li><a href="medical_map.aspx" style="color: grey"><i class="fa fa-map-marker fa-1x"></i>&nbsp;醫療據點</a></li>
                    <li><a href="mailto:s1b01.one@gmail.com" style="color: grey"><i class="fa-solid fa-envelope"></i>&nbsp;客服信箱</a></li>
                </ul>
            </div>
        </div>
        <hr />
        <div class="copyright">
            <h4>Copyright © 2023 by the Project Team of National Pingtung University  </h4>
        </div>
        <div class="move-up">
            <span><i class="fas fa-arrow-circle-up fa-2x"></i></span>
        </div>
    </footer>
    <!---moveup------->
    <script src="./scripts/moveup.js"></script>
    <!----AOS------->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            offset: 200,
            delay: 70,
            duration: 1000,
        });
    </script>

</body>
</html>
