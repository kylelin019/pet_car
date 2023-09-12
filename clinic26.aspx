<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clinic26.aspx.cs" Inherits="medical_map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
   
    <link rel="stylesheet" href="css/clinic26.css" />
   
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet"/>

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css" />
    <link rel="stylesheet" href="./css/owl.theme.default.min.css" />
  
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
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
                                <asp:Label ID="welcomeLabel" runat="server" Text="，您好"></asp:Label>
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
    <!------------------------ Site Title ---------------------->
    <section class="owl-carousel-section">
        <div class="owl-carousel owl-theme first">
            <div class="slide slide-1">
                <div class="slide-content">
                    <h1>毛寶寶獸醫診所</h1>
                    <p>FurBaby Veterinary Clinic</p>
                </div>
            </div>
            <div class="slide slide-2">
                <div class="slide-content">
                    <h1>aaaaaaaaaaaaaaaa</h1>
                    <p>關於這家診所所提供的照片</p>
                </div>
            </div>
            <div class="slide slide-3">
                <div class="slide-content">
                    <h1>think</h1>
                    <p>關於這家診所所提供的照片.</p>
                </div>
            </div>
        </div>
    </section>
    <!------------x----------- Site Title ----------x----------->

    <!---------------------- 醫院簡介 ------------------->
    <!-- Post Page Code start --->
    <section>
        <div class="containerFluid">
            <h2 class="hours-title">診所簡介</h2>
            <p class="clinicintro">Clinic Introduction</p>
            <div class="accordion-container">
                <div class="accordion-wrapper">
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>營業時間</h5>
                    </div>
                    <div class="panel">
                        <div class="text">
                            <table class="textsize">
                                <tr>
                                    <td style="text-align: center">Monday:
                                    </td>
                                    <td class="lefts">8 AM to 4 PM
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Tuesday:
                                    </td>
                                    <td class="lefts">Closed
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Wednesday:
                                    </td>
                                    <td class="lefts">8 AM to 4 PM
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Thursday:
                                    </td>
                                    <td class="lefts">8 AM to 4 PM
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Friday:
                                    </td>
                                    <td class="lefts">8 AM to 4 PM
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Saturday:
                                    </td>
                                    <td class="lefts">8 AM to 4 PM
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Sunday:
                                    </td>
                                    <td class="lefts">Closed
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="accordion-wrapper">
                        <div class="accordion">
                            <div class="icon"></div>
                            <h5>電話號碼</h5>
                        </div>
                        <div class="panel">
                            <table class="textsize">
                                <tr>
                                    <td class="lefts"><a href="tel:089896543">08-9896543</a>  
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="accordion-wrapper">
                            <div class="accordion">
                                <div class="icon"></div>
                                <h5>地址</h5>
                            </div>
                            <div class="panel">
                                <table class="textsize">
                                    <tr>
                                        <td class="lefts">
                                            <a href="https://www.google.com/maps/place/%E8%90%AC%E4%B8%B9%E7%B4%85%E8%B1%86%E9%A4%85/@22.6165382,120.2250932,13z/data=!4m10!1m2!2m1!1z6JCs5Li557SF6LGG6aSF!3m6!1s0x346e0380016ef731:0x502b9cb5167e4340!8m2!3d22.6165382!4d120.297191!15sCg_okKzkuLnntIXosYbppIVaFCIS6JCsIOS4uSDntIXosYYg6aSFkgEOY2hpbmVzZV9wYXN0cnngAQA!16s%2Fg%2F1tnjg9k7?authuser=0&entry=ttu" target="_blank">屏東縣屏東市萬丹鄉</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        var len = acc.length;
        for (i = 0; i < len; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            });
        }
    </script>
    <!-------------------xxx-- 醫院服務簡介 ---------xxx------>

    <!---------------------- 醫院服務簡介 ------------------->
    <div class="section-services" id="services">
       
        <div class="row-fluid">
            <h2 class="services-heading">服務項目</h2>
            <p class="vetservices">Vet Services in Furry Baby Veterinary Clinic</p>
            <div class="list-services">
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-bloodwork.svg" alt="Blood Work" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>貓狗血液工作</h3>
                        </div>
                        <div class="service-content">
                            <p>可以進行家庭寵物血液檢查，以監測您的貓或狗的健康狀況或在需要診斷時進行。</p>
                        </div>
                    </div>
                </div>

                <div class="service-card">

                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-dermatologic.svg" alt="Dermatologic Examination" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>皮膚科檢查</h3>
                        </div>
                        <div class="service-content">
                            <p>
                                在健康或疾病檢查期間，我們的獸醫可以討論食物或環境過敏的症狀以及適合您的寵物的最佳計劃。
                                        可能還需要寵物過敏測試、飲食測試。
                            </p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-ecg.svg" alt="Electrocardiogram (ECG)" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>心電圖 (ECG)</h3>
                        </div>
                        <div class="service-content">
                            <p>心電圖是評估寵物健康狀況的重要診斷工具，它可以測量心臟的電活動，並可以檢測任何異常的節律或心律失常。</p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-neurological.svg" alt="Neurological Examination" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>家庭寵物神經學諮詢</h3>
                        </div>
                        <div class="service-content">
                            <p>在全面的家庭健康檢查或病假訪問期間，我們的流動獸醫可以評估您寵物的症狀和神經功能，作為對您寵物健康狀況進行全面評估的一部分。</p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-ortho.svg" alt="Orthopedic Examination" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>骨科檢查</h3>
                        </div>
                        <div class="service-content">
                            <p>
                                作為寵物健康檢查的一部分，獸醫將評估它們的骨科和神經系統健康狀況。我們可以通過多種方式評估您寵物的骨科功能。
                                        寵物的問題通常表現得非常微妙，因此您務必讓我們知道您在家中注意到的任何變化。
                            </p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-puppy-1.svg" alt="Puppy and Kitten Wellness" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>小狗和小貓健康檢查</h3>
                        </div>
                        <div class="service-content">
                            <p>恭喜您添加新成員！對小狗和小貓進行預防性獸醫檢查是寵物快樂、健康的核心，並提供必要的護理以支持它們的成長和發育。</p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-qol-1.svg" alt="Quality-of-Life Consultation" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>寵物臨終關懷和生活質量服務</h3>
                        </div>
                        <div class="service-content">
                            <p>我們知道看著您的寵物變老或患有慢性病是多麼困難。針對這些情況，我們提供家庭生活質量護理服務——為寵物提供富有同情心的諮詢和臨終服務。</p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-virtual.svg" alt="Virtual Vet Visit" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>虛擬獸醫就診</h3>
                        </div>
                        <div class="service-content">
                            <p>
                                每當您對寵物的症狀、行為或營養需求有疑問或跟進您的獸醫有關健康問題時，請預約遠程醫療或遠程健康諮詢。
                                        無需等待 - 在線聯繫有執照的獸醫，讓您安心無憂。
                            </p>
                        </div>
                    </div>
                </div>
                <div class="service-card">
                    <div class="text">
                        <div class="service-title">
                            <img src="https://bettervet.com/hubfs/ico-vaccination.svg" alt="Vaccination" loading="lazy" width="35" height="35" class="service-icon" />
                            <h3>家庭寵物健康檢查</h3>
                        </div>
                        <div class="service-content" >
                            <p>
                                寵物健康檢查是寵物預防性護理和長期健康的重要組成部分。
                                        在家庭健康檢查期間，您的獸醫將完成從頭到尾的檢查，並討論您寵物的生活方式、營養和行為。
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!---------xx------------- 醫院服務簡介 ----------xx--------->
    <br />
    <br /><br />
    <!---------------------- doctor醫生簡介 -----Card-------------->
    <section="center-wrapper">
       <h2 class="doctor-heading">醫生簡介</h2>
         <p class="doctorintro">Doctor's Profile</p>
    <div class="wrapper">
        <i id="left" class="fa-solid fa-angle-left"></i>
        <ul class="carousel">
            <li class="card">
                <div class="img">
                    <img src="doctor_img/doctor_a.jpg" alt="img" draggable="false" /></div>
                 <div class="card__content">
                     <span class="card__title">毛哲宇</span>
                     <span class="card__name">院長</span>
                     <p class="card__text">國立中興大學獸醫學士、獸醫師國家考試合格、TCVM 傳統中獸醫師認證合格、AOVET 國際小動物骨科認證合格</p>                     
                  </div>               
            </li>
            <li class="card">
                <div class="img">
                    <img src="doctor_img/doctor_d.jpg" alt="img" draggable="false" /></div>
                 <div class="card__content">
                     <span class="card__title">黃世雄</span>
                     <span class="card__name">副院長</span>
                     <p class="card__text">國立中興大學獸醫學士、獸醫師國家考試合格、AOVET 國際小動物骨科認證合格、TCVM 傳統中獸醫師認證合格 </p>              
                  </div>
                      
            </li>
            <li class="card">
                <div class="img">
                    <img src="doctor_img/doctor_c.jpg" alt="img" draggable="false" /></div>
                 <div class="card__content">
                     <span class="card__title">葉曉萱</span>
                     <span class="card__name">獸醫師</span>
                     <p class="card__text">國立嘉義大學獸醫系、國家獸醫師高等考試合格、TCVM 傳統中獸醫師認證合格、小動物心臟超音波臨床認證合格</p>                 
                     </div>  
            </li>

            <li class="card">
                <div class="img">
                    <img src="doctor_img/doctor_b.jpg" alt="img" draggable="false" /></div>       
                <div class="card__content">
                    <span class="card__title">劉詩詩</span>
                     <span class="card__name">獸醫師</span>
                     <p class="card__text">國立台灣大學獸醫學系 畢業、專技高考獸醫師考試合格、小動物心臟超音波臨床認證合格</p>              
                </div>                                
            </li>    
            
            <li class="card">
                <div class="img">
                    <img src="doctor_img/doctor_e.jpg" alt="img" draggable="false" /></div>
                <div class="card__content">
                    <span class="card__title">葉串禾</span>
                     <span class="card__name">獸醫師</span>
                     <p class="card__text">國立嘉義大學獸醫系、國家獸醫師高等考試合格、TAVIM 中華民國獸醫內科醫會會員</p>                     
                </div>                                             
             </li>
        </ul>
        <i id="right" class="fa-solid fa-angle-right"></i>
    </div>          
        </section> 
      <script src="scripts/doctorcard_intro.js" defer=""></script>
   <br /><br />

    <!------xx----------------  doctor醫生簡介 -----------xx-------->
 
<br /><br />
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
            delay: 100,
            duration: 1000,
        });
    </script>
    

    <form id="form1" runat="server">
        <!-- Second Carousel -->
    </form>
    <!-- Jquery Library file -->
    <script src="scripts/jquery-3.7.0.js"></script>

    <!-- --------- Owl-Carousel js ------------------->
    <script src="./scripts/owl.carousel.min.js"></script>

    <!-- Custom Javascript file -->
    <script src="./scripts/main.js"></script>
</body>
</html>
