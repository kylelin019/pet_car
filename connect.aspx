<%@ Page Language="C#" AutoEventWireup="true" CodeFile="connect.aspx.cs" Inherits="announc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="css/Connect.css" />
   
   

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css" />
    <link rel="stylesheet" href="./css/owl.theme.default.min.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

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

    <form id="form1" runat="server">
        <div class="banner_group">
            
            <p class="txt">最新的寵物健康資訊和寵物照顧建議已經與您同步</p>
        </div>
        <div class="connect-container">
            <h1 class="connect-h1">寵物連接</h1>
            <p class="connect-p">Pet Connection</p>
            <h3 class="connect-h3">探索我們精選的寵物醫療和新聞、文章和衛教影片。</h3>
        </div>
        <div class="nav-container">
            <nav>
            <a href="lifestyle.aspx" class="navlink">生活方式</a>&nbsp;&nbsp;
            <a href="healthy.aspx" class="navlink">健康</a>&nbsp;&nbsp;
            <a href="index.aspx" class="navlink">衛教影片</a>&nbsp;&nbsp;
            <a href="announce.aspx" class="navlink">訊息公告</a>
            </nav>
        </div>
        <br />
        <br />
        <section class="grid-connect">
            <div class="grid">
                <a href="clinic_a.aspx">
                    <div class="grid-item">
                        <div class="card">
                            <img class="card-img" src="./connect_img/connect_a.jpg" />
                            <div class="card-content">
                                <span class="classification">健康</span>
                                <h1 class="card-header">你家的狗吃便便正常嗎？</h1>
                                <p class="card-text">
                                    對於我們毛茸茸的朋友來說，吃便便通常被視為一種不良行為。 您可能會驚訝地發現這是一種自然行為，很少引起關注。                               
                                </p>

                            </div>
                        </div>
                    </div>
                </a>
                <a href="#">
                    <div class="grid-item">
                        <div class="card">
                            <img class="card-img" src="./image/heat_stroke.png" />
                            <div class="card-content">
                                <span class="classification">健康</span>
                                <h1 class="card-header">驚！狗中暑死亡率高達50% 教你4招預防狗中暑，識別狗中暑症狀</h1>
                                <p class="card-text">
                                    還沒正式進入夏天，就已經有狗狗開始因為中暑死亡了，狗中暑很容易發生，因為牠們的身體上沒有汗腺，只能靠鼻頭、四個腳掌和舌頭來散熱，
                                還有很多飼主不知道狗中暑的可怕，根據2017年愛荷...
                                </p>
                            </div>
                        </div>
                    </div>
                </a>
                <div class="grid-item">
                    <div class="card">
                        <img class="card-img" src="./image/dog_medicine.png" />
                        <div class="card-content">
                            <span class="classification">訊息公告</span>
                            <h1 class="card-header">【海苔貓狗動物醫院】狗狗健檢項目、費用一次搞懂</h1>
                            <p class="card-text">
                                體檢的意義是『預防重於治療』，不見得要等到有症狀才要檢查，若真的檢查到問題才能提前做進一步的治療。
                                狗狗的健檢項目有哪些？可以檢查出什麼？費用是怎麼算？文章一次搞懂！
                            </p>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="grid-item">
                        <div class="card">
                            <img class="card-img" src="./connect_img/connect_i.jpg" />
                            <div class="card-content">
                                <span class="classification">生活方式</span>
                                <h1 class="card-header">【毛孩照顧】狗狗有分離焦慮症怎麼辦？八種方式教你如何改善！</h1>
                                <p class="card-text">
                                    狗狗的分離焦慮症就像人類的憂鬱症一樣，是一種精神疾病，家中沒人時，狗狗的情緒緊張不安、焦慮、
                                無法放鬆，毛爸媽出門多久，狗狗就焦慮多久。通常分離焦慮症需要專業訓練師及動物行為...
                                </p>

                            </div>
                        </div>
                    </div>
                </a>
                <div class="grid-item">
                    <div class="card">
                        <img class="card-img" src="./connect_img/connect_c.png" />
                        <div class="card-content">
                            <span class="classification">健康</span>
                            <h1 class="card-header">關於貓腹瀉您需要了解的一切</h1>
                            <p class="card-text">
                                對於健康的成年貓來說，短暫的輕度腹瀉很常見，並且通常會自行消失。 但如果出現腹瀉，也不能忽視。
                            </p>

                        </div>
                    </div>
                </div>
                <div class="grid-item">
                    <div class="card">
                        <img class="card-img" src="./connect_img/connect_b.png" />
                        <div class="card-content">
                            <span class="classification">健康</span>
                            <h1 class="card-header">如果你的狗有腸道蠕蟲該怎麼辦</h1>
                            <p class="card-text">
                                健康的狗通常在感染時不表現症狀。然而，蠕蟲可以傳播給人類和其他動物，必須立即進行治療。對於不同類型的感染，蠕蟲的治療方法各不相同，因此需要糞便檢測來診斷和指導狗隻的蠕蟲治療。
                            </p>
                        </div>
                    </div>
                </div>
                <div class="grid-item">
                    <div class="card">
                        <img class="card-img" src="./connect_img/connect_g.png" />
                        <div class="card-content">
                            <span class="classification">生活方式</span>
                            <h1 class="card-header">6個技巧讓你的狗在夏天保持安全</h1>
                            <p class="card-text">
                                極端的高溫對我們的狗帶來極端的危險，增加了中暑、熱衰竭和傷害的風險。為了保護你的毛茸茸朋友，狗主人應該學會辨識中暑的徵兆以及如何預防它。
                            </p>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="grid-item">
                        <div class="card">
                            <img class="card-img" src="./connect_img/connect_h.png" />
                            <div class="card-content">
                                <span class="classification">生活方式</span>
                                <h1 class="card-header">貓為什麼咬人以及如何阻止它</h1>
                                <p class="card-text">
                                    這篇文章，會告訴毛爸媽：為什麼幼貓 / 成貓會咬人？原因有哪些？貓咪咬人前的徵兆？怎麼訓練貓咪不咬人？被貓咪咬流血後要怎麼處理？
                                </p>

                            </div>
                        </div>
                    </div>
                </a>
                <a href="#">
                    <div class="grid-item">
                        <div class="card">
                            <img class="card-img" src="./connect_img/connect_h.png" />
                            <div class="card-content">
                                <span class="classification">生活方式</span>
                                <h1 class="card-header">貓為什麼咬人以及如何阻止它</h1>
                                <p class="card-text">
                                    這篇文章，會告訴毛爸媽：為什麼幼貓 / 成貓會咬人？原因有哪些？貓咪咬人前的徵兆？怎麼訓練貓咪不咬人？被貓咪咬流血後要怎麼處理？
                                </p>

                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </section>
        <!---------------------page------------------->
        <div class="pagination flex-row">
            <a href="#"><i class="fas fa-chevron-left"></i></a>
            <a href="#" class="pages">1</a>
            <a href="#" class="pages">2</a>
            <a href="#" class="pages">3</a>
            <a href="#"><i class="fas fa-chevron-right"></i></a>
        </div>
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
                    <strong>寵物連接</strong>
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
                delay: 100,
                duration: 1000,
            });
        </script>
    </form>
</body>
</html>
