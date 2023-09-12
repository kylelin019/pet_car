<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>主頁</title>

    <link rel="stylesheet" href="../css/Index.css" />
   
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

    <!-- ---------------------------  Navigation ------------------------- -->
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
                            <a href="clinic_map.aspx"><i class="fa fa-map-marker fa-1x"></i>&nbsp;診所據點</a>
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
    <!-- --------x-----------x--------  Navigation ---------x-------------x--- -->
    <!----------------------------- Main Site Section ------------------------------>
    <main>
        <!------------------------ owl-carousel owl-theme firs---------------------->

        <div class="owl-carousel owl-theme first">
            <div class="slide slide-1">
                <div class="slide-content">
                    <h1><span>～</span> Welcome to PetCare Wisdom Platform</h1>
                    <h2>寵愛智慧平台</h2>
                    <p>透我們的線上預約，獲取寵物健康資訊，即時與獸醫溝通，為寵物提供全面照護，讓寶貴的毛絨朋友永保健康幸福。立即使用我們的平台，提升寵物生活品質！</p>
                    <a href="login.aspx">
                        <button class="slide-btn">
                            <sapn class="slide-span">立即登入</sapn>
                            <ion-icon name="heart-outline" aria-hidden="true"></ion-icon>
                        </button>
                    </a>
                </div>
            </div>
            <div class="slide slide-2">
                <div class="slide-content">
                    <h1><span>～</span> Welcome to PetCare Wisdom Platform</h1>
                    <h2>寵愛智慧平台</h2>
                    <p>透過我們的線上預約，獲取寵物健康資訊，即時與獸醫溝通，為寵物提供全面照護，讓寶貴的毛絨朋友永保健康幸福。立即使用我們的平台，提升寵物生活品質！</p>
                    <a href="login.aspx">
                        <button class="slide-btn">
                            <sapn class="slide-span">立即登入</sapn>
                            <ion-icon name="heart-outline" aria-hidden="true"></ion-icon>
                        </button>
                    </a>
                </div>
            </div>
            <div class="slide slide-3">
                <div class="slide-content">
                    <h1><span>～</span> Welcome to PetCare Wisdom Platform</h1>
                    <h2>寵愛智慧平台</h2>
                    <p>透過我們的線上預約，獲取寵物健康資訊，即時與獸醫溝通，為寵物提供全面照護，讓寶貴的毛絨朋友永保健康幸福。立即使用我們的平台，提升寵物生活品質！</p>
                    <a href="login.aspx">
                        <button class="slide-btn">
                            <sapn class="slide-span">立即登入</sapn>
                            <ion-icon name="heart-outline" aria-hidden="true"></ion-icon>
                        </button>
                    </a>
                </div>
            </div>
        </div>
        <br />
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule="" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <!------------x----------- owl-carousel owl-theme firs----------x----------->
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
        <br /> <br /> <br />
     
        <!-- --------------------Second Carousel------------------- -->
        <section class="intro-2">
            <div class="blog">
                <div class="center-content" data-aos-delay="240" data-aos-duration="5000">
                    <h2 class="clinic-h2"><b>合作</b>動物醫院</h2>
                    <p class="clinic-p">Cooperative Animal Hospital</p>
                </div>

                <div class="clinic-container">
                    <div class="owl-carousel owl-theme blog-post">
                        <div class="blog-content" data-aos="fade-up" data-aos-delay="240" data-aos-duration="5000">
                            <img src="./image/image1.png" alt="post-1" />
                          <div class="blog-title">
                                <h3>屏大獸醫院</h3>
                               <a href="tel:081234567"><span class="phone-number">08-1234567</span></a>
                                <span>屏東縣屏東市民生東路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                          <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>毛寶寶獸醫醫院</h3>
                                 <a href="tel:075784698"><span class="phone-number">07-5784698</span></a>   
                                <span>高雄鳳山區光復路二段</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>                    
                        <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>醫心動物醫院</h3>
                                 <a href="tel:075976431"><span class="phone-number">07-5976431</span></a>             
                                <span>高雄市前鎮區一心二路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                        <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>貳勝獸醫動物醫院</h3>
                                 <a href="tel:074698731"><span class="phone-number">07-4698731</span></a>   
                                <span>高雄市小港區沿海一路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>     
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>廣動醫院</h3>
                                <a href="tel:088256999"><span class="phone-number">08-8256999</span></a>                                
                                <span>屏東縣屏東市復興南路一段</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>屏小獸醫院</h3>
                                 <a href="tel:087654321"><span class="phone-number">08-7654321</span></a>   
                                <span>屏東縣屏東市大武路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>屏中貓狗醫院</h3>
                                 <a href="tel:087541966"><span class="phone-number">08-7541966</span></a>   
                                <span>屏東縣萬丹鄉中興路二段</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>馬雷動物醫院</h3>
                                 <a href="tel:089786352"><span class="phone-number">08-9786352</span></a>   
                                <span>屏東縣潮州鎮</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>泰克爾貓狗醫院</h3>
                                 <a href="tel:076976431"><span class="phone-number">07-6976431</span></a>   
                                <span>高雄市前金區中華三路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>                     
                          <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>高菲動物醫院</h3>
                                 <a href="tel:071111123"><span class="phone-number">07-1111123</span></a>   
                                <span>高雄市九曲堂九曲路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-navigation blog-navigation">
                        <span class="owl-nav-prev" data-aos="fade-up" data-aos-delay="100"><i class="fas fa-long-arrow-alt-left"></i></span>
                        <span class="owl-nav-next" data-aos="fade-up" data-aos-delay="100"><i class="fas fa-long-arrow-alt-right"></i></span>
                    </div>
                </div>
            </div>
        </section>
        <br />
        <br />
        <br />
        <!-- ---------------------- Site Content announce-------------------------->
        <section class="announce-container">
            <div class="site-content">
                <div class="posts">
                    <h2 class="announce-heading">寵物連接</h2>
                    <p class="announce">Pet Connection</p>
                    <h3 class="announce-h3">探索我們精選的寵物醫療和新聞、文章和衛教影片。<a href="connect.aspx"><span class="announce-span">更多寵物資源<i class="fa fa-arrow-right"></i></span></a></h3>
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./connect_img/connect_d.png" class="img" alt="blog1" />
                            </div>
                            <div class="post-info flex-row">
                                <span>健康</span>
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">驚！狗中暑死亡率高達50% 教你4招預防狗中暑，識別狗中暑症狀</a>
                            <p>
                                還沒正式進入夏天，就已經有狗狗開始因為中暑死亡了，狗中暑很容易發生，因為牠們的身體上沒有汗腺，只能靠鼻頭、四個腳掌和舌頭來散熱，
                                還有很多飼主不知道狗中暑的可怕，狗一旦中暑其死亡率為50%，若有以下這些特徵的狗比其他狗狗容易中暑...
                            </p>
                            <br />

                        </div>
                    </div>
                    <hr />
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./connect_img/connect_h.png" class="img" alt="blog1" />
                            </div>
                            <div class="post-info flex-row">
                                <span>生活方式</span>
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">貓為什麼咬人以及如何阻止它們</a>
                            <p>
                                這篇文章，會告訴毛爸媽：為什麼幼貓 / 成貓會咬人？原因有哪些？貓咪咬人前的徵兆？怎麼訓練貓咪不咬人？被貓咪咬流血後要怎麼處理？
                            </p>
                        </div>
                    </div>
                    <hr />
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./connect_img/connect_e.png" class="img" alt="blog1" />
                            </div>
                            <div class="post-info flex-row">
                                <span>訊息公告</span>
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">【海苔貓狗動物醫院】狗狗健檢項目、費用一次搞懂</a>
                            <p>
                                體檢的意義是『預防重於治療』，不見得要等到有症狀才要檢查，若真的檢查到問題才能提前做進一步的治療。
                                狗狗的健檢項目有哪些？可以檢查出什麼？費用是怎麼算？文章一次搞懂！
                            </p>
                            <br />

                        </div>
                    </div>
                    <hr />
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./image/dog_anxiety.png" class="img" alt="blog1" />
                            </div>
                            <div class="post-info flex-row">
                                <span>健康</span>
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">【毛孩照顧】狗狗有分離焦慮症怎麼辦？八種方式教你如何改善！</a>

                            <p>
                                狗狗的分離焦慮症就像人類的憂鬱症一樣，是一種精神疾病，家中沒人時，狗狗的情緒緊張不安、焦慮、
                                無法放鬆，毛爸媽出門多久，狗狗就焦慮多久。通常分離焦慮症需要專業訓練師及動物行為治療師診斷，
                                才能確定狗狗是否患病，自行判定可能會無法得知狗狗是真的患病還是單純擔心毛爸媽出門或喜歡搞破壞。
                                造成狗狗分離焦慮症的原因...
                            </p>
                            <br />

                        </div>
                    </div>

                    <div class="pagination flex-row">
                        <a href="connect.aspx"><i class="fas fa-chevron-left"></i></a>
                        <a href="connect.aspx" class="pages">1</a>
                        <a href="connect.aspx" class="pages">2</a>
                        <a href="connect.aspx" class="pages">3</a>
                        <a href="connect.aspx"><i class="fas fa-chevron-right"></i></a>
                    </div>
                </div>
                <!-- ---------------------- sidrbar -------------------------->
                <aside class="sidebar">
                    <div class="category">
                        <h2 class="featured-heading">相關連結</h2>
                        <p class="featured">Related Links</p>
                        <ul class="category-list">
                            <li class="list-items" data-aos="fade-left" data-aos-delay="100">
                                <a href="platfrom_intro.aspx">寵愛平台<span class="arrow">→</span></a>

                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="200">
                                <a href="pet.aspx">我的寵物<span class="arrow">→</span></a>
                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="400">
                                <a href="appoint_num.aspx">預約掛號<span class="arrow">→</span></a>
                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="500">
                                <a href="appoint_search.aspx">查詢預約<span class="arrow">→</span></a>
                            </li>
                        </ul>
                    </div>
                    <!-- ---------------------- 衛教影片 -------------------------->
                    <div class="popular-post">
                        <h2 class="educational-heading">衛教影片</h2>
                        <p class="educational">Educational Videos</p>
                        <div class="post-content" data-aos="fade-in" data-aos-delay="100">
                            <div class="post-image">
                                <div>
                                    <iframe width="400" height="280" src="https://www.youtube.com/embed/miS6j6DMOTA?si=N8t-sGBSj55mW_Gn" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                                <div class="popular-post-info flex-row">
                                    <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;July 31,
                                        2023</span>
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">想要當個「負責任飼主」就要幫毛孩做到「寵物四要」喔!</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="fade-in" data-aos-delay="120">
                            <div class="post-image">
                                <div>
                                    <iframe width="400" height="280" src="https://www.youtube.com/embed/CT7nFbkswv0" title="YouTube video player" frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                                </div>
                                <div class="popular-post-info flex-row">
                                    <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;July 31,
                                        2023</span>
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">Bloat in dogs is DEADLY! Learn how to prevent, treat and watch for the signs!</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="fade-in" data-aos-delay="140">
                            <div class="post-image">
                                <div>
                                    <iframe width="400" height="280" src="https://www.youtube.com/embed/5AQym1kg5hM" title="YouTube video player" frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                                </div>
                                <div class="popular-post-info flex-row">
                                    <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;July 15,
                                        2023</span>
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">Essential Tips For Happy And Healthy Cat</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="fade-in" data-aos-delay="160">
                            <div class="post-image">
                                <div>
                                    <iframe width="400" height="280" src="https://www.youtube.com/embed/iNDkYWTWxqs" title="YouTube video player" frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                                </div>
                                <div class="popular-post-info flex-row">
                                    <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;July 31,
                                        2023</span>
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">How to Recognize Rabies in Cats / How to Identify Rabies in Cats</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="fade-in" data-aos-delay="180">
                            <div class="post-image">
                                <div>
                                    <iframe width="400" height="280" src="https://www.youtube.com/embed/0o8BEkIvgqA" title="YouTube video player" frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                                </div>
                                <div class="popular-post-info flex-row">
                                    <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;June 5,
                                      2018</span>
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">The 5 Signs Of Heatstroke In Dogs That Dog Owners MUST Know</a>
                            </div>
                        </div>
                        <div class="pagination flex-row">
                            <a href="connect.aspx"><i class="fas fa-chevron-left"></i></a>
                            <a href="connect.aspx" class="pages">1</a>
                            <a href="connect.aspx" class="pages">2</a>
                            <a href="connect.aspx" class="pages">3</a>
                            <a href="connect.aspx"><i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                </aside>
            </div>
        </section>

        <!-- -----------x---------- Site Content -------------x------------>

    </main>
    <br />
    <br />
    <!---------------x------------- Main Site Section ---------------x-------------->
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
            duration: 3000,
        });
    </script>



    <!-- Jquery Library file -->
    <script src="scripts/jquery-3.7.0.js"></script>

    <!-- --------- Owl-Carousel js ------------------->
    <script src="./scripts/owl.carousel.min.js"></script>

    <!-- Custom Javascript file -->
    <script src="./scripts/main.js"></script>
    <!-- ------------ AOS js Library  ------------------------- -->
    <script src="./scripts/aos.js"></script>

</body>
</html>
